package ro.isi.restaurant

class Masa {

    Long number
    String description

    static hasMany = [comandas: Comanda,
            rezervares: Rezervare]

    static mapping = {
        id generator: "increment"
        version false
    }

    static constraints = {
        number nullable: false
        description nullable: false, maxSize: 45
    }
}
