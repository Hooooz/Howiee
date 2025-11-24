# 课前手册 PDF 转换指南

**目标文件**: 课前手册-完整版.md
**输出格式**: PDF
**更新时间**: 2025-11-26

---

## 🎯 推荐方案

### 方案一: 使用 Typora (最简单、效果最好) ⭐⭐⭐⭐⭐

**优点**:
- 所见即所得,直接预览效果
- 导出 PDF 质量高,排版专业
- 支持中文字体
- 保留 Markdown 格式样式

**操作步骤**:

1. **下载安装 Typora**
   - 官网: https://typora.io/
   - 免费试用 15 天,或购买永久许可证 ($14.99)

2. **用 Typora 打开文件**
   - 打开 Typora
   - File → Open → 选择 `课前手册-完整版.md`

3. **导出为 PDF**
   - File → Export → PDF
   - 或快捷键: `Command + Shift + E` (Mac) / `Ctrl + Shift + E` (Windows)

4. **PDF 设置建议**
   - 页面大小: A4
   - 页边距: 中等 (2cm)
   - 字体: 系统默认中文字体
   - 启用目录: ✅
   - 启用页码: ✅

**预期效果**:
- 文件大小: 约 1-2 MB
- 页数: 约 30-35 页
- 格式: 保留所有 Markdown 样式(标题、列表、代码块、表格)

---

### 方案二: 使用 VSCode + Markdown PDF 插件 ⭐⭐⭐⭐

**优点**:
- 免费
- VSCode 用户无需额外软件
- 自动化程度高

**操作步骤**:

1. **安装 VSCode 插件**
   - 打开 VSCode
   - 扩展市场搜索 "Markdown PDF"
   - 安装 "Markdown PDF" by yzane

2. **配置插件 (可选)**

   打开 VSCode 设置 (Command/Ctrl + ,), 搜索 "markdown-pdf", 建议配置:

   ```json
   {
     "markdown-pdf.displayHeaderFooter": true,
     "markdown-pdf.headerTemplate": "<div style='font-size:9px; margin-left:1cm;'>汇报引擎 - 课前手册</div>",
     "markdown-pdf.footerTemplate": "<div style='font-size:9px; margin:auto;'><span class='pageNumber'></span> / <span class='totalPages'></span></div>",
     "markdown-pdf.format": "A4",
     "markdown-pdf.margin.top": "1.5cm",
     "markdown-pdf.margin.bottom": "1.5cm",
     "markdown-pdf.margin.right": "1.5cm",
     "markdown-pdf.margin.left": "1.5cm"
   }
   ```

3. **转换为 PDF**
   - 在 VSCode 中打开 `课前手册-完整版.md`
   - 右键点击编辑器
   - 选择 "Markdown PDF: Export (pdf)"
   - PDF 会自动生成在同一目录

**预期效果**:
- 文件大小: 约 1-2 MB
- 页数: 约 28-32 页
- 格式: 基于 Chrome 渲染,样式简洁

---

### 方案三: 使用在线工具 (无需安装) ⭐⭐⭐

**推荐网站**:

