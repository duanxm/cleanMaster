#!/bin/bash

# 部署隐私政策页面到 GitHub Pages
# 使用方法: ./deploy.sh

set -e

echo "🚀 开始部署隐私政策页面..."

# 进入 docs-pages 目录
cd "$(dirname "$0")"

# 获取全局 Git 配置
GLOBAL_USER_NAME=$(git config --global user.name)
GLOBAL_USER_EMAIL=$(git config --global user.email)

# 初始化 git 仓库（如果还没有）
if [ ! -d ".git" ]; then
    git init
    git branch -M gh-pages
    # 使用 SSH URL
    git remote add origin git@github.com:duanxm/cleanMaster.git
fi

# 确保 remote 使用 SSH
if git remote get-url origin | grep -q "https://"; then
    git remote set-url origin git@github.com:duanxm/cleanMaster.git
fi

# 设置本地仓库的 Git 配置（使用全局配置）
git config user.name "$GLOBAL_USER_NAME"
git config user.email "$GLOBAL_USER_EMAIL"

# 添加并提交更改
git add .
git commit -m "Update privacy policy page" || echo "No changes to commit"

# 推送到 GitHub Pages 分支
git push -u origin gh-pages --force

echo "✅ 部署完成！"
echo "🌐 请访问: https://duanxm.github.io/cleanMaster/"
echo ""
echo "注意: GitHub Pages 可能需要几分钟才能更新生效"