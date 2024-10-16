*** Settings ***
Resource    ../../base.resource

*** Keywords ***
Open site AutomationTest
    Open Browser
    ...    url=https://automationtest.shop/index.php
    ...    browser=chrome
    Maximize Browser Window
