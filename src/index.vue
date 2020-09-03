<template>
    <div class="container">
        <img
            v-for="(img,i) of imgList"
            :style="{width:`${totalWidth}px`,left:`${img.left}px`,position:`${img.position}`,top:`${img.top}px`}"
            :src="img.url"
            :key="i"
            class="img"
        />
    </div>
</template>

<script>
export default {
    name: 'App',
    components: {},
    data() {
        return {
            list: [
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=350409649,190622771&fm=26&gp=0.jpg',
                'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1583224751,4221220531&fm=26&gp=0.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=350409649,190622771&fm=26&gp=0.jpg',
                'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1583224751,4221220531&fm=26&gp=0.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=350409649,190622771&fm=26&gp=0.jpg',
                'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1583224751,4221220531&fm=26&gp=0.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=350409649,190622771&fm=26&gp=0.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
            ],
            column: 4,
            imgList: null,
            totalWidth: 0,
            size: 0,
            padding: 10,
        }
    },
    created() {
        this.size = this.list.length
        let width = document.body.clientWidth

        console.log(width)
        this.totalWidth = width / Math.ceil(this.size / this.column)
        this.setWaterfall(this.column, this.list).then((res) => {
            this.imgList = res
        })
        let self = this

        window.addEventListener('resize', function reset() {
            self.totalWidth =
                document.body.clientWidth / Math.ceil(self.size / self.column)
            self.setWaterfall(self.column, self.list).then((res) => {
                self.imgList = res
            })
        })
    },
    methods: {
        async setWaterfall(column, list) {
            let row = await this.formatList(column, list)
            row = this.setPosition(column, row)
            return row
        },
        formatList(column, list) {
            return new Promise((resolve) => {
                let row = []
                let pool = []
                let size = list.length
                if (this.imgList == null) {
                    list.forEach((item) => {
                        pool.push(this.getSize(item))
                    })
                    Promise.all(pool).then((res) => {
                        for (let j = 0; j < size; j++) {
                            row.push({
                                url: list[j],
                                height: res[j][1],
                                width: res[j][0],
                                position: 'relative',
                                left: (j + 1) * this.padding,
                                top: 0,
                            })
                        }
                        resolve(row)
                    })
                } else {
                    resolve(this.imgList)
                }
            })
        },
        setPosition(column, list) {
            let size = list.length
            let row = Math.ceil(size / column)
            let heights = []

            for (let i = 0; i < row; i++) {
                heights.push([
                    list[i].height * (this.totalWidth / list[i].width),
                    this.totalWidth * i + this.padding * i,
                ])
            }
            let index = this.getMinHeight(heights)
            for (let i = row; i < list.length; i++) {
                list[i].position = 'absolute'
                list[i].left = heights[index][1] + this.padding
                list[i].top = heights[index][0] + this.padding
                heights[index][0] +=
                    list[i].height * (this.totalWidth / list[i].width) +
                    this.padding
                index = this.getMinHeight(heights)
            }
            return list
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
            //  console.log(srcList[0].width)
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
.item {
}
.img {
    float: left;
}
</style>>

