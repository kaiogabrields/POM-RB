*** Settings ***
Resource    ../../base.resource

*** Keywords ***
#Dado
Dado que estou na tela de Cadastro inicial
    Go To    url=${cadastro.url}
    Wait And Validate Element is Visible   ${cadastro.btnCreateAccount}

Dado que estou na tela de Cadastro final
    ${email}    FakerLibrary.Email
    Dado que estou na tela de Cadastro inicial
    Input Text    ${cadastro.inputEmail}    ${email}
    Wait And Input Text    ${cadastro.inputEmail}    ${email}
    E clico no botão "Create an account"
    Wait And Validate Element is Visible    ${cadastro.txtTelaCadastroFinal}

#Quando
Quando não preencho o campo Email
    ${txt_email}    Get Text    ${cadastro.inputEmail}
    IF    $txt_email != ""
        Fail
    END

Quando preencho todos o campos obrigatórios corretamente
    ${firstname}      FakerLibrary.First_Name
    ${lastname}       FakerLibrary.Last_Name
    ${password}       FakerLibrary.Password
    ${address}       FakerLibrary.Address
    ${city}           FakerLibrary.City
    ${zip}            FakerLibrary.Zipcode
    ${homephone}      FakerLibrary.Basic_Phone_Number
    ${mobilephone}    FakerLibrary.Basic_Phone_Number

    Wait And Input Text    ${cadastro.inputFirstName}    ${firstname}
    Wait And Input Text    ${cadastro.inputLastName}    ${lastname}
    Wait And Input Text    ${cadastro.inputAddress}    ${address}
    Wait And Input Text    ${cadastro.inputCity}    ${city}
    Wait Element and Select Option    ${cadastro.selectState}    Alabama
    Wait And Input Text    ${cadastro.inputZip}    ${zip}
    Wait And Input Text    ${cadastro.inputHomePhone}    ${homephone}
    Wait And Input Text    ${cadastro.inputMobilePhone}    ${mobilephone}
    Wait And Input Password    ${cadastro.inputPassword}    ${password}

Quando preencho o campo "Email" com um email ja cadastrado
    Wait And Input Text    ${cadastro.inputEmail}    ${user_login}

Quando preencho o campo "Password" com uma valor abaixo de 5 caracteres
    Wait And Input Text    ${cadastro.inputPassword}    0000

#E
E clico no botão "Create an account"
    Wait And Click Element    ${cadastro.btnCreateAccount}

E clico no botão "Register"
    Wait And Click Element    ${cadastro.btnRegister}

#Então
Então a mensagem "An account using this email address has already been registered. Please enter a valid password or request a new one." deve ser exibida
    Wait And Validate Element is Visible    ${cadastro.msgErroEmailRegistred}

Então a mensagem "Invalid email address" deve ser exibida
    Wait And Validate Element is Visible    ${cadastro.txtEmailInvalido}

Então devo conseguir cadastrar um usuário com sucesso
    Wait And Validate Element is Visible    ${cadastro.msgWelcomeToYourAccount}

Então a mensagem "password invalid" deve ser exibida
    Wait And Validate Element is Visible    ${cadastro.msgPasswordInvalid}
    

