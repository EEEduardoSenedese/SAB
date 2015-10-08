package sab

import grails.test.mixin.*
import spock.lang.*

@TestFor(ColecaoController)
@Mock(Colecao)
class ColecaoControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.colecaoList
            model.colecaoCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.colecao!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def colecao = new Colecao()
            colecao.validate()
            controller.save(colecao)

        then:"The create view is rendered again with the correct model"
            model.colecao!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            colecao = new Colecao(params)

            controller.save(colecao)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/colecao/show/1'
            controller.flash.message != null
            Colecao.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def colecao = new Colecao(params)
            controller.show(colecao)

        then:"A model is populated containing the domain instance"
            model.colecao == colecao
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def colecao = new Colecao(params)
            controller.edit(colecao)

        then:"A model is populated containing the domain instance"
            model.colecao == colecao
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/colecao/index'
            flash.message != null

        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def colecao = new Colecao()
            colecao.validate()
            controller.update(colecao)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.colecao == colecao

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            colecao = new Colecao(params).save(flush: true)
            controller.update(colecao)

        then:"A redirect is issued to the show action"
            colecao != null
            response.redirectedUrl == "/colecao/show/$colecao.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/colecao/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def colecao = new Colecao(params).save(flush: true)

        then:"It exists"
            Colecao.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(colecao)

        then:"The instance is deleted"
            Colecao.count() == 0
            response.redirectedUrl == '/colecao/index'
            flash.message != null
    }
}
