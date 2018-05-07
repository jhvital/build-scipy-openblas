This .bat file was created for an easy run. Note that all of the commands can be ran separately in the anaconda prompt.
It clones the latest scipy source code and builds and installs a scipy wheel for the current conda environment.

Requires:
	1. Miniconda
	   https://conda.io/miniconda.html
	
	2. Microsoft Visual Studio Build Tools:
	   https://wiki.python.org/moin/WindowsCompilers

Usage:
	1. Open an Anaconda Prompt and activate the environment you want to install scipy with openBLAS.
	2. Change to the directory where the build-scipy-openblas.bat is and run the batch file. Just type build-scipy-openblas in the prompt.
	3. The batch will install the required packages to build and will pause before the build starts. Make sure you read the attention warning about adjusting the processor power to avoid overheating. More info: https://docs.microsoft.com/en-us/windows-hardware/customize/power-settings/configure-processor-power-management-options
	4. Continue with the build.
	5. Check the installation by importing scipy and its submodules in a python script