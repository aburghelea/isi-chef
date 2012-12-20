package ro.isi.restaurant

import grails.test.mixin.Mock
import grails.test.mixin.TestFor

/**
 * MasaControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(MasaController)
@Mock(Masa)
class MasaControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/masa/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.masaInstanceList.size() == 0
        assert model.masaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.masaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.masaInstance != null
        assert view == '/masa/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/masa/show/1'
        assert controller.flash.message != null
        assert Masa.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/masa/list'


        populateValidParams(params)
        def masa = new Masa(params)

        assert masa.save() != null

        params.id = masa.id

        def model = controller.show()

        assert model.masaInstance == masa
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/masa/list'


        populateValidParams(params)
        def masa = new Masa(params)

        assert masa.save() != null

        params.id = masa.id

        def model = controller.edit()

        assert model.masaInstance == masa
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/masa/list'

        response.reset()


        populateValidParams(params)
        def masa = new Masa(params)

        assert masa.save() != null

        // test invalid parameters in update
        params.id = masa.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/masa/edit"
        assert model.masaInstance != null

        masa.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/masa/show/$masa.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        masa.clearErrors()

        populateValidParams(params)
        params.id = masa.id
        params.version = -1
        controller.update()

        assert view == "/masa/edit"
        assert model.masaInstance != null
        assert model.masaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/masa/list'

        response.reset()

        populateValidParams(params)
        def masa = new Masa(params)

        assert masa.save() != null
        assert Masa.count() == 1

        params.id = masa.id

        controller.delete()

        assert Masa.count() == 0
        assert Masa.get(masa.id) == null
        assert response.redirectedUrl == '/masa/list'
    }
}
