# 用Vue.extend写有延迟队列的toast组件

### 前言

Vue.extend 可以用来扩展一个 Vue 实例，从而创建一个新的构造函数。这个构造函数可以用来创建可复用的组件。

#### Vue.extend使用

```js
const MyComponent = Vue.extend({
  template: '<div>{{ message }}</div>',
  data: function () {
    return {
      message: 'Hello, World!'
    };
  }
});
```
