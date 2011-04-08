package auditoria.general

class XEquipo {
	String nombre
//    Integrante integrante
	Long equipoId
    Date lastUpdated
    String actividad
    String creador

    static constraints = {
        nombre blank: false, size:1..64
        actividad size:1..32
        creador size:1..64
    }

    static mapping = {
        table 'xequipos'
    }

    static namedQueries = {
        listaConFiltro { filtro ->
            filtro = "%$filtro%"
            or {
                ilike('nombre',filtro)
            }
        }
    }

    String toString() {
        return "$nombre"
    }
}
