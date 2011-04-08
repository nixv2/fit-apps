package general

import auditoria.general.XEquipo

class EquipoService {

    static transactional = true
    def springSecurityService
    def sessionFactory

    List<Equipo> lista(def params) {
        log.debug "Lista de equipos"
        def equipos = []
        if (params?.filtro) {
            equipos = Equipo.listaConFiltro(params.filtro).list(params)
        } else {
            equipos = Equipo.list(params)
        }
        return equipos
    }

    def listaConCantidad(def params) {
        def equipos = []
        def cantidad = 0
        if (params?.filtro) {
            equipos = Equipo.listaConFiltro(params.filtro).list(params)
            cantidad = Equipo.listaConFiltro(params).count()
        } else {
            equipos = Equipo.list(params)
            cantidad = Equipo.count()
        }
        return [lista:equipos, cantidad:cantidad]
    }

    Equipo obtiene(String id) {
        return Equipo.get(id)
    }
	
    Equipo crea(Equipo equipo) {
        equipo.save()
        audita(equipo,"CREAR")
        return equipo
    }

    Equipo actualiza(Equipo equipo) {
        log.debug "Actualizando al equipo $equipo"
        equipo.save()
        audita(equipo,"ACTUALIZAR")
        return equipo
    }

    String elimina(String id) {
        def equipo = Equipo.get(id)
		def detalle = equipo.nombre
        equipo.delete()
        audita(equipo,"ELIMINAR")
        return detalle
    }

    void audita(equipo, actividad) {
        log.debug "[AUDITA] $actividad equipo $equipo"
        def creador = springSecurityService.authentication.name
        def xequipo = new XEquipo(equipo.properties)
        xequipo.equipoId = equipo.id
        xequipo.creador = creador
        xequipo.actividad = actividad
        xequipo.save()
	}
}
