#!/bin/bash

# Markdown 转 HTML (带样式)
# 使用 Python markdown 库

cat > temp-convert.py << 'PYTHON'
import markdown
from markdown.extensions.toc import TocExtension
from markdown.extensions.tables import TableExtension
from markdown.extensions.fenced_code import FencedCodeExtension

# 读取 Markdown 文件
with open('课前手册-完整版.md', 'r', encoding='utf-8') as f:
    md_content = f.read()

# 配置 Markdown 扩展
extensions = [
    TocExtension(title='目录', toc_depth=3),
    TableExtension(),
    FencedCodeExtension(),
    'markdown.extensions.nl2br',
    'markdown.extensions.sane_lists'
]

# 转换为 HTML
html_body = markdown.markdown(md_content, extensions=extensions)

# HTML 模板
html_template = f"""<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>汇报引擎 - 课前手册</title>
    <style>
        @page {{
            size: A4;
            margin: 2cm;
        }}
        
        body {{
            font-family: "PingFang SC", "Microsoft YaHei", "Helvetica Neue", Arial, sans-serif;
            font-size: 11pt;
            line-height: 1.8;
            color: #333;
            max-width: 900px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
        }}
        
        /* 标题样式 */
        h1 {{
            color: #0066cc;
            border-bottom: 3px solid #0066cc;
            padding-bottom: 0.5em;
            margin-top: 2em;
            font-size: 2em;
        }}
        
        h2 {{
            color: #0088cc;
            border-bottom: 2px solid #e0e0e0;
            padding-bottom: 0.3em;
            margin-top: 1.5em;
            font-size: 1.6em;
        }}
        
        h3 {{
            color: #009999;
            margin-top: 1.2em;
            font-size: 1.3em;
        }}
        
        h4 {{
            color: #555;
            margin-top: 1em;
            font-size: 1.1em;
        }}
        
        /* 引用块 */
        blockquote {{
            background-color: #fff8dc;
            border-left: 4px solid #ff9800;
            padding: 15px 20px;
            margin: 1em 0;
            border-radius: 4px;
        }}
        
        /* 代码块 */
        code {{
            background-color: #f5f5f5;
            padding: 2px 6px;
            border-radius: 3px;
            font-family: "Monaco", "Menlo", "Consolas", monospace;
            font-size: 0.9em;
            color: #c7254e;
        }}
        
        pre {{
            background-color: #f8f8f8;
            border: 1px solid #ddd;
            border-left: 4px solid #0066cc;
            padding: 15px;
            border-radius: 5px;
            overflow-x: auto;
            line-height: 1.5;
        }}
        
        pre code {{
            background-color: transparent;
            padding: 0;
            color: #333;
        }}
        
        /* 表格 */
        table {{
            border-collapse: collapse;
            width: 100%;
            margin: 1.5em 0;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }}
        
        th {{
            background-color: #0066cc;
            color: white;
            padding: 12px;
            text-align: left;
            font-weight: 600;
        }}
        
        td {{
            border: 1px solid #ddd;
            padding: 10px;
        }}
        
        tr:nth-child(even) {{
            background-color: #f9f9f9;
        }}
        
        tr:hover {{
            background-color: #f5f5f5;
        }}
        
        /* 列表 */
        ul, ol {{
            margin: 1em 0;
            padding-left: 2em;
        }}
        
        li {{
            margin: 0.5em 0;
        }}
        
        /* 链接 */
        a {{
            color: #0066cc;
            text-decoration: none;
        }}
        
        a:hover {{
            text-decoration: underline;
        }}
        
        /* 复选框列表 */
        ul li:has(input[type="checkbox"]) {{
            list-style: none;
            margin-left: -1.5em;
        }}
        
        /* 强调 */
        strong {{
            color: #d9534f;
            font-weight: 600;
        }}
        
        em {{
            color: #5bc0de;
            font-style: italic;
        }}
        
        /* 水平线 */
        hr {{
            border: none;
            border-top: 2px solid #e0e0e0;
            margin: 2em 0;
        }}
        
        /* 特殊标记 */
        .warning {{
            background-color: #fff3cd;
            border-left: 4px solid #ffc107;
            padding: 15px;
            margin: 1em 0;
        }}
        
        /* 打印样式 */
        @media print {{
            body {{
                max-width: 100%;
                padding: 0;
            }}
            
            h1, h2, h3 {{
                page-break-after: avoid;
            }}
            
            pre, blockquote, table {{
                page-break-inside: avoid;
            }}
            
            a {{
                color: #0066cc;
                text-decoration: none;
            }}
            
            a[href^="http"]:after {{
                content: " (" attr(href) ")";
                font-size: 0.8em;
                color: #666;
            }}
        }}
        
        /* 目录样式 */
        .toc {{
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
            padding: 20px;
            margin: 2em 0;
            border-radius: 5px;
        }}
        
        .toc ul {{
            list-style: none;
            padding-left: 1em;
        }}
        
        .toc a {{
            color: #0066cc;
        }}
    </style>
</head>
<body>
    <div style="text-align: center; margin-bottom: 50px; padding: 40px 0; border-bottom: 3px solid #0066cc;">
        <h1 style="border: none; color: #0066cc; font-size: 2.5em; margin: 0;">汇报引擎 - 课前手册</h1>
        <p style="font-size: 1.2em; color: #666; margin-top: 10px;">拒绝无效加班:构建你的"汇报引擎"</p>
        <p style="color: #999;">讲师:Howie 黄楚皓 | 营客科技 | 更新时间:2025-11-26</p>
    </div>
    
    {html_body}
    
    <div style="margin-top: 50px; padding-top: 30px; border-top: 2px solid #e0e0e0; text-align: center; color: #999;">
        <p>© 2025 营客科技 | 汇报引擎课程</p>
    </div>
</body>
</html>
"""

# 保存 HTML 文件
with open('课前手册-完整版-可打印.html', 'w', encoding='utf-8') as f:
    f.write(html_template)

print("✅ HTML 文件生成成功: 课前手册-完整版-可打印.html")
print("📄 请在浏览器中打开,然后使用 打印 → 另存为PDF")
PYTHON

# 执行 Python 脚本
python3 temp-convert.py

# 清理临时文件
rm temp-convert.py

echo ""
echo "=== 转换完成 ==="
echo "HTML 文件: 课前手册-完整版-可打印.html"
echo ""
echo "打印为 PDF 步骤:"
echo "1. 用浏览器打开 HTML 文件"
echo "2. 按 Command+P (Mac) 或 Ctrl+P (Windows)"
echo "3. 选择 '另存为 PDF'"
echo "4. 保存为: 汇报引擎-课前手册-2025-11-26.pdf"

