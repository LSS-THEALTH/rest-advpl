#INCLUDE 'totvs.ch'
#INCLUDE "restful.ch"

//-------------------------------------------------------------------
/*/{Protheus.doc} MinRestClass
Classe WSRESTFul inicial com o m�nimo necess�rio

@author Vinicius Ledesma
@since 18/05/2020
/*/
//-------------------------------------------------------------------

WSRESTFUL MinRestClass DESCRIPTION "API REST com o m�nimo necess�rio."

WSMETHOD GET DESCRIPTION "Get simples sem nenhuma configura��o."

END WSRESTFUL

//-------------------------------------------------------------------
/*/{Protheus.doc} GET
Get simples sem nenhuma configura��o.

@author Vinicius Ledesma
@since 18/05/2020
/*/
//-------------------------------------------------------------------
WSMETHOD GET WSSERVICE MinRestClass
    ::SetResponse('{"MinRestClass":"Success"}')
Return .T.
