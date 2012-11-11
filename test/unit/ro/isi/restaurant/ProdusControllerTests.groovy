package ro.isi.restaurant



import org.junit.*
import grails.test.mixin.*

/**
 * ProdusControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(ProdusController)
@Mock(Produs)
class ProdusControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/produs/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.produsInstanceList.size() == 0
        assert model.produsInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.produsInstance != null
    }

    void testSave() {
        controller.save()

        assert model.produsInstance != null
        assert view == '/produs/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/produs/show/1'
        assert controller.flash.message != null
        assert Produs.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/produs/list'


        populateValidParams(params)
        def produs = new Produs(params)

        assert produs.save() != null

        params.id = produs.id

        def model = controller.show()

        assert model.produsInstance == produs
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/produs/list'


        populateValidParams(params)
        def produs = new Produs(params)

        assert produs.save() != null

        params.id = produs.id

        def model = controller.edit()

        assert model.produsInstance == produs
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/produs/list'

        response.reset()


        populateValidParams(params)
        def produs = new Produs(params)

        assert produs.save() != null

        // test invalid parameters in update
        params.id = produs.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/produs/edit"
        assert model.produsInstance != null

        produs.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/produs/show/$produs.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        produs.clearErrors()

        populateValidParams(params)
        params.id = produs.id
        params.version = -1
        controller.update()

        assert view == "/produs/edit"
        assert model.produsInstance != null
        assert model.produsInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/produs/list'

        response.reset()

        populateValidParams(params)
        def produs = new Produs(params)

        assert produs.save() != null
        assert Produs.count() == 1

        params.id = produs.id

        controller.delete()

        assert Produs.count() == 0
        assert Produs.get(produs.id) == null
        assert response.redirectedUrl == '/produs/list'
    }
}
