@echo off
cls
echo [41;93m ### DOS: Removing previous deploy folder... ### [0m
rmdir /S /Q deploy\
echo [42;93m --- Step Complete --- [0m
echo [41;93m ### GIT: Cloning the current build into a new deploy folder... ### [0m
call git clone https://github.com/pucechan/pucechan.github.io deploy
cd deploy
echo [42;93m --- Step Complete --- [0m
echo [41;93m ### GIT: Changing to the master branch to be safe ### [0m
call git checkout master
cd ..
echo [42;93m --- Step Complete --- [0m
echo [41;93m ### HEXO: Wiping the previous generation... ### [0m
call hexo clean
echo [42;93m --- Step Complete --- [0m
echo [41;93m ### HEXO: Regenerating static site... ### [0m
call hexo g
echo [42;93m --- Step Complete --- [0m
cd public
echo [41;93m ### DOS: Copying files from Public to Deploy... ### [0m
call xcopy /E /Y * ..\deploy
cd ..\deploy
echo [42;93m --- Step Complete --- [0m
echo [41;93m ### GIT: Stage all added files... ### [0m
call git add -A
echo [42;93m --- Step Complete --- [0m
echo [41;93m ### GIT: Commit Changes... ### [0m
call git commit -a -m "Site updated!"
echo [42;93m --- Step Complete --- [0m
echo [41;93m ### GIT: Push Changes to remote master... ### [0m
call git push origin master --force
cd ..
echo [42;93m ### DONE ### [0m