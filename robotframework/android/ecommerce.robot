*** Settings ***
Library  AppiumLibrary

Test Teardown  Close Application

*** Variables ***

${REMOTE_URL}                   http://localhost:4723/wd/hub
${AUTOMATION_NAME}              appium
${DEVICE_NAME_ANDROID}          Nexus_5X_API_21
${PLATFORM_NAME_ANDROID}        Android
${PLATFORM_VERSION_ANDROID}     5.0.2
${APP_ANDROID}                  /Users${/}ilppaju${/}Downloads${/}ecommerce-0.0.1-5.apk

*** Test Cases ***
Validate Ecommerce Products
  Open eCommerce Application

*** Keywords ***

Open eCommerce Application
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME_ANDROID}    platformVersion=${PLATFORM_VERSION_ANDROID}
    ...    deviceName=${DEVICE_NAME_ANDROID}    app=${APP_ANDROID}    automationName=${AUTOMATION_NAME}
    Wait Until Page Contains  Ecommerce  5s

Capture Screenshot On Failure
    Capture Page Screenshot    ${SCREENSHOTS}${/}${TEST NAME}.png
