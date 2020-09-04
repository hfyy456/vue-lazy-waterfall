
import LazyWaterfall from './src/LazyWaterfall.vue'
import _Vue from 'vue'

LazyWaterfall.install = Vue => {
    if (!Vue) {
        window.Vue = Vue = _Vue
    }
    Vue.component(LazyWaterfall.name, LazyWaterfall)
}
export default LazyWaterfall;