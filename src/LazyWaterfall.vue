<template>
    <div style="width:100%">
        <div class="container">
            <img
                v-for="(img,i) of imgList"
                :style="{width:`${totalWidth}px`,height:`${img.height*(totalWidth/img.width)}px`,left:`${img.left}px`,position:`${img.position}`,top:`${img.top}px`}"
                :key="i"
                :src='img.src'
                :data-src="i"
                class="img"
            />
        </div>
        <div
            class="loading"
            v-show='loading'
        >
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </div>
        <div
            class="none"
            v-show='none'
        >已经到底了</div>

    </div>
</template>

<script>
export default {
    name: 'LazyWaterfall',
    props: {
        list: {
            type: Array,
            default: () => new Array(),
        },
        row: {
            type: Number,
            default: 5,
        },
        padding: {
            type: Number,
            default: 10,
        },
        loadData: {
            type: Function,
        },
    },
    data() {
        return {
            loading: false,
            imgList: null,
            totalWidth: 0,
            size: 0,
            first: true,
            none: false,
            other: [],
        }
    },
    created() {
        this.size = this.list.length
        let width = document.body.clientWidth - this.padding * this.row
        this.totalWidth = width / this.row
        this.setWaterfall(this.list).then((res) => {
            this.imgList = res
        })
        let self = this

        window.addEventListener('resize', function reset() {
            self.totalWidth =
                (document.body.clientWidth - self.padding * self.row) / self.row
            self.setWaterfall(self.list).then((res) => {
                self.imgList = res
            })
        })
        window.addEventListener('scroll', this.reset)
    },
    methods: {
        async reset() {
            let self = this
            if (self.loading == false) {
                let scrollTop =
                    document.documentElement.scrollTop ||
                    document.body.scrollTop
                let clientHeight =
                    document.documentElement.clientHeight ||
                    document.body.clientHeight
                let scrollHeight =
                    document.documentElement.scrollHeight ||
                    document.body.scrollHeight

                if (
                    scrollHeight > clientHeight &&
                    scrollTop + clientHeight === scrollHeight
                ) {
                    await self.loadmore()
                }
                self.totalWidth =
                    (document.body.clientWidth - self.padding * self.row) /
                    self.row
                self.imgList = await self.setWaterfall(self.list)
            }
        },
        async setWaterfall(list) {
            self.loading = true
            let row = this.formatList(list)
            row = this.setPosition(row)
            return row
        },
        formatList(list) {
            let row = []
            let size = list.length
            if (this.imgList == null) {
                for (let j = 0; j < size; j++) {
                    row.push({
                        url: list[j],
                        height: 0,
                        width: 0,
                        position: 'relative',
                        left: (j + 1) * this.padding,
                        top: 0,
                        flag: false,
                        src: null,
                    })
                }
                return row
            }
            return this.imgList
        },
        loadmore() {
            return new Promise((resolve) => {
                let self = this
                self.loading = true
                self.loadData().then((res) => {
                    if (res.length == 0) {
                        self.loading = false
                        self.none = true
                        window.removeEventListener('scroll', self.reset)
                        resolve()
                    } else {
                        for (let j = 0; j < res.length; j++) {
                            self.imgList.push({
                                url: res[j],
                                height: 0,
                                width: 0,
                                position: 'relative',
                                left: (j + 1) * self.padding,
                                top: 0,
                                flag: false,
                                src: null,
                            })
                        }
                        self.loading = false
                        resolve()
                    }
                })
            })
        },
        async setPosition(list) {
            let heights = []

            for (let i = 0; i < this.row; i++) {
                ;[list[i].width, list[i].height] = await this.getSize(
                    list[i].url
                )
                list[i].src = list[i].url

                heights.push([
                    list[i].height * (this.totalWidth / list[i].width),
                    this.totalWidth * i + this.padding * i,
                ])
            }
            let index = this.getMinHeight(heights)
            let maxHeight = Math.max(
                document.documentElement.clientHeight,
                document.getElementsByClassName('container')[0].clientHeight
            )
            let currClient =
                document.documentElement.scrollTop +
                document.documentElement.clientHeight
            for (let i = this.row; i < list.length; i++) {
                if (
                    maxHeight > heights[index][0] &&
                    currClient > heights[index][0]
                ) {
                    if (list[i].flag == false) {
                        ;[list[i].width, list[i].height] = await this.getSize(
                            list[i].url
                        )
                        list[i].flag = true
                    }
                    list[i].position = 'absolute'
                    list[i].left = heights[index][1] + this.padding
                    list[i].top = heights[index][0] + this.padding
                    list[i].src = list[i].url
                    heights[index][0] +=
                        list[i].height * (this.totalWidth / list[i].width) +
                        this.padding
                    index = this.getMinHeight(heights)
                }
            }
            document.getElementsByClassName(
                'container'
            )[0].style.height = `${this.getMaxHeight(heights)}px`
            return list
        },
        getMaxHeight(array) {
            let max = array[0][0]
            array.forEach((item) => {
                if (item[0] > max) {
                    max = item[0]
                }
            })
            return max
        },
        getMinHeight(array) {
            let min = array[0][0]
            let i = 0
            array.forEach((item, index) => {
                if (item[0] < min) {
                    i = index
                }
            })
            return i
        },
        setCol(srcList, row) {
            let total = 0
            let count = 0

            for (let i = 0; i < srcList.length; i++) {
                count++
                total += srcList[i].width
                if (count < row) {
                    srcList[i].per = (srcList[i].width / total) * 100
                } else {
                    count = 0
                    total = 0
                }
            }
            return srcList
        },
        getSize(url) {
            return new Promise((resolve) => {
                let img = new Image()
                img.src = url
                img.onload = () => {
                    resolve([img.width, img.height])
                }
            })
        },
    },
}
</script>
<style  scoped>
.container {
    position: relative;
}
.container::after {
    clear: both;
}
.loading {
    text-align: center;
}
.img {
    white-space: nowrap;
    float: left;
}
.none {
    text-align: center;
}
.loading {
    width: 150px;
    height: 10px;
    margin: 0 auto;
    margin-top: 10px;
    margin-bottom: 10px;
}
.loading span {
    display: inline-block;
    width: 10px;
    height: 100%;
    margin-right: 5px;
    border-radius: 50%;
    background: gray;
    -webkit-animation: load 1.04s ease infinite;
}
.loading span:last-child {
    margin-right: 0px;
}
@-webkit-keyframes load {
    0% {
        opacity: 1;
    }
    100% {
        opacity: 0;
    }
}
.loading span:nth-child(1) {
    -webkit-animation-delay: 0.13s;
}
.loading span:nth-child(2) {
    -webkit-animation-delay: 0.26s;
}
.loading span:nth-child(3) {
    -webkit-animation-delay: 0.39s;
}
.loading span:nth-child(4) {
    -webkit-animation-delay: 0.52s;
}
.loading span:nth-child(5) {
    -webkit-animation-delay: 0.65s;
}
</style>

