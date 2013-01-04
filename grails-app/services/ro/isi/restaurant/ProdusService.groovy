package ro.isi.restaurant

/**
 * ProdusService
 * A service class encapsulates the core business logic of a Grails application
 */
class ProdusService {

    static transactional = true


    def productsByCriteria(def criteria) {
        def result = Produs.createCriteria().list(criteria).collect() {
            Produs it ->
                [
                        code: it.code,
                        description: it.description,
                        id: it.id,
                        name: it.name,
                        stock: it.stock,
                        preparationTime: it.preparationTime,
                        price: it.price,
                        type: it.type,
                ]
        }
        result
    }

    def decrementStocks(List produses) {
        produses.each {
            Produs it ->
                def baseProduct = Produs.findById(it.id);
                baseProduct.stock--;
                baseProduct.save(failOnError: true, flush: true)
        }
    }

    def getProductMap() {
        def products = Produs.list()
        def productsMap = new TreeMap<String, LinkedList<Produs>>()

        for (Produs produs : products) {
            if (!productsMap.containsKey(produs.type)) {
                productsMap.put(produs.type, [])
            }

            productsMap.get(produs.type).add(produs);
        }

        productsMap
    }
}
