package ro.isi.restaurant

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
            if (!(obj.endDate > obj.startDate)) return ['end.is.smaller']
        }
    }
}
