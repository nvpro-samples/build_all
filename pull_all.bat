@echo off
pushd ..
for /f "delims=" %%D in ('dir /a:d /b') do (
	pushd %%D
	echo git pull
	git pull
	popd
	)
popd