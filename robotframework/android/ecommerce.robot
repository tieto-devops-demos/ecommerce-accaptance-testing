*** Settings ***
Library  AppiumLibrary

Test Teardown  Close Application

*** Variables ***

#${REMOTE_URL}                   http://localhost:4723/wd/hub
#${AUTOMATION_NAME}              appium
#${DEVICE_NAME_ANDROID}          Nexus_5X_API_21
${PLATFORM_NAME_ANDROID}        Android
#${PLATFORM_VERSION_ANDROID}     5.0.2
#${APP_ANDROID}                  /Users${/}ilppaju${/}Downloads${/}ecommerce-0.0.1-5.apk

${REMOTE_URL}                   http://appium.testdroid.com/wd/hub
${AUTOMATION_NAME}              appium
${DEVICE_NAME_ANDROID}          LG Google Nexus 5X 7.1.1 -Ti
${PLATFORM_NAME_ANDROID}        Android
#${TESTDROID_APIKEY}

*** Test Cases ***
Validate eCommerce Products
  Open eCommerce Application at Bitbar

*** Keywords ***

Open eCommerce Application
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME_ANDROID}    platformVersion=${PLATFORM_VERSION_ANDROID}
    ...    deviceName=${DEVICE_NAME_ANDROID}    app=${APP_ANDROID}    automationName=${AUTOMATION_NAME}
    Wait Until Page Contains  Ecommerce  5s

Open eCommerce Application At Bitbar
    Open Application  ${REMOTE_URL}  platformName=${PLATFORM_NAME_ANDROID}  testdroid_apiKey=${TESTDROID_APIKEY}
    ...   testdroid_target=android  testdroid_project=eCommerce Android  testdroid_testrun=build:${BUILD_ID}  testdroid_device=${DEVICE_NAME_ANDROID}
    ...   testdroid_app=latest  deviceName=${DEVICE_NAME_ANDROID}

    Wait Until Page Contains  Ecommerce  5s

Capture Screenshot On Failure
    Capture Page Screenshot    ${SCREENSHOTS}${/}${TEST NAME}.png
