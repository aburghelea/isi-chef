import ro.isi.restaurant.CodeGenerator
import ro.isi.restaurant.Produs

class ProductBootStrap {

    CodeGenerator codeGenerator = new CodeGenerator()

    private static final String DRINKS = "Drinks"
    def init = {
        addDeserts()
        addFirstDishes()
        addSoups()
        addColdDishes()
        addDrinks()

    }

    def addDeserts() {
        new Produs(name: "Icecream" , price: 4, description: "Strawberry, Chocolate etc " , preparationTime: 3,
                code: codeGenerator.getNextCode("DESERT"), type: "DESERTS")
                .save(failOnError: true, flush: true)
        new Produs(name: "Cookies" , price: 4, description: "Strawberry, Chocolate etc " , preparationTime: 1,
                code: codeGenerator.getNextCode("DESERT"), type: "DESERTS")
                .save(failOnError: true, flush: true)
    }

    def addFirstDishes() {

        new Produs(name: "Steak" , price: 15 , description: "Steak 0.25Kg" , preparationTime: 25,
                code: codeGenerator.getNextCode("FIRST"), type: "First dishes")
                .save(failOnError: true, flush: true)

        new Produs(name: "French Fries" , price: 3 , description: "French Fries 0.3" , preparationTime: 14,
                code: codeGenerator.getNextCode("FIRST"), type: "First dishes")
                .save(failOnError: true, flush: true)

        new Produs(name: "Bolognese pasta" , price: 9 , description: "Bolognese pasta" , preparationTime: 12,
                code: codeGenerator.getNextCode("FIRST"), type: "First dishes")
                .save(failOnError: true, flush: true)

    }

    def addSoups() {
        new Produs(name: "A la Greck Chicken Soup", price: 7.2, description: "Chicken, Cream and other",
                preparationTime: 15, code: codeGenerator.getNextCode("SOUP"), type: "Soups")
                .save(failOnError: true, flush: true)
        new Produs(name: "Beef Soup", price: 7.2, description: "Beef soup", preparationTime: 14,
                code: codeGenerator.getNextCode("SOUP"), type: "Soups")
                .save(failOnError: true, flush: true)
        new Produs(name: "Vegetables Soup", price: 6.2, description: "Only vegetables", preparationTime: 12,
                code: codeGenerator.getNextCode("SOUP"), type: "Soups")
                .save(failOnError: true, flush: true)
    }

    def addDrinks() {
        new Produs(name: "Cola", price: 3.3, description: "Coka Cola 0.33L", preparationTime: 0,
                code: codeGenerator.getNextCode("SODA"), type: 'Soda drinks')
                .save(failOnError: true, flush: true)
        new Produs(name: "Fanta", price: 3.3, description: "Fanta 0.33L", preparationTime: 0,
                code: codeGenerator.getNextCode("SODA"), type: 'Soda drinks')
                .save(failOnError: true, flush: true)
        new Produs(name: "Limonade", price: 9.3, description: "Home made lemonade, 1L", preparationTime: 0,
                code: codeGenerator.getNextCode("SODA"), type: 'Soda drinks')
                .save(failOnError: true, flush: true)
        new Produs(name: "Carrot Juice", price: 8.3, description: "Home made carrot juice, 0.75L", preparationTime: 0,
                code: codeGenerator.getNextCode("SODA"), type: 'Soda drinks')
                .save(failOnError: true, flush: true)
        new Produs(name: "Mineral water", price: 2.9, description: "Mineral water 0.5L", preparationTime: 0,
                code: codeGenerator.getNextCode("SODA"), type: 'Soda drinks')
                .save(failOnError: true, flush: true)
    }

    def addColdDishes() {


        new Produs(name: "Cheese", price: 1.3, description: "Chedar Cheese, 0.1Kg", preparationTime: 3,
                code: codeGenerator.getNextCode("COLD"), type: 'Cold dishes')
                .save(failOnError: true, flush: true)

        new Produs(name: "Peperroni", price: 2.4, description: "Italian Pepperoni, 0.1Kg", preparationTime: 2,
                code: codeGenerator.getNextCode("COLD"), type: 'Cold dishes')
                .save(failOnError: true, flush: true)

        new Produs(name: "Caesar Salad", price: 11.2, description: "Classical Caesar salad, should list ingredients", preparationTime: 13,
                code: codeGenerator.getNextCode("COLD"), type: 'Cold dishes')
                .save(failOnError: true, flush: true)

    }

}