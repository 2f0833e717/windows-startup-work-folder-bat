:: SJIS（ANSIで保存）
:: PC起動時のスタートアップに登録する.batスクリプト
:: バッチが起動した日付で「memo_yyyymmdd.txt」を「C:\Users\user\work\000_memo\yyyymm\」フォルダ内に作成します。
:: 同様に、「C:\Users\user\work\100_work\yyyymm\」フォルダも作成し、バッチが起動した日付で「C:\Users\user\work\100_work\yyyymm\yyyymmdd\」フォルダを作成します。

@echo off
setlocal

:: 日付を取得
set "raw=%DATE%"
echo Raw date: %raw%

:: yyyy/mm/dd 形式の場合、先頭4文字が年、5文字目以降2文字が月、8文字目以降2文字が日
set "year=%raw:~0,4%"
set "month=%raw:~5,2%"
set "day=%raw:~8,2%"

echo Year: %year%
echo Month: %month%
echo Day: %day%

:: フォルダを作成
set "folder1=C:\Users\user\work\000_memo\%year%%month%"
set "folder2=C:\Users\user\work\100_work\%year%%month%"
set "folder3=C:\Users\user\work\100_work\%year%%month%\%year%%month%%day%"
if not exist "%folder1%" mkdir "%folder1%"
if not exist "%folder2%" mkdir "%folder2%"
if not exist "%folder3%" mkdir "%folder3%"

:: ファイルを作成
set "file1=%folder1%\memo_%year%%month%%day%.txt"
if not exist "%file1%" echo. > "%file1%"

:: サクラエディタを表示「start "" 」でないと開かない、SX,SY,WX,WYで位置調整可能
start "" "C:\Program Files (x86)\sakura\sakura.exe" "%file1%" -SX=630 -SY=720 -WX=800 -WY=10 -GROUP=1
start "" "C:\Program Files (x86)\sakura\sakura.exe" "C:\Users\user\work\001_dayplan\todo.txt" -SX=670 -SY=570 -WX=10 -WY=400 -GROUP=2

endlocal
exit /b




