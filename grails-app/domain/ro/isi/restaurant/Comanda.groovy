package ro.isi.restaurant



import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder
import ro.isi.auth.User

class Comanda implements Serializable {

    User waiter
    Masa masa
    User cook

    List produses
    static hasMany = [produses: Produs]
    static belongsTo = [Masa, User]

    static mapping = {
        id generator: "increment"
        version false
    }

    static constraints = {
        produses nullable: true
        masa nullable: true
    }

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

    @Override
    public String toString() {
        return id;
    }
}
