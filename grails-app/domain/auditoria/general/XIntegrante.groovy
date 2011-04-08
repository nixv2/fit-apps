package auditoria.general

class XIntegrante {
	String nombre
	String apellido
	String semestre
    String correo
	Long integranteId
    Date lastUpdated
    String actividad
    String creador

    String nombreCompleto

    static transients = ['nombreCompleto']

    static constraints = {
        nombre blank: false, size:1..64
        apellido blank: false, size:1..64
        semestre maxSize:32, inList:['1','2','3','4','5','6','7','8','9']
        correo blank: false, size:1..64
        actividad size:1..32
        creador size:1..64
    }

    static mapping = {
        table 'xintegrantes'
    }

    static namedQueries = {
        listaConFiltro { filtro ->
            filtro = "%$filtro%"
            or {
                ilike('nombre',filtro)
                ilike('apellido',filtro)
                ilike('semestre',filtro)
                ilike('correo',filtro)
            }
        }
    }

    String getNombreCompleto() {
        return "$nombre, $apellido"
    }

    String toString() {
        return "$nombre, $apellido"
    }
}
