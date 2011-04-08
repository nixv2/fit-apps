package general

import grails.plugins.springsecurity.Secured
import general.Integrante

class EquipoController {

    def equipoService
    def springSecurityService

    def index = {
        redirect(action: lista, params: params)
    }

    def lista = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        def resultado = equipoService.listaConCantidad(params)
        [equipos: resultado.lista, totalDeEquipos: resultado.cantidad]
    }

    def nuevo = {
        Equipo equipo = new Equipo(params)

        return [equipo:equipo]
    }

    def crea = {
        def equipo
        try {
            Equipo.withTransaction {
                equipo = new Equipo(params)
                equipo = equipoService.crea(equipo)

                flash.message = message(code:"equipo.crea",args:[equipo.nombre])
                redirect(action:"lista", id:equipo.id)
            }
        } catch(Exception e) {
            log.error("No se pudo crear el equipo",e)
            if (equipo) {
                equipo.discard()
            }
            flash.message = message(code:"equipo.noCrea")
            render(view:"nuevo", model: [equipo: equipo])
        }
    }

    @Secured(['ROLE_ADMIN'])
    def ver = {
        def equipo = equipoService.obtiene(params.id)
        return [equipo:equipo]
    }

    @Secured(['ROLE_ADMIN'])
    def edita = {
        def equipo = equipoService.obtiene(params.id)
		def integrante = new Integrante(params)
        return [equipo:equipo, integrante:integrante]
    }

    @Secured(['ROLE_ADMIN'])
    def actualiza = {
        def equipo = equipoService.obtiene(params.id)
        try {
            Equipo.withTransaction {
                equipo.properties = params

                equipo = equipoService.actualiza(equipo)

                flash.message = message(code:"equipo.actualiza",args:[equipo.nombre])
                redirect(action:"lista",id:equipo.id)
            }
        } catch(Exception e) {
            log.error("No se pudo actualizar el equipo",e)
            if (equipo) {
                equipo.discard()
            }
            flash.message = message(code:"equipo.noActualiza")
            render(view:"edita",model:[equipo:equipo])
        }
    }
    @Secured(['ROLE_ADMIN'])
    def elimina = {
        try {
            Equipo.withTransaction {
                def nombre = equipoService.elimina(params.id)
                flash.message = message(code:"equipo.baja",args:[nombre])
                redirect(action:'lista')
            }
        } catch(Exception e) {
            log.error("No se pudo dar de baja el equipo",e)
            flash.message = message(code:"equipo.noBaja")
            render(view:'ver',model:[equipo:equipoService.obtiene(params.id)])
        }
    }
}

