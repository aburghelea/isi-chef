package ro.isi.restaurant

class ProdusService {
    static transactional = true

    def getProductMap() {
        def products = Produs.list()
        def productsMap = new TreeMap<String, LinkedList<Produs>>()

        for (Produs produs : products){
            if (!productsMap.containsKey(produs.type)){
                productsMap.put(produs.type, [])
            }

            productsMap.get(produs.type).add(produs);
        }

        productsMap
    }
}