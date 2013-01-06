package ro.isi.restaurant

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class Rezervare implements Serializable {

    Long id
    String name
    Date startDate
    Date endDate
    Masa masa


    static mapping = {
        id generator: "increment"
        version false
    }

    static constraints = {
        startDate nullable: true, maxSize: 19
        endDate nullable: true, maxSize: 19, validator: { val, obj ->
            if (val <= obj.startDate) return ['end.is.smaller']
        }
    }
}
