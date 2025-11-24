# GitHub Pages 部署说明

## 步骤1: 在GitHub上创建仓库

1. 访问 https://github.com/new
2. 仓库名称: `ai-tools-presentation` (或其他你喜欢的名字)
3. 设置为 **Public** (公开)
4. **不要**勾选 "Add a README file"
5. 点击 "Create repository"

## 步骤2: 推送代码到GitHub

在终端执行以下命令(已经在正确的目录):

```bash
# 添加远程仓库 (替换为你创建的仓库地址)
git remote add origin https://github.com/Hooooz/ai-tools-presentation.git

# 推送代码
git push -u origin main
```

## 步骤3: 配置GitHub Pages

1. 进入你的GitHub仓库页面
2. 点击 **Settings** (设置)
3. 在左侧菜单找到 **Pages**
4. 在 "Source" 下拉菜单选择:
   - Branch: `main`
   - Folder: `/ (root)`
5. 点击 **Save**

## 步骤4: 获取在线预览链接

等待1-2分钟后,GitHub Pages会自动部署。

你的演示链接将是:
```
https://hooooz.github.io/ai-tools-presentation/demo-v3-refined.html
```

## 快捷脚本

如果你想直接运行,可以复制以下命令:

```bash
cd "/Users/huangchuhao/Downloads/AI 工具/Cursor 代码库/营客 AI/【产品经理】/06-专题分类/【分享】AI 使用技巧/汇报引擎-11.26"

git remote add origin https://github.com/Hooooz/ai-tools-presentation.git
git push -u origin main
```

然后按照步骤3配置GitHub Pages即可。

---

**注意**: 如果你想使用其他仓库名,记得修改上面的URL中的仓库名称。
