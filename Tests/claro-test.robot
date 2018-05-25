*** Settings ***
Documentation  Claro Colombia
Library  SeleniumLibrary

*** Variables ***
# These variables can be overriden on the command line
${BROWSER} =  chrome
${START_URL} =  http://35.190.184.70/Rechazos/

*** Test Cases ***
SMOKE TEST - Validar menú izquierdo 
    Given el sitio está abierto
    Then muestra la opción de 'inicio' en el menú izquierdo
    Then muestra la opción de 'Rechazos' en el menú izquierdo
    Then muestra la opción de 'Auditoría Rechazos' en el menú izquierdo
   
   
SMOKE TEST - Validar navegación menú inicio
    Given el sitio está abierto
    When En el menú 'Inicio'
    Then yo soy enviado a la pagina '$URL\Inicio'
    Then la pantalla Inicio presenta el titulo 'Inicio'
    
#    Rechazos    
SMOKE TEST - Validar navegación menú Rechazos
    Given el sitio está abierto
    When En el menú 'Rechazos'
    Then yo soy enviado a la pagina '$URL\ValidacionRechazo'
    Then la pantalla Inicio presenta el titulo 'Rechazos'
    
SMOKE TEST - VALIDAR campos de la pantalla rechazos
    Given el sitio está abierto
    When En el menú 'Rechazos'
    Then se muestra el campo 'Trámite'
    Then se muestra el campo 'Causal'
    Then se muestra el campo 'Fecha Inicial'
    Then se muestra el campo 'Fecha Final'
    Then se muestra el campo 'Tipo Documento'
    Then se muestra el campo 'Número Documento'
    Then se muestra el campo 'Min:'

    
#   Auditoría Rechazos  
SMOKE TEST - Validar navegación menú Auditoría Rechazos
    Given el sitio está abierto
    When En el menú 'Auditoría Rechazos'
    Then yo soy enviado a la pagina '$URL\AuditoriaRechazo'
    Then la pantalla Inicio presenta el titulo 'Auditoría Rechazos'


*** Keywords ***
el sitio está abierto
	Open Browser  ${START_URL}  ${BROWSER}  remote_url=http://williamjablonski:0f7989c8-6a8a-446f-9148-0c89b6b65de9@ondemand.saucelabs.com:80/wd/hub  desired_capabilities=name:Win8 + Chrome 43,platform:Windows 8.1,browserName:chrome,version:43
