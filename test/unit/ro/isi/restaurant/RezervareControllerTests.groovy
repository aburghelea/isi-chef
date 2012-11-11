package ro.isi.restaurant



import org.junit.*
import grails.test.mixin.*

/**
 * RezervareControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(RezervareController)
@Mock(Rezervare)
class RezervareControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/rezervare/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.rezervareInstanceList.size() == 0
        assert model.rezervareInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.rezervareInstance != null
    }

    void testSave() {
        controller.save()

        assert model.rezervareInstance != null
        assert view == '/rezervare/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/rezervare/show/1'
        assert controller.flash.message != null
        assert Rezervare.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/rezervare/list'


        populateValidParams(params)
        def rezervare = new Rezervare(params)

        assert rezervare.save() != null

        params.id = rezervare.id

        def model = controller.show()

        assert model.rezervareInstance == rezervare
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/rezervare/list'


        populateValidParams(params)
        def rezervare = new Rezervare(params)

        assert rezervare.save() != null

        params.id = rezervare.id

        def model = controller.edit()

        assert model.rezervareInstance == rezervare
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/rezervare/list'

        response.reset()


        populateValidParams(params)
        def rezervare = new Rezervare(params)

        assert rezervare.save() != null

        // test invalid parameters in update
        params.id = rezervare.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/rezervare/edit"
        assert model.rezervareInstance != null

        rezervare.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/rezervare/show/$rezervare.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        rezervare.clearErrors()

        populateValidParams(params)
        params.id = rezervare.id
        params.version = -1
        controller.update()

        assert view == "/rezervare/edit"
        assert model.rezervareInstance != null
        assert model.rezervareInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/rezervare/list'

        response.reset()

        populateValidParams(params)
        def rezervare = new Rezervare(params)

        assert rezervare.save() != null
        assert Rezervare.count() == 1

        params.id = rezervare.id

        controller.delete()

        assert Rezervare.count() == 0
        assert Rezervare.get(rezervare.id) == null
        assert response.redirectedUrl == '/rezervare/list'
    }
}
