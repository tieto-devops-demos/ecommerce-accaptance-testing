*** Settings ***
Library  AppiumLibrary

Test Teardown  Close Application

*** Variables ***

# ${REMOTE_URL}                   http://localhost:4723/wd/hub
# ${AUTOMATION_NAME}              appium
# ${DEVICE_NAME_ANDROID}          Nexus_5X_API_21
# ${PLATFORM_NAME_ANDROID}        Android
# ${PLATFORM_VERSION_ANDROID}     5.0.2
# ${APP_ANDROID}                  ${/}Users${/}ilppaju${/}Downloads${/}ecommerce-0.0.1-5.apk

${REMOTE_URL}                   http://appium.testdroid.com/wd/hub
${AUTOMATION_NAME}              appium
${DEVICE_NAME_ANDROID}          LG Google Nexus 5X 7.1.1 -Ti
${PLATFORM_NAME_ANDROID}        Android
# ${TESTDROID_APIKEY}

*** Test Cases ***
Validate eCommerce Products
  Open eCommerce Application at Bitbar
  #Open eCommerce Application
  Validate Products

*** Keywords ***

Open eCommerce Application
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME_ANDROID}    platformVersion=${PLATFORM_VERSION_ANDROID}
    ...    deviceName=${DEVICE_NAME_ANDROID}    app=${APP_ANDROID}    automationName=${AUTOMATION_NAME}
    Wait Until Page Contains  Ecommerce  5s

Open eCommerce Application At Bitbar
    Open Application  ${REMOTE_URL}  platformName=${PLATFORM_NAME_ANDROID}  testdroid_apiKey=${TESTDROID_APIKEY}
    ...   testdroid_target=android  testdroid_project=eCommerce Android  testdroid_testrun=build:${BUILD_ID}  testdroid_device=${DEVICE_NAME_ANDROID}
    ...   testdroid_app=${SESSIONKEY}  deviceName=${DEVICE_NAME_ANDROID}

    Wait Until Page Contains  eCommerce  5s
    Sleep  10s

Capture Screenshot On Failure
    Capture Page Screenshot    ${SCREENSHOTS}${/}${TEST NAME}.png

Validate Products
  Click Element  xpath=//android.support.v7.app.ActionBar.Tab[1]

  Element Text Should Be    xpath=//android.widget.RelativeLayout[1]/android.widget.TextView[1]  1
  Element Text Should Be    xpath=//android.widget.RelativeLayout[1]/android.widget.TextView[2]  iPod
  Element Text Should Be    xpath=//android.widget.RelativeLayout[1]/android.widget.TextView[3]  42.0 €

  Element Text Should Be    xpath=//android.widget.RelativeLayout[2]/android.widget.TextView[1]  2
  Element Text Should Be    xpath=//android.widget.RelativeLayout[2]/android.widget.TextView[2]  iPod touch
  Element Text Should Be    xpath=//android.widget.RelativeLayout[2]/android.widget.TextView[3]  21.0 €

  Element Text Should Be    xpath=//android.widget.RelativeLayout[3]/android.widget.TextView[1]  3
  Element Text Should Be    xpath=//android.widget.RelativeLayout[3]/android.widget.TextView[2]  iPod nano
  Element Text Should Be    xpath=//android.widget.RelativeLayout[3]/android.widget.TextView[3]  1.0 €

  Element Text Should Be    xpath=//android.widget.RelativeLayout[4]/android.widget.TextView[1]  4
  Element Text Should Be    xpath=//android.widget.RelativeLayout[4]/android.widget.TextView[2]  Apple TV
  Element Text Should Be    xpath=//android.widget.RelativeLayout[4]/android.widget.TextView[3]  100.0 €
