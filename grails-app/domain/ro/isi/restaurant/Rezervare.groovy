package ro.isi.restaurant

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class Rezervare implements Serializable {

	Long id
	Long tableId
	Date startDate
	Date endDate
	Masa masa

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append id
		builder.append tableId
		builder.toHashCode()
	}

	boolean equals(other) {
		if (other == null) return false
		def builder = new EqualsBuilder()
		builder.append id, other.id
		builder.append tableId, other.tableId
		builder.isEquals()
	}

	static belongsTo = [Masa]

	static mapping = {
        id generator: "assigned"
		version false
	}

	static constraints = {
		startDate nullable: true, maxSize: 19
		endDate nullable: true, maxSize: 19
	}
}
