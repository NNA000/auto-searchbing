@echo off
if "%1" neq "" (
    if "%1" equ "install" (
        echo "Installing env..."
        REM create env --> activate env ---> install requirement
        call conda create --name auto-search python==3.10.0
        call conda activate auto-search
        call pip install -r requirements.txt
    ) else if "%1" equ "ur" (
        echo "Updating requirement..."
        REM Just for update requirement
        call pip install -r requirements.txt
    ) else if "%1" equ "urf" (
        echo "Updating requirement file..."
        REM Just for update requirements file
        call pip freeze > requirements.txt
        pip freeze | findstr /v "certifi" > requirements.txt
    ) else (
        if "%1" equ "run" (
            call python flask_app.py
        ) else (
            echo "No one... %0 %1"
        )
    )
) else (
    REM Case when just want to activate environment
    echo "Activating env, to deactivate conda deactivate..."
    call conda activate auto-search
)