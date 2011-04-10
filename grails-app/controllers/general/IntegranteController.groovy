package general

class IntegranteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [integranteInstanceList: Integrante.list(params), integranteInstanceTotal: Integrante.count()]
    }

    def create = {
        def integranteInstance = new Integrante()
        integranteInstance.properties = params
        return [integranteInstance: integranteInstance]
    }

    def save = {
        def integranteInstance = new Integrante(params)
        if (integranteInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'integrante.label', default: 'Integrante'), integranteInstance.id])}"
            redirect(action: "show", id: integranteInstance.id)
        }
        else {
            render(view: "create", model: [integranteInstance: integranteInstance])
        }
    }

    def show = {
        def integranteInstance = Integrante.get(params.id)
        if (!integranteInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'integrante.label', default: 'Integrante'), params.id])}"
            redirect(action: "list")
        }
        else {
            [integranteInstance: integranteInstance]
        }
    }

    def edit = {
        def integranteInstance = Integrante.get(params.id)
        if (!integranteInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'integrante.label', default: 'Integrante'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [integranteInstance: integranteInstance]
        }
    }

    def update = {
        def integranteInstance = Integrante.get(params.id)
        if (integranteInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (integranteInstance.version > version) {
                    
                    integranteInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'integrante.label', default: 'Integrante')] as Object[], "Another user has updated this Integrante while you were editing")
                    render(view: "edit", model: [integranteInstance: integranteInstance])
                    return
                }
            }
            integranteInstance.properties = params
            if (!integranteInstance.hasErrors() && integranteInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'integrante.label', default: 'Integrante'), integranteInstance.id])}"
                redirect(action: "show", id: integranteInstance.id)
            }
            else {
                render(view: "edit", model: [integranteInstance: integranteInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'integrante.label', default: 'Integrante'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def integranteInstance = Integrante.get(params.id)
        if (integranteInstance) {
            try {
                integranteInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'integrante.label', default: 'Integrante'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'integrante.label', default: 'Integrante'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'integrante.label', default: 'Integrante'), params.id])}"
            redirect(action: "list")
        }
    }
}
