package ro.isi.restaurant

class Masa {

	Integer number
	String description

	static hasMany = [comandas: Comanda,
	                  rezervares: Rezervare]

	static mapping = {
		id generator: "assigned"
		version false
	}

	static constraints = {
		number nullable: true
		description nullable: true, maxSize: 45
	}
}
