*** Settings ***
## Bibliotecas
Library    SeleniumLibrary    timeout=15s
Library    FakerLibrary

## Locators
Variables    resource/locators/cadastro_locators.yaml

## Pages
Resource    resource/pages/cadastro_page.resource

## Utils
Resource    resource/utils/open_browser.resource
Resource    resource/utils/custom_keywords.resource

# Data
Resource    resource/data/user.resource


