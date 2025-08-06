@echo off
REM Windows 批处理脚本：批量 PNG 预乘 Alpha 输出到 output 文件夹

REM 检查 ImageMagick 命令
where magick >nul 2>&1
if errorlevel 1 (
    echo Error: ImageMagick 未安装或 magick 命令不可用。
    echo 請先安裝 ImageMagick 並配置好 PATH 環境變量。
    pause
    exit /b 1
)

REM 创建输出目录
if not exist output (
    mkdir output
)

REM 遍历当前目录所有 PNG 文件，进行预乘 Alpha 处理
for %%F in (*.png) do (
    echo 处理文件：%%F
    magick "%%F" -alpha on -channel RGBA -channel-fx "r=r*a, g=g*a, b=b*a, a=a" "output\%%F"
)

echo 预乘 Alpha 处理完成，结果在 output 文件夹
pause
