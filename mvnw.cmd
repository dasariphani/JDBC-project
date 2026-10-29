@REM ----------------------------------------------------------------------------
@REM Licensed to the Apache Software Foundation (ASF) under one
@REM or more contributor license agreements.  See the NOTICE file
@REM distributed with this work for additional information
@REM regarding copyright ownership.  The ASF licenses this file
@REM to you under the Apache License, Version 2.0 (the
@REM "License"); you may not use this file except in compliance
@REM with the License.  You may obtain a copy of the License at
@REM
@REM    https://www.apache.org/licenses/LICENSE-2.0
@REM
@REM Unless required by applicable law or agreed to in writing,
@REM software distributed under the License is distributed on an
@REM "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
@REM KIND, either express or implied.  See the License for the
@REM specific language governing permissions and limitations
@REM under the License.
@REM ----------------------------------------------------------------------------

@REM ----------------------------------------------------------------------------
@REM Maven Start Up Batch script
@REM
@REM Required ENV Vars:
@REM JAVA_HOME - location of a JDK home dir
@REM ----------------------------------------------------------------------------

@echo off
setlocal

set ERROR_CODE=0

@REM Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" @setlocal

@REM ==== START VALIDATION ====
if not "%JAVA_HOME%" == "" goto OkJHome

echo.
echo Error: JAVA_HOME not found in your environment. >&2
echo Please set the JAVA_HOME variable in your environment to match the >&2
echo location of your Java installation. >&2
echo.
goto error

:OkJHome
if exist "%JAVA_HOME%\bin\java.exe" goto chkMHome

echo.
echo Error: JAVA_HOME is set to an invalid directory. >&2
echo JAVA_HOME = "%JAVA_HOME%" >&2
echo Please set the JAVA_HOME variable in your environment to match the >&2
echo location of your Java installation. >&2
echo.
goto error

:chkMHome
set "DIRNAME=%~dp0"
if "%DIRNAME%" == "" set "DIRNAME=."
set "MAVEN_PROJECTBASEDIR=%DIRNAME%"

set MAVEN_HOME=%USERPROFILE%\.m2\wrapper\dists\apache-maven-3.9.6-bin\apache-maven-3.9.6

if exist "%MAVEN_HOME%\bin\mvn.cmd" goto runMvn

echo Downloading Apache Maven 3.9.6...
set "TEMP_DIR=%USERPROFILE%\.m2\wrapper\dists\apache-maven-3.9.6-bin"
if not exist "%TEMP_DIR%" mkdir "%TEMP_DIR%"
set "ZIP_FILE=%TEMP_DIR%\apache-maven-3.9.6-bin.zip"

powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; (New-Object System.Net.WebClient).DownloadFile('https://archive.apache.org/dist/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.zip', '%ZIP_FILE%')"
if %ERRORLEVEL% neq 0 (
    echo Error downloading Maven. >&2
    goto error
)

echo Extracting Maven...
powershell -Command "Expand-Archive -Path '%ZIP_FILE%' -DestinationPath '%TEMP_DIR%' -Force"

:runMvn
"%MAVEN_HOME%\bin\mvn.cmd" %*
if %ERRORLEVEL% neq 0 goto error
goto end

:error
set ERROR_CODE=1

:end
@endlocal & set ERROR_CODE=%ERROR_CODE%
exit /B %ERROR_CODE%
