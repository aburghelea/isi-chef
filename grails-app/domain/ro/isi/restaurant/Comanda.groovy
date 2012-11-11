package ro.isi.restaurant



import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder
import ro.isi.auth.User

class Comanda implements Serializable {

    Long id
    User waiter
    Masa masa
    User cook

    int hashCode() {
        def builder = new HashCodeBuilder()
        builder.append id
        builder.toHashCode()
    }

    boolean equals(other) {
        if (other == null) return false
        def builder = new EqualsBuilder()
        builder.append id, other.id
        builder.isEquals()
    }

    static hasMany = [produses: Produs]
    static belongsTo = [Masa, User]

    static mapping = {
        id generator: "assigned"
        version false
    }
}
