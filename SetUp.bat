@echo off
setlocal enabledelayedexpansion

REM Set environment name
set "ENV_NAME=py39_env"

REM Create Conda environment with Python 3.9
conda create -y -n %ENV_NAME% python=3.9
if errorlevel 1 (
    echo Failed to create Conda environment
    exit /b 1
)

REM Activate the environment
call conda activate %ENV_NAME%
if errorlevel 1 (
    echo Failed to activate Conda environment
    exit /b 1
)

REM Upgrade pip to a specific version
python -m pip install --upgrade pip==24.0
if errorlevel 1 (
    echo Failed to upgrade pip
    exit /b 1
)

REM Install Python dependencies
pip install -r pre-requirements.txt
if errorlevel 1 (
    echo Failed to install pre-requirements
    exit /b 1
)

pip install -r requirements.txt
if errorlevel 1 (
    echo Failed to install requirements
    exit /b 1
)

REM Install Git LFS and clone repo
git lfs install
git clone https://huggingface.co/H-Liu1997/emage_evaltools
if errorlevel 1 (
    echo Failed to clone repository
    exit /b 1
)

echo All steps completed successfully.