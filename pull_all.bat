@echo off

git -C nvpro_core pull --recurse-submodules
git -C nvpro_core2 pull --recurse-submodules

:: Walks through downloaded samples and pulls latest changes
:: Note: doesn't take care of possible merge conflicts
for /f "delims=" %%D in ('dir /a:d /b samples') do (
  echo --------------------------------------------
  echo git -C samples\%%D pull --recurse-submodules
  git -C samples\%%D pull --recurse-submodules
)
