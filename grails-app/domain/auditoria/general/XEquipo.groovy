package auditoria.general

class XEquipo {
	String nombre
	String integrante1
	String semestre1
	String correo
    String integrante2
	String semestre2
    String integrante3
	String semestre3
    String usuarioPC2
    String contraseñaPC2
	Long equipoId
    Date lastUpdated
    String actividad
    String creador

    static constraints = {
        nombre blank: false, size:1..64
        integrante1 blank: false, size:1..64
        semestre1 maxSize:32, inList:['2','4','6','8']
		correo blank: false, size:1..64, email:true
        integrante2 blank: false, size:1..64
        semestre2 maxSize:32, inList:['2','4','6','8']
        integrante3 blank: false, size:1..64
        semestre3 maxSize:32, inList:['2','4','6','8']
        usuarioPC2 blank: false, size:1..64
        contraseñaPC2 maxSize:32, blank:false
        actividad size:1..32
        creador size:1..64
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
                ilike('integrante1',filtro)
                ilike('semestre1',filtro)
                ilike('correo',filtro)
                ilike('integrante2',filtro)
                ilike('semestre2',filtro)
                ilike('integrante3',filtro)
                ilike('semestre3',filtro)
                ilike('usuarioPC2',filtro)
            }
        }
    }

    String toString() {
        return "$nombre"
    }
}
