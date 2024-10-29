:: SJIS
:: 仕様
:: PC起動時のスタートアップに登録する.batスクリプト
:: バッチが起動した日付で「memo_yyyymmdd.txt」を「C:\Users\user\work\000_memo\yyyymm\」フォルダ内に作成します。
:: 同様に、「C:\Users\user\work\100_work\yyyymm\」フォルダも作成し、バッチが起動した日付で「C:\user\user\work\100_work\yyyymm\yyyymmdd\」フォルダを作成します。

@echo off
setlocal enabledelayedexpansion

:: 日付を取得
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime .format:list')do set datetime=%%I
set year=%datetime:~0,4%
set month=%datetime:~4,2%
set day=%datetime:~6,2%

:: フォルダを作成
set folder1=C:\Users\user\work\000_memo\%year%%month%
set folder2=C:\Users\user\work\100_work\%year%%month%
set folder3=C:\Users\user\work\100_work\%year%%month%\%year%%month%%day%
if not exist %folder1% mkdir %folder1%
if not exist %folder2% mkdir %folder2%
if not exist %folder3% mkdir %folder3%

:: ファイルを作成
set file1=%folder1%\memo_%year%%month%%day%.txt
if not exist %file1% echo. > %file1%

:: サクラエディタを表示「start "" 」でないと開かない、SX,SY,WX,WYで位置調整可能
start "" "C:\Program Files (x86)\sakura\sakura.exe" %file1% -SX=630 -SY=720 -WX=800 -WY=10 -GROUP=1
start "" "C:\Program Files (x86)\sakura\sakura.exe" "C:\Users\user\work\001_dayplan\todo.txt" -SX=670 -SY=570 -WX=10 -WY=400 -GROUP=2

:: exit /b
