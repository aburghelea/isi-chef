package ro.isi.restaurant

/**
 * User: Alexandru Burghelea
 * Date: 1/6/13
 * Time: 6:21 PM
 */
class RestaurantService {

    static transactional = true

    def getFreeTables(def params) {
        def startDate = getDate(params, "startDate")
        def endDate = getDate(params, "endDate")

        println ">>>>" + startDate + " -- " + endDate
        def mese = [];
        for (Masa masa : Masa.findAll()) {
            def libera = true

            for (Rezervare rezervare : masa.rezervares) {
                def startIntersect = rezervare.getStartDate() <= startDate && startDate <= rezervare.getEndDate()
                def endIntersect = rezervare.getStartDate() < endDate && endDate <= rezervare.getEndDate();
                if (endIntersect || startIntersect) {
                    libera = false;
                    break;
                }
            }
            if (libera)
                mese.add(masa)
        }

        mese
    }

    def getDate(def params, String preffix) {
        def year = Integer.parseInt(params."${preffix}_year")
        def month = Integer.parseInt(params."${preffix}_month") - 1
        def day = Integer.parseInt(params."${preffix}_day") - 1
        def hour = Integer.parseInt(params."${preffix}_hour")


        def cal = Calendar.getInstance();
        cal.set(Calendar.YEAR, year)
        cal.set(Calendar.MONTH, month)
        cal.set(Calendar.DAY_OF_MONTH, day)
        cal.set(Calendar.HOUR, hour)
        cal.set(Calendar.MINUTE, 0)
        cal.set(Calendar.SECOND, 0)

        cal.getTime()
    }

}
