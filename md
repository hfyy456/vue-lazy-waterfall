最近在工作中切图发现css需要引入一张图片时，需要手填大小和图片地址比较麻烦，就想着开发一个vscode代码提示插件来快速引入图片。

###zb

使用vscode命令工具生成一个新的插件项目

```bash
yo code
```

选择New Extension即可

###编写

创建完项目后，可以打开项目文件夹，在`src`目录下找到`extension.ts`文件，这是插件的入口文件。在这个文件中，可以编写插件的逻辑代码。

因为需要开发一个遍历文件夹的插件，我们可以从键盘快捷键出发，查询文档，可以在package.json中添加如下

```json
  "activationEvents": [
        "onCommand:extension.loadBgs"  //loadBgs为指令名， 自定义
    ],
 "contributes": {
        "keybindings": [
            {
                "command": "extension.loadBgs", //
                "key": "alt+v", //快捷键组合
                "mac": "option+v"
            }
        ],
 }
```

有这样我们就可以在extension.js，注册方法了

```js
function activate(context) {
      let disposable = vscode.commands.registerCommand(
        "extension.loadBgs",
        async () => {
            // 用户执行alt+v执行的方法
        }
}
```

因为这是一个读取工程文件夹项目的插件，所以我们可以用vscode.workspace.workspaceFolders 获取用户当前的工程目录，我们要做的只要遍历文件夹获取文件下图片的路径、大小就好了，这部分略过。

```js
 const dt = vscode.workspace.workspaceFolders
 const path = dt[0].uri.fsPath
```

拿到图片路径就可以一键替换模板

```js
let teamplate = configuration.fixTeamplate
            .replace("$height", dimensions.height)
            .replace("$width", dimensions.width)
            .replace("$path", `${configuration.alias}/${item.pathName}`)
```

然后使用provideCompletionItems就可以替换生成代码提示了，可以查询官方文档可以通过该函数返回如下的对象数组

![](file://C:\Users\N22162\AppData\Roaming\marktext\images\2023-03-06-21-02-10-image.png?msec=1678107730389)

```javascript
[{
     detail: element.text,
     documentation: element.pathName,
     kind: vscode.CompletionItemKind.Keyword,
     filterText: "@bg" + element.pathName, //显示提示的前缀
     label: element.pathName, //选标签
     insertText: element.text, //选择提示后插入的文本
}]
```

####

####调试插件

在开发插件的过程中，可以使用调试功能来测试插件。在VSCode中，可以使用F5键启动调试。调试过程中，可以设置断点、查看变量值等。调试完成后，可以按Shift+F5键停止调试。

####

####发布

当插件开发完成后，可以将其发布到VSCode的扩展商店中。在发布之前，需要在`package.json`文件中添加一些必要的信息，比如插件的名称、描述、版本号等。然后可以运行以下命令来打包插件：

```bash
npm i -g vsce
vsce package
```

参考

vscode官方文档：https://code.visualstudio.com/api/references/vscode-api
