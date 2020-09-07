## Install
```shell
npm i vue-waterfall-lazyload -S
```
## Quick Start
``` javascript
import Vue from 'vue'
import LazyWaterfall from 'vue-waterfall-lazyload/lib/lazyWaterfall'
Vue.use(LazyWaterfall)
```
## SSR/Nuxt Start
nuxt.config.js
``` javascript
    { src: '@/plugins/no-ssr', ssr: false },
```

plugins/no-ssr

```javascript
import Vue from 'vue'
import LazyWaterfall from 'vue-waterfall-lazyload/lib/lazyWaterfall'
Vue.use(LazyWaterfall)
<client-only>
    <LazyWaterfall />
</client-only>
```
## How to use

#### Attributes

|   参数   |       说明       |   类型   | 默认值 |
| :------: | :--------------: | :------: | :----: |
|   list   |   首屏图片列表   |  Array   |   /    |
|   row    | 每行显示图片个数 |  Number  |   5    |
| padding  |   图片之间间距   |  Number  |   10   |
| loadData |     加载函数     | Function |   /    |

#### loadData

```javascript
loadData() {
            return new Promise((reslove) => {
                setTimeout(function () {
                    reslove([...src])
                }, 3000)
            })
        },
```

