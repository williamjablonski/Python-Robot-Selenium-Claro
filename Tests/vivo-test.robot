*** Settings ***
Documentation  MEU VIVO
Library  SeleniumLibrary

*** Variables ***
# These variables can be overriden on the command line
${BROWSER} =  chrome
${START_URL} =  https://hml1036-meuvivo.vivo.com.br/meuvivo
${USERNAME}=    27383669886
${PASSWORD}=    338511

*** Test Cases ***
SMOKE TEST Login meu vivo - menu superior
    Given o site esta aberto
    When eu vejo que estou deslogado
    When eu seleciono o estado SP
    When eu clico em sou cliente
    When eu vou para a tela de login do portal
    When eu preencho o usuario
    When eu preencho a senha
    When eu clico em entrar
    Then o login é executado com sucesso

*** Keywords ***
o site esta aberto
	Open Browser  ${START_URL}  ${BROWSER}  remote_url=http://williamjablonski:0f7989c8-6a8a-446f-9148-0c89b6b65de9@ondemand.saucelabs.com:80/wd/hub  desired_capabilities=name:Win8 + Chrome 43,platform:Windows 8.1,browserName:chrome,version:43
eu vejo que estou deslogado
    Log Title
eu seleciono o estado SP
    Wait Until Element Is Enabled    xpath=//*[@id='campoRegional']
    Input Text     xpath=//*[@id='campoRegional']      São Paulo
    Click Element      xpath=//*[@class='ui-menu-item-custom']
eu clico em sou cliente
    Click Element       xpath=//html/body/div[6]/div/div[2]/div[1]/div[6]/a[1]
eu vou para a tela de login do portal
    Wait Until Element Is Enabled    campo_login
eu preencho o usuario
	Click Element   	campo_login
	Press Key   	id=cpfOuEmail_we   	${USERNAME}
eu preencho a senha
    Wait Until Element Is Enabled   campo_senha
    Click Element   	campo_senha
    Press Key   	xpath=//*[@id="passwordId_we"]   	${PASSWORD}
eu clico em entrar
    Click Link   	btn-entrar-login-we
o login é executado com sucesso
    Wait Until Element Is Enabled    xpath=//*[@id="bImg"]
