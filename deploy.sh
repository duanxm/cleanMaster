#!/bin/bash

# 部署隐私政策页面到 GitHub Pages
# 使用方法: ./deploy.sh

set -e

echo "🚀 开始部署隐私政策页面..."

# 进入 docs-pages 目录
cd "$(dirname "$0")"

# 初始化 git 仓库（如果还没有）
if [ ! -d ".git" ]; then
    git init
    git branch -M gh-pages
    git remote add origin https://github.com/duanxm/cleanMaster.git
fi

# 添加并提交更改
git add .
git commit -m "Update privacy policy page" || echo "No changes to commit"

# 推送到 GitHub Pages 分支
git push -u origin gh-pages --force

echo "✅ 部署完成！"
echo "🌐 请访问: https://duanxm.github.io/cleanMaster/"
echo ""
echo "注意: GitHub Pages 可能需要几分钟才能更新生效"