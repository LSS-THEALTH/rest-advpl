#INCLUDE 'totvs.ch'
#INCLUDE "restful.ch"

//-------------------------------------------------------------------
/*/{Protheus.doc} DeleteRestClass
Exemplo de DELETE

@author Vinicius Ledesma
@since 01/06/2020
/*/
//-------------------------------------------------------------------

WSRESTFUL DeleteRestClass DESCRIPTION "Exemplo de DELETE" FORMAT "application/json"

WSMETHOD DELETE DESCRIPTION "Delete simples sem nenhuma configura��o." PRODUCES APPLICATION_JSON

END WSRESTFUL

//-------------------------------------------------------------------
/*/{Protheus.doc} DELETE
DELETE simples sem nenhuma configura��o.

@author Vinicius Ledesma
@since 01/06/2020
/*/
//-------------------------------------------------------------------
WSMETHOD DELETE WSSERVICE DeleteRestClass

Local lRet      as logical

// Pego o ID do path param

If Len(::aURLParms) > 0
    // Aqui eu fa�o a VALIDA��O e dele��o da informa��o no sistema
    // Depois confirmo o resultado
    If .T.//MeuDelete(::aURLParms[1])
        lRet := .T.
        //HTTPSetStatus(204) //No content
        HTTPSetStatus(202,"Criada agendamento de dele��o do resgitro " + ::aURLParms[1] +". C�digo de consulta: 123.")
    Else
        SetRESTFault(2,"O registro n�o pode ser deletado.",.T.,403)
        lRet := .F.
    EndIf
Else
    SetRESTFault(1,"Nenhum ID informado para dele��o.",.T.,400)
    lRet := .F.
EndIf

Return lRet
