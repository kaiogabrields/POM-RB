*** Settings ***
Resource    ../base.resource

*** Test Cases ***
#campos obrigatórios: firstname,lastname,password,address1,city,state,zip,country,homephone,mobilephone
CDT.01-Cadastro com todos os campos obrigatórios preenchidos corretamente
    Dado que estou na tela de Cadastro final
    Quando preencho todos o campos obrigatórios corretamente
    E clico no botão "Register"
    Então devo conseguir cadastrar um usuário com sucesso

CDT.02-Cadastro com campo de email vazio
    Dado que estou na tela de Cadastro inicial
    Quando não preencho o campo Email
    E clico no botão "Create an account"
    Então a mensagem "Invalid email address" deve ser exibida

CDT.03-Cadastro com email já cadastrado
    Dado que estou na tela de Cadastro inicial
    Quando preencho o campo "Email" com um email ja cadastrado
    E clico no botão "Create an account"
    Então a mensagem "An account using this email address has already been registered. Please enter a valid password or request a new one." deve ser exibida

CDT.04-Cadastro com senha muito curta	
    Dado que estou na tela de Cadastro final
    Quando preencho o campo "Password" com uma valor abaixo de 5 caracteres
    E clico no botão "Register"
    Então a mensagem "password invalid" deve ser exibida

