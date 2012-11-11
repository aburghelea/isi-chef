package ro.isi.restaurant



import org.junit.*
import grails.test.mixin.*

/**
 * TableControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(TableController)
@Mock(Masa)
class TableControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/table/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tableInstanceList.size() == 0
        assert model.tableInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.tableInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tableInstance != null
        assert view == '/table/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/table/show/1'
        assert controller.flash.message != null
        assert Masa.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/table/list'


        populateValidParams(params)
        def table = new Masa(params)

        assert table.save() != null

        params.id = table.id

        def model = controller.show()

        assert model.tableInstance == table
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/table/list'


        populateValidParams(params)
        def table = new Masa(params)

        assert table.save() != null

        params.id = table.id

        def model = controller.edit()

        assert model.tableInstance == table
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/table/list'

        response.reset()


        populateValidParams(params)
        def table = new Masa(params)

        assert table.save() != null

        // test invalid parameters in update
        params.id = table.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/table/edit"
        assert model.tableInstance != null

        table.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/table/show/$table.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        table.clearErrors()

        populateValidParams(params)
        params.id = table.id
        params.version = -1
        controller.update()

        assert view == "/table/edit"
        assert model.tableInstance != null
        assert model.tableInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/table/list'

        response.reset()

        populateValidParams(params)
        def table = new Masa(params)

        assert table.save() != null
        assert Masa.count() == 1

        params.id = table.id

        controller.delete()

        assert Masa.count() == 0
        assert Masa.get(table.id) == null
        assert response.redirectedUrl == '/table/list'
    }
}
