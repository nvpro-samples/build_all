@echo off
pushd ..
for /f "delims=" %%D in ('dir /a:d /b') do (
	pushd %%D
	if exist .git (
	echo "--------------------------------------------"
	echo "git pull --recurse-submodules # %%D"
	git pull
	)
	popd
	)
popd