#INCLUDE 'totvs.ch'
#INCLUDE "restful.ch"

//-------------------------------------------------------------------
/*/{Protheus.doc} PostRestClass
Exemplo de POST

@author Vinicius Ledesma
@since 01/06/2020
/*/
//-------------------------------------------------------------------

WSRESTFUL PostRestClass DESCRIPTION "Exemplo de POST" FORMAT "application/json"

WSMETHOD POST DESCRIPTION "Post simples sem nenhuma configura��o." PRODUCES APPLICATION_JSON

END WSRESTFUL

//-------------------------------------------------------------------
/*/{Protheus.doc} POST
POST simples sem nenhuma configura��o.

@author Vinicius Ledesma
@since 01/06/2020
/*/
//-------------------------------------------------------------------
WSMETHOD POST WSSERVICE PostRestClass

Local cBody     as character
Local cNewID    as character
Local lRet      as logical

// Pego o Body da requisi��o
cBody := ::GetContent()
If !Empty(cBody)

    // Aqui eu fa�o a VALIDA��O e inclus�o da informa��o no sistema
    // Depois eu pego a nova chave gerada na inclus�o e devolvo...
    cNewID := "123"
    ::SetResponse('{"ID":"'+cNewID+'"}')
    lRet := .T.
Else
    SetRESTFault(1,"Conte�do a ser inclu�do n�o foi enviado.",.T.,400)
    lRet := .F.
EndIf

Return lRet
