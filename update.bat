d:
@echo off

cd /d "D:\cg\knowledge\mkdocs\kontor-db-wiki"

echo Pruefe Wiki...

mkdocs build

if errorlevel 1 (
    echo.
    echo FEHLER beim Erstellen des Wikis.
    pause
    exit /b
)

git add .

set /p MSG=Commit-Nachricht: 

if "%MSG%"=="" set MSG=Wiki Update

git commit -m "%MSG%"
git push
mkdocs gh-deploy

echo.
echo Fertig!
pause