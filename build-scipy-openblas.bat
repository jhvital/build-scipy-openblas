:: This .bat file was created for an easy run. Note that all of the commands can be ran separately in the anaconda prompt.
@echo off
call conda config --add channels conda-forge
:: Install required packages
call conda install -y apipkg attrs colorama cython execnet more-itertools pluggy py pytest pytest-faulthandler pytest-forked pytest-xdist six
call conda install -y blas numpy nose openblas
call conda install -y freetype jpeg libpng libtiff olefile pillow tk zlib

:: Copy required libraries to the directory where the building process will search
call copy %CONDA_PREFIX%\Library\lib\openblas.lib %CONDA_PREFIX%\libs
call copy %CONDA_PREFIX%\Library\bin\openblas.dll %CONDA_PREFIX%\DLLs

:: Change directory to clone the scipy repository.
call cd c:\
if exist "c:\scipy" (call echo Warning: The folder scipy already exists, skipping the cloning process.) else (call git clone https://github.com/scipy/scipy.git)
echo NOTE: The scipy repoository was cloned to c:\scipy
call cd scipy
echo ATTENTION! The build is about to start. The building process takes a long time and puts a lot of stress on the CPU. In order to avoid overheating, set the maximum cpu frequency to a low value, for example 60 percent. You can do this under the advanced settings of your power plan, on the processor power management tab. By not doing this, you risk placing your machine under high temperature, leading to hardware damage. More info: https://docs.microsoft.com/en-us/windows-hardware/customize/power-settings/configure-processor-power-management-options
pause

:: Start the building process. Protected to avoid ovewritting a successful build.
if exist "C:\scipy\*.whl" (call echo Warning: scipy was already built, skipping build process.) else (call %CONDA_PREFIX%\python.exe -m pip wheel -v -v -v .)

:: Get the created wheel name
call dir /b *.whl > tmp
call set /p WHEEL_NAME=<tmp
call cd c:\ 

:: Install the built wheel in the current environment
call %CONDA_PREFIX%\python.exe -m pip install c:\scipy\%WHEEL_NAME%

:: Clean up.
call del tmp
call set WHEEL_NAME=
@echo on
