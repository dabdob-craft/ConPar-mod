@IF EXIST "%~dp0java.exe" (
  SET "_JAVACMD=%~dp0java.exe"
) ELSE (
  SET "_JAVACMD=java"
)

"%_JAVACMD%" -cp "%~dp0gradle\wrapper\gradle-wrapper.jar" org.gradle.wrapper.GradleWrapperMain %*
