<template>
    <div class="container">
        <img
            v-for="(img,i) of imgList"
            :style="{width:`${totalWidth}px`,height:`${img.height*(totalWidth/img.width)}px`,left:`${img.left}px`,position:`${img.position}`,top:`${img.top}px`}"
            :key="i"
            :src='img.src'
            :data-src=img.url
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
                'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=350409649,190622771&fm=26&gp=0.jpg',
                'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1583224751,4221220531&fm=26&gp=0.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=350409649,190622771&fm=26&gp=0.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=350409649,190622771&fm=26&gp=0.jpg',
                'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1583224751,4221220531&fm=26&gp=0.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=350409649,190622771&fm=26&gp=0.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=350409649,190622771&fm=26&gp=0.jpg',
                'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1583224751,4221220531&fm=26&gp=0.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=350409649,190622771&fm=26&gp=0.jpg',
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
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=350409649,190622771&fm=26&gp=0.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=350409649,190622771&fm=26&gp=0.jpg',
                'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1583224751,4221220531&fm=26&gp=0.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=350409649,190622771&fm=26&gp=0.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=350409649,190622771&fm=26&gp=0.jpg',
                'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1583224751,4221220531&fm=26&gp=0.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=350409649,190622771&fm=26&gp=0.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=350409649,190622771&fm=26&gp=0.jpg',
                'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1583224751,4221220531&fm=26&gp=0.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=350409649,190622771&fm=26&gp=0.jpg',
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
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=350409649,190622771&fm=26&gp=0.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=350409649,190622771&fm=26&gp=0.jpg',
                'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1583224751,4221220531&fm=26&gp=0.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=350409649,190622771&fm=26&gp=0.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=350409649,190622771&fm=26&gp=0.jpg',
                'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1583224751,4221220531&fm=26&gp=0.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=350409649,190622771&fm=26&gp=0.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=350409649,190622771&fm=26&gp=0.jpg',
                'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1583224751,4221220531&fm=26&gp=0.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=350409649,190622771&fm=26&gp=0.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
            ],
            other: [
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=350409649,190622771&fm=26&gp=0.jpg',
                'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1583224751,4221220531&fm=26&gp=0.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
                'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=350409649,190622771&fm=26&gp=0.jpg',
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598592567823&di=db6ec46d9060c578ed3e4a75f6d62e25&imgtype=0&src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fstart%2F3%2F1368001350225.jpg',
            ],
            row: 5,
            imgList: null,
            totalWidth: 0,
            size: 0,
            padding: 10,
            first: true,
        }
    },
    created() {
        this.size = this.list.length
        let width = document.body.clientWidth - this.padding * this.row

        console.log(width)
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
        window.addEventListener('scroll', function reset() {
            let scrollTop =
                document.documentElement.scrollTop || document.body.scrollTop
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
                self.loadmore()
            }
            self.totalWidth =
                (document.body.clientWidth - self.padding * self.row) / self.row
            self.setWaterfall(self.list).then((res) => {
                self.imgList = res
            })
        })
    },
    methods: {
        async setWaterfall(list) {
            let row = this.formatList(list)
            console.log(row)
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
            for (let j = 0; j < this.other.length; j++) {
                this.imgList.push({
                    url: this.other[j],
                    height: 0,
                    width: 0,
                    position: 'relative',
                    left: (j + 1) * this.padding,
                    top: 0,
                    flag: false,
                    src: null,
                })
            }
            this.other=[]
        },
        async setPosition(list) {
            let heights = []

            for (let i = 0; i < this.row; i++) {
                [list[i].width, list[i].height] = await this.getSize(
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
            console.log(document.documentElement.clientHeight)
            for (let i = this.row; i < list.length; i++) {
                if (
                    maxHeight > heights[index][0] &&
                    currClient > heights[index][0]
                ) {
                    if (list[i].flag == false) {
                        [list[i].width, list[i].height] = await this.getSize(
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
            console.log(heights)
            console.log(this.getMaxHeight(heights))
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
.container::after {
    clear: both;
}
.item {
}
.img {
    white-space: nowrap;
    float: left;
}
</style>>

