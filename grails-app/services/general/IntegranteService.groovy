package general

import auditoria.general.XIntegrante

class IntegranteService {

    static transactional = true
    def springSecurityService
    def sessionFactory

    List<Integrante> lista(def params) {
        log.debug "Lista de integrantes"
        def integrantes = []
        if (params?.filtro) {
            integrantes = Integrante.listaConFiltro(params.filtro).list(params)
        } else {
            integrantes = Integrante.list(params)
        }
        return integrantes
    }

    def listaConCantidad(def params) {
        def integrantes = []
        def cantidad = 0
        if (params?.filtro) {
            integrantes = Integrante.listaConFiltro(params.filtro).list(params)
            cantidad = Integrante.listaConFiltro(params).count()
        } else {
            integrantes = Integrante.list(params)
            cantidad = Integrante.count()
        }
        return [lista:integrantes, cantidad:cantidad]
    }

    Integrante obtiene(String id) {
        return Integrante.get(id)
    }
	
    Integrante crea(Integrante integrante) {
        integrante.save()
        audita(integrante,"CREAR")
        return integrante
    }

    Integrante actualiza(Integrante integrante) {
        log.debug "Actualizando al integrante $integrante"
        integrante.save()
        audita(integrante,"ACTUALIZAR")
        return integrante
    }

    String elimina(String id) {
        def integrante = Integrante.get(id)
        String detalle = integrante.nombre
        integrante.delete()
        audita(integrante,"ELIMINAR")
        return detalle
    }

    void audita(integrante, actividad) {
        log.debug "[AUDITA] $actividad integrante $integrante"
        def creador = springSecurityService.authentication.name
        def xintegrante = new XIntegrante(integrante.properties)
        xintegrante.integranteId = integrante.id
        xintegrante.creador = creador
        xintegrante.actividad = actividad
        xintegrante.save()
	}
}
