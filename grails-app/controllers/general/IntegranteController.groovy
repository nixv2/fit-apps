package general

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])

class IntegranteController {

    def integranteService
    def springSecurityService

    def index = {
        redirect(action: lista, params: params)
    }

    def lista = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        def resultado = integranteService.listaConCantidad(params)
        [integrantes: resultado.lista, totalDeIntegrantes: resultado.cantidad]
    }

    def nuevo = {
        Integrante integrante = new Integrante(params)

        return [integrante:integrante]
    }

    def crea = {
        def integrante
        try {
            Integrante.withTransaction {
                integrante = new Integrante(params)
                integrante = integranteService.crea(integrante)

                flash.message = message(code:"integrante.crea",args:[integrante.nombre])
                redirect(action:"lista", id:integrante.id)
            }
        } catch(Exception e) {
            log.error("No se pudo crear el integrante",e)
            if (integrante) {
                integrante.discard()
            }
            flash.message = message(code:"integrante.noCrea")
            render(view:"nuevo", model: [integrante: integrante])
        }
    }

    def ver = {
        def integrante = integranteService.obtiene(params.id)
        return [integrante:integrante]
    }

    def edita = {
        def integrante = integranteService.obtiene(params.id)
        return [integrante:integrante]
    }

    def actualiza = {
        def integrante = integranteService.obtiene(params.id)
        try {
            Integrante.withTransaction {
                integrante.properties = params

                integrante = integranteService.actualiza(integrante)

                flash.message = message(code:"integrante.actualiza",args:[integrante.nombre])
                redirect(action:"lista",id:integrante.id)
            }
        } catch(Exception e) {
            log.error("No se pudo actualizar el integrante",e)
            if (integrante) {
                integrante.discard()
            }
            flash.message = message(code:"integrante.noActualiza")
            render(view:"edita",model:[integrante:integrante])
        }
    }

    def elimina = {
        try {
            Integrante.withTransaction {
                def nombre = integranteService.elimina(params.id)
                flash.message = message(code:"integrante.baja",args:[nombre])
                redirect(action:'lista')
            }
        } catch(Exception e) {
            log.error("No se pudo dar de baja el integrante",e)
            flash.message = message(code:"integrante.noBaja")
            render(view:'ver',model:[integrante:integranteService.obtiene(params.id)])
        }
    }
}

