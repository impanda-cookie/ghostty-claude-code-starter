# 别再手搓终端环境了：我把 Ghostty + Claude Code 常用配置做成了一键安装

如果你最近在 Mac 上高频跑 Claude Code，大概率已经感受到系统自带终端的上限了。能用，但不够顺。窗口多开时切换不利落，界面也偏朴素；一边看日志、一边跑测试、一边继续敲命令时，体验很容易变得割裂。

我最近把这套常用环境整理成了一个轻量 starter：核心是 Ghostty + Oh My Zsh，再补上自动补全、语法高亮、`eza` 和 `yazi`。目标不是把终端堆成一个很重的“全家桶”，而是让 Claude Code 多开、目录切换、日志观察这些高频动作，尽量少打断思路。

这套 starter 做了几件最值钱的小事。第一，Ghostty 直接给你一份可用的基础配置，字体、间距、透明度和点击捕获都先配好。第二，Oh My Zsh 默认切到 `agnoster`，同时装上 `zsh-autosuggestions` 和 `zsh-syntax-highlighting`，补全和防呆体验会立刻明显很多。第三，顺手把 `ls`、`ll`、`lt` 接到 `eza`，再加一个 `y` 命令包装 `yazi`，看目录和切目录都更顺。

我刻意把安装流程拆成了两步：`install.sh` 负责装依赖，`apply.sh` 负责应用配置和做备份。这样既保留了一键 setup 的爽感，也避免了脚本上来就粗暴覆盖你的环境。你如果已经有自己的 `~/.zshrc`，它也不会整份抹掉，而是只改主题、插件，并追加一段受控的 starter block。

如果你想快速体验，可以直接 clone 仓库后执行：

```bash
./install.sh
./apply.sh
source ~/.zshrc
```

这不是一个“什么都想管”的 dotfiles 仓库，而是一套更贴近 Claude Code 工作流的 Mac 终端起步配置。重点不是炫，而是顺手。
