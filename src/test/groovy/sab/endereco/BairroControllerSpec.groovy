package sab.endereco

import grails.test.mixin.*
import spock.lang.*

@TestFor(BairroController)
@Mock(Bairro)
class BairroControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.bairroList
            model.bairroCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.bairro!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def bairro = new Bairro()
            bairro.validate()
            controller.save(bairro)

        then:"The create view is rendered again with the correct model"
            model.bairro!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            bairro = new Bairro(params)

            controller.save(bairro)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/bairro/show/1'
            controller.flash.message != null
            Bairro.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def bairro = new Bairro(params)
            controller.show(bairro)

        then:"A model is populated containing the domain instance"
            model.bairro == bairro
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def bairro = new Bairro(params)
            controller.edit(bairro)

        then:"A model is populated containing the domain instance"
            model.bairro == bairro
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/bairro/index'
            flash.message != null

        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def bairro = new Bairro()
            bairro.validate()
            controller.update(bairro)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.bairro == bairro

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            bairro = new Bairro(params).save(flush: true)
            controller.update(bairro)

        then:"A redirect is issued to the show action"
            bairro != null
            response.redirectedUrl == "/bairro/show/$bairro.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/bairro/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def bairro = new Bairro(params).save(flush: true)

        then:"It exists"
            Bairro.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(bairro)

        then:"The instance is deleted"
            Bairro.count() == 0
            response.redirectedUrl == '/bairro/index'
            flash.message != null
    }
}
