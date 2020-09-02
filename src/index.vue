<template>
    <div class="container">
        <img
            v-for="(img,i) of imgList"
            :style="{left:`${img.left}px`,position:`${img.position}`,top:`${img.top}px`}"
            :src="img.url"
            :key='i'
            class="img"
        >

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
                'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1583224751,4221220531&fm=26&gp=0.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
            ],
            column: 1,
            imgList: null,
        }
    },
    created() {
        this.setWaterfall(this.column, this.list).then((res) => {
            this.imgList = res
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
                list.forEach((item) => {
                    pool.push(this.getSize(item))
                })
                Promise.all(pool).then((res) => {
                    for (let j = 0; j < size; j++) {
                        row.push({
                            url: list.splice(0, 1)[0],
                            height: res[j][1],
                            width: res[j][0],
                            position: 'relative',
                            left: 0,
                            top: 0,
                        })
                    }
                    resolve(row)
                })
            })
        },
        setPosition(column, list) {
            let size = list.length
            let row = Math.ceil(size / column)
            let heights = []

            for (let i = 0; i < row; i++) {
                heights.push(list[i].height)
            }
            let index = this.getMinHeight(heights)
            let offset = 0
            let count = 0
            for (let i = row; i < list.length; i++) {
                list[i].position = 'absolute'
                list[i].left = offset
                list[i].top = heights[index]
                heights[index] += list[i].height
                index = this.getMinHeight(heights)
                console.log(index)
                count++
                if (count == row) {
                    count = 0
                    offset = 0
                } else {
                    offset += list[i].width
                }
            }
            console.log(list)
            return list
        },
        getMinHeight(array) {
            let min = array[0]
            let i = 0
            array.forEach((item, index) => {
                if (item < min) {
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
    width: 100%;
}
.item {
}
.img {
    float: left;
    width: 200px;
}
</style>>

