@echo off
    for /r "%CD%" %%f in (.) do (
      //copy "Text.txt" "%%~ff" > nul
    )