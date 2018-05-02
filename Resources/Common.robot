*** Settings ***
Library  Selenium2Library
Library  SauceLabs.py

*** Variables ***

@{_tmp} 
    ...  browserName: %{browserName},
    ...  platform: %{platform},
    ...  version: %{version},
    ...  name: Robot Sauce Test

${SAUCE_USERNAME}   williamjablonski
${SAUCE_ACCESS_KEY}  0f7989c8-6a8a-446f-9148-0c89b6b65de9
${BROWSER}          %{ROBOT_BROWSER}
${CAPABILITIES}     ${EMPTY.join(${_tmp})} 
${KEY}              ${SAUCE_USERNAME}:${SAUCE_ACCESS_KEY}
${REMOTE_URL}       http://${KEY}@ondemand.saucelabs.com:80/wd/hub
${PAGE_TITLE}       Sauce Labs: Login

*** Keywords ***

Open test browser
    Set Environment Variable   webdriver.gecko.driver   /usr/local/bin/geckodriver
    Open browser  https://saucelabs.com/login/  browser=${BROWSER}
    ...  remote_url=${REMOTE_URL}
    ...  desired_capabilities=${CAPABILITIES}

Close test browser
    Run keyword if  '${REMOTE_URL}' != ''
    ...  Report Sauce status
    ...  ${TEST_NAME} 
    ...  ${TEST_STATUS} 
    Close all browsers
