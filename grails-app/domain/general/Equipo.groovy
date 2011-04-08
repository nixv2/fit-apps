package general

class Equipo {
	String nombre
	String integrante1
	String semestre1
    String integrante2
	String semestre2
    String integrante3
	String semestre3

    static constraints = {
        nombre blank: false, size:1..64
        integrante1 blank: false, size:1..64
        semestre1 maxSize:32, inList:['2','4','6','8']
        integrante2 blank: false, size:1..64
        semestre2 maxSize:32, inList:['2','4','6','8']
        integrante3 blank: false, size:1..64
        semestre3 maxSize:32, inList:['2','4','6','8']
    }

    static mapping = {
        table 'equipos'
    }

    static namedQueries = {
        listaConFiltro { filtro ->
            filtro = "%$filtro%"
            or {
                ilike('nombre',filtro)
                ilike('integrante1',filtro)
                ilike('semestre1',filtro)
                ilike('integrante2',filtro)
                ilike('semestre2',filtro)
                ilike('integrante3',filtro)
                ilike('semestre3',filtro)
            }
        }
    }

    String toString() {
        return "$nombre"
    }
}
