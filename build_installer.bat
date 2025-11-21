@echo off
echo Перемещение в папку проекта...
cd /d D:\Programming\Languages\Dart\Projects\easyshoppin_eshop

echo Building Flutter app...
flutter build windows

echo Перемещение к инсталлеру...
cd /d D:\Programming\Languages\Dart\Projects\easyshoppin_eshop\build\windows\x64\runner\Release

echo Compiling setup installer...
"C:\Program Files (x86)\Inno Setup 6\ISCC.exe" installer\setup.iss

echo Build completed!
pause
