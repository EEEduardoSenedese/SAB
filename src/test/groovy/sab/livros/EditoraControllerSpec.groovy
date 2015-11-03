package sab.livros

import grails.test.mixin.*
import spock.lang.*

@TestFor(EditoraController)
@Mock(Editora)
class EditoraControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.editoraList
            model.editoraCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.editora!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def editora = new Editora()
            editora.validate()
            controller.save(editora)

        then:"The create view is rendered again with the correct model"
            model.editora!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            editora = new Editora(params)

            controller.save(editora)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/editora/show/1'
            controller.flash.message != null
            Editora.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def editora = new Editora(params)
            controller.show(editora)

        then:"A model is populated containing the domain instance"
            model.editora == editora
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def editora = new Editora(params)
            controller.edit(editora)

        then:"A model is populated containing the domain instance"
            model.editora == editora
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/editora/index'
            flash.message != null

        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def editora = new Editora()
            editora.validate()
            controller.update(editora)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.editora == editora

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            editora = new Editora(params).save(flush: true)
            controller.update(editora)

        then:"A redirect is issued to the show action"
            editora != null
            response.redirectedUrl == "/editora/show/$editora.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/editora/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def editora = new Editora(params).save(flush: true)

        then:"It exists"
            Editora.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(editora)

        then:"The instance is deleted"
            Editora.count() == 0
            response.redirectedUrl == '/editora/index'
            flash.message != null
    }
}
