package ro.isi.restaurant

class Produs {

    String name
    Long price
    String description
    Long preparationTime
    String code
    String type

    List comandas

    static hasMany = [comandas: Comanda]
    static belongsTo = [Comanda]

    static mapping = {
        id generator: "increment"
        version false
    }

    static constraints = {
        name nullable: true, maxSize: 45
        price nullable: true
        description nullable: true, maxSize: 500
        preparationTime nullable: true
        code nullable: true, maxSize: 45
        type nullable: true, maxSize: 45
    }
}
