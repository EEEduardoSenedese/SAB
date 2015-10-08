package sab

import grails.test.mixin.*
import spock.lang.*

@TestFor(AutorLivroController)
@Mock(AutorLivro)
class AutorLivroControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.autorLivroList
            model.autorLivroCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.autorLivro!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def autorLivro = new AutorLivro()
            autorLivro.validate()
            controller.save(autorLivro)

        then:"The create view is rendered again with the correct model"
            model.autorLivro!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            autorLivro = new AutorLivro(params)

            controller.save(autorLivro)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/autorLivro/show/1'
            controller.flash.message != null
            AutorLivro.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def autorLivro = new AutorLivro(params)
            controller.show(autorLivro)

        then:"A model is populated containing the domain instance"
            model.autorLivro == autorLivro
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def autorLivro = new AutorLivro(params)
            controller.edit(autorLivro)

        then:"A model is populated containing the domain instance"
            model.autorLivro == autorLivro
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/autorLivro/index'
            flash.message != null

        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def autorLivro = new AutorLivro()
            autorLivro.validate()
            controller.update(autorLivro)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.autorLivro == autorLivro

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            autorLivro = new AutorLivro(params).save(flush: true)
            controller.update(autorLivro)

        then:"A redirect is issued to the show action"
            autorLivro != null
            response.redirectedUrl == "/autorLivro/show/$autorLivro.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/autorLivro/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def autorLivro = new AutorLivro(params).save(flush: true)

        then:"It exists"
            AutorLivro.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(autorLivro)

        then:"The instance is deleted"
            AutorLivro.count() == 0
            response.redirectedUrl == '/autorLivro/index'
            flash.message != null
    }
}