1. **Markdown2PDF** (https://md2pdf.netlify.app/)
   - 免费,无需注册
   - 支持自定义 CSS 样式
   - 即时预览

2. **CloudConvert** (https://cloudconvert.com/md-to-pdf)
   - 支持批量转换
   - 保留格式良好
   - 免费额度: 25 次/天

**操作步骤**:

1. **访问网站**
   - 打开推荐的在线工具

2. **上传文件**
   - 点击 "Select File" 或拖拽文件
   - 选择 `课前手册-完整版.md`

3. **自定义样式 (可选)**
   - 选择字体、颜色、页边距
   - 预览效果

4. **导出下载**
   - 点击 "Convert" 或 "Export"
   - 下载生成的 PDF

**预期效果**:
- 文件大小: 约 1-3 MB
- 页数: 约 30-35 页
- 格式: 取决于网站渲染引擎

---

### 方案四: 使用 Pandoc (技术用户) ⭐⭐⭐⭐

**优点**:
- 功能最强大
- 完全可定制
- 支持复杂格式转换

**操作步骤**:

1. **安装 Pandoc**

   Mac (使用 Homebrew):
   ```bash
   brew install pandoc
   brew install --cask basictex  # 安装 LaTeX 引擎
   ```

   Windows:
   - 下载安装包: https://pandoc.org/installing.html

2. **基础转换命令**

   ```bash
   cd "/Users/huangchuhao/Downloads/AI 工具/Cursor 代码库/营客 AI/【产品经理】/06-专题分类/【分享】AI 使用技巧/汇报引擎-11.26"

   pandoc "课前手册-完整版.md" \
     -o "课前手册-完整版.pdf" \
     --pdf-engine=xelatex \
     -V CJKmainfont="PingFang SC" \
     -V geometry:margin=2cm \
     --toc \
     --toc-depth=3
   ```

3. **高级转换 (带样式)**

   创建自定义 CSS 文件 `style.css`:
   ```css
   body {
     font-family: "PingFang SC", "Microsoft YaHei", sans-serif;
     font-size: 11pt;
     line-height: 1.6;
     max-width: 900px;
     margin: auto;
   }

   h1 {
     color: #0066cc;
     border-bottom: 2px solid #0066cc;
     padding-bottom: 0.3em;
   }

   h2 {
     color: #0088cc;
     border-bottom: 1px solid #ddd;
     padding-bottom: 0.2em;
   }

   code {
     background-color: #f4f4f4;
     padding: 2px 5px;
     border-radius: 3px;
   }

   pre {
     background-color: #f8f8f8;
     border: 1px solid #ddd;
     padding: 10px;
     border-radius: 5px;
   }
   ```

   然后使用命令:
   ```bash
   pandoc "课前手册-完整版.md" \
     -o "课前手册-完整版.pdf" \
     --pdf-engine=wkhtmltopdf \
     --css=style.css \
     --toc \
     --toc-depth=3
   ```

**预期效果**:
- 文件大小: 约 1-2 MB
- 页数: 约 30-35 页
- 格式: 高度可定制

---

## 📋 转换前准备

### 检查文件内容

1. **确保文件完整**
   - 检查是否所有章节都存在
   - 验证 VPN 配置部分是否完整

2. **检查特殊字符**
   - Emoji 是否正确显示
   - 中文标点是否正常

3. **链接验证**
   - 确保所有 URL 正确
   - 检查内部锚点链接

### 优化建议

**如果需要更专业的排版**, 可以对 Markdown 文件做以下调整:

1. **添加封面页**
   ```markdown
   <div style="text-align: center; margin-top: 200px;">

   # 汇报引擎 - 课前手册

   **拒绝无效加班:构建你的"汇报引擎"**

   ---

   讲师:Howie 黄楚皓 | 营客科技

   课程时长:60 分钟

   更新时间:2025-11-26

   </div>

   <div style="page-break-after: always;"></div>
   ```

2. **添加分页符**

   在重要章节之间添加分页:
   ```markdown
   ---

   ## 下一章节
   ```

   或使用 HTML:
   ```html
   <div style="page-break-before: always;"></div>
   ```

3. **优化表格**

   确保表格宽度适中,不会超出页面

---

## 🎨 PDF 美化建议

### 颜色方案

- **主标题 (H1)**: 深蓝色 #0066cc
- **副标题 (H2)**: 浅蓝色 #0088cc
- **强调文本**: 橙色 #ff6600
- **代码块**: 浅灰背景 #f8f8f8

### 字体建议

- **正文**: PingFang SC (Mac) / Microsoft YaHei (Windows)
- **代码**: Menlo / Consolas / Monaco
- **英文**: Helvetica Neue / Arial

### 页面设置

- **页面大小**: A4 (210mm × 297mm)
- **页边距**: 上下 2cm, 左右 2cm
- **页眉**: 课程名称
- **页脚**: 页码 (居中)
- **字号**: 正文 11pt, 标题 14-18pt

---

## ✅ 质量检查清单

转换完成后,请检查:

- [ ] 所有章节完整显示
- [ ] VPN 配置章节格式正确
- [ ] 表格对齐且不超出页面
- [ ] 代码块背景色明显
- [ ] 链接可点击(如果支持)
- [ ] Emoji 正确显示
- [ ] 页码连续且正确
- [ ] 中文字体清晰
- [ ] 无乱码
- [ ] 文件大小合理 (< 5MB)

---

## 🚀 快速开始 (推荐流程)

**最快捷的方式**:

1. **使用 Typora** (如果已安装):
   ```
   打开 Typora → 打开文件 → Export → PDF
   ```

2. **使用 VSCode** (如果已安装插件):
   ```
   打开文件 → 右键 → Markdown PDF: Export (pdf)
   ```

3. **使用在线工具** (无需安装):
   ```
   访问 https://md2pdf.netlify.app/ → 上传文件 → 下载 PDF
   ```

**预计耗时**: 1-3 分钟

---

## 📦 发放建议

### 文件命名

建议使用清晰的命名:
```
汇报引擎-课前手册-2025-11-26.pdf
```

### 发送方式

1. **邮件附件**
   - 主题: 【必读】汇报引擎课程 - 课前手册 (含 VPN 配置)
   - 正文强调: "请务必提前 1 天完成 VPN 配置"

2. **云盘分享**
   - 飞书云文档
   - 百度网盘
   - 阿里云盘

3. **微信群/企业微信**
   - 配合文字说明
   - 强调阅读时长和 VPN 配置重要性

### 发送时间

- **最佳时间**: 上课前 2 天
- **提醒时间**: 上课前 1 天再次提醒
- **检查时间**: 上课前 30 分钟确认学员准备情况

---

## 📞 技术支持

如果转换过程中遇到问题:

1. **字体缺失**: 安装对应的中文字体
2. **乱码**: 确保使用 UTF-8 编码
3. **图片丢失**: 确保图片路径正确
4. **样式混乱**: 尝试不同的转换工具

**联系方式**:
- 讲师: Howie 黄楚皓
- 团队: 营客科技产品团队

---

**转换指南结束 | 祝转换顺利!** 📄✨
