#!/bin/bash

# 下载文件并添加标签
curl -s https://raw.githubusercontent.com/5yfx/CF_HK_US_EU_IP/refs/heads/main/%E7%BE%8E%E5%9B%BD.txt | head -n 8 | sed 's/\(.*\)/\1#US-\1/' >us.txt
curl -s https://raw.githubusercontent.com/5yfx/CF_HK_US_EU_IP/refs/heads/main/%E8%8B%B1%E5%9B%BD.txt | head -n 8 | sed 's/\(.*\)/\1#英国-\1/' >uk.txt
curl -s https://raw.githubusercontent.com/5yfx/CF_HK_US_EU_IP/refs/heads/main/%E9%A6%99%E6%B8%AF.txt | head -n 8 | sed 's/\(.*\)/\1#HK-\1/' >hk.txt

# 合并文件
cat us.txt uk.txt hk.txt >result.txt

# 清理临时文件
rm us.txt uk.txt hk.txt

# 提交到git
git add result.txt
git commit -m "Update IP list $(date +'%Y-%m-%d %H:%M:%S')"
git push
