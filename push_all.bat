@echo off
pushd ..
for /f "delims=" %%D in ('dir /a:d /b') do (
	pushd %%D
	echo git push for %%D
	git push
	popd
	)
popd