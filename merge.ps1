# 下载文件并添加标签
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/5yfx/CF_HK_US_EU_IP/refs/heads/main/%E7%BE%8E%E5%9B%BD.txt" -OutFile us.txt
(Get-Content us.txt | Select-Object -First 8) | ForEach-Object { $_ -replace '^(.*)$', '$1#US-$1' } | Set-Content us.txt

Invoke-WebRequest -Uri "https://raw.githubusercontent.com/5yfx/CF_HK_US_EU_IP/refs/heads/main/%E8%8B%B1%E5%9B%BD.txt" -OutFile uk.txt
(Get-Content uk.txt | Select-Object -First 8) | ForEach-Object { $_ -replace '^(.*)$', '$1#英国-$1' } | Set-Content uk.txt

Invoke-WebRequest -Uri "https://raw.githubusercontent.com/5yfx/CF_HK_US_EU_IP/refs/heads/main/%E9%A6%99%E6%B8%AF.txt" -OutFile hk.txt
(Get-Content hk.txt | Select-Object -First 8) | ForEach-Object { $_ -replace '^(.*)$', '$1#HK-$1' } | Set-Content hk.txt

# 合并文件
Get-Content us.txt, uk.txt, hk.txt | Set-Content result.txt

# 清理临时文件
Remove-Item us.txt, uk.txt, hk.txt

# 提交到git
git add result.txt
git commit -m "Update IP list $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
git push
