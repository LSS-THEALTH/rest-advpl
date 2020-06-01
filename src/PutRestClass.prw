#INCLUDE 'totvs.ch'
#INCLUDE "restful.ch"

//-------------------------------------------------------------------
/*/{Protheus.doc} PutRestClass
Exemplo de PUT

@author Vinicius Ledesma
@since 01/06/2020
/*/
//-------------------------------------------------------------------

WSRESTFUL PutRestClass DESCRIPTION "Exemplo de PUT" FORMAT "application/json"

WSMETHOD PUT DESCRIPTION "Put simples sem nenhuma configura��o." PRODUCES APPLICATION_JSON

END WSRESTFUL

//-------------------------------------------------------------------
/*/{Protheus.doc} PUT
PUT simples sem nenhuma configura��o.

@author Vinicius Ledesma
@since 01/06/2020
/*/
//-------------------------------------------------------------------
WSMETHOD PUT WSSERVICE PutRestClass

Local lRet      as logical
Local cBody     as character

// Pego o ID do path param
If Len(::aURLParms) > 0

    If .T.//MinhaBusca(::aURLParms[1]) //� um id v�lido
        // Pego o Body da requisi��o
        cBody := ::GetContent()
        If !Empty(cBody)

            // Aqui eu fa�o a VALIDA��O e altera��o da informa��o no sistema
            // Depois confirmo o resultado
            If .T.//MinhaAltera��o(::aURLParms[1])
                lRet := .T.
                HTTPSetStatus(204) //No content
            Else
                SetRESTFault(4,"O registro n�o pode ser alterado.",.T.,403)
                lRet := .F.
            EndIf

        Else
            SetRESTFault(3,"Conte�do a ser alterado n�o foi enviado.",.T.,400)
            lRet := .F.
        EndIf
    Else
        SetRESTFault(2,"O ID n�o � v�lido.",.T.,404)
        lRet := .F.
    EndIf

Else
    SetRESTFault(1,"Nenhum ID informado para altera��o.",.T.,400)
    lRet := .F.
EndIf

Return lRet
