package ro.isi.restaurant



import org.junit.*
import grails.test.mixin.*

/**
 * ComandaControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(ComandaController)
@Mock(Comanda)
class ComandaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/comanda/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.comandaInstanceList.size() == 0
        assert model.comandaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.comandaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.comandaInstance != null
        assert view == '/comanda/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/comanda/show/1'
        assert controller.flash.message != null
        assert Comanda.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/comanda/list'


        populateValidParams(params)
        def comanda = new Comanda(params)

        assert comanda.save() != null

        params.id = comanda.id

        def model = controller.show()

        assert model.comandaInstance == comanda
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/comanda/list'


        populateValidParams(params)
        def comanda = new Comanda(params)

        assert comanda.save() != null

        params.id = comanda.id

        def model = controller.edit()

        assert model.comandaInstance == comanda
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/comanda/list'

        response.reset()


        populateValidParams(params)
        def comanda = new Comanda(params)

        assert comanda.save() != null

        // test invalid parameters in update
        params.id = comanda.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/comanda/edit"
        assert model.comandaInstance != null

        comanda.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/comanda/show/$comanda.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        comanda.clearErrors()

        populateValidParams(params)
        params.id = comanda.id
        params.version = -1
        controller.update()

        assert view == "/comanda/edit"
        assert model.comandaInstance != null
        assert model.comandaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/comanda/list'

        response.reset()

        populateValidParams(params)
        def comanda = new Comanda(params)

        assert comanda.save() != null
        assert Comanda.count() == 1

        params.id = comanda.id

        controller.delete()

        assert Comanda.count() == 0
        assert Comanda.get(comanda.id) == null
        assert response.redirectedUrl == '/comanda/list'
    }
}
