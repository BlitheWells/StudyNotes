#### 新建 VUE 项目，使用 element-ui，并使用 eslint
1. 安装最新版本 node.js

1. 安装 vue

1. 初始化 project：vue init webpack ${project-name}

1. 安装主题 npm i element-ui -S

1. 安装VSCode, 安装 ESLint 和 Vetur 两个插件

1. 设置.eslintrc.js, 添加 rules
<pre>
'rules': {
    // allow paren-less arrow functions
    'arrow-parens': 0,
    // allow async-await
    'generator-star-spacing': 0,
    // allow debugger during development
    'no-debugger': process.env.NODE_ENV === 'production' ? 2 : 0,
    'space-before-function-paren': 0,
    'one-var': 0
}
</pre>
