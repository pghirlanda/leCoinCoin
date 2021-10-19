package annonces.estia

import grails.plugin.springsecurity.SpringSecurityService
import grails.validation.ValidationException
import org.springframework.web.multipart.MultipartHttpServletRequest

import static org.springframework.http.HttpStatus.*

class AnnonceController {

    AnnonceService annonceService
    SpringSecurityService springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond annonceService.list(params), model: [annonceCount: annonceService.count()]
    }

    def show(Long id) {
        respond annonceService.get(id)
    }

    def create() {
        respond new Annonce(params)
    }

    def save(Annonce annonce) {
        if (annonce == null) {
            notFound()
            return
        }

        def uploadedFile = ((MultipartHttpServletRequest) request).getFiles("filename")
        def generator = { String alphabet, int n ->
            new Random().with {
                (1..n).collect { alphabet[nextInt(alphabet.length())] }.join()
            }
        }
        uploadedFile.each {
            String nom = generator((('A'..'Z') + ('0'..'9')).join(), 9)
            String chemin = "C:/Users/p.ghirlanda/Desktop/Cours/3A/MBDS/WEB/Projet/projet-grails-master/grails-app/assets/images/" + nom
            it.transferTo(new File(chemin))
            def illustra = new Illustration(filename: nom)
            annonce.addToIllustrations(illustra)
        }

        try {
            if(annonce.author == null){
                annonce.author = springSecurityService.getCurrentUser()
            }
            annonceService.save(annonce)
        } catch (ValidationException e) {
            respond annonce.errors, view: 'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'annonce.label', default: 'Annonce'), annonce.id])
                redirect annonce
            }
            '*' { respond annonce, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond annonceService.get(id)
    }

    def update(Annonce annonce) {
        if (annonce == null) {
            notFound()
            return
        }

        try {
            if(annonce.author == null){
                annonce.author = springSecurityService.getCurrentUser()
            }
            annonceService.save(annonce)
        } catch (ValidationException e) {
            respond annonce.errors, view: 'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'annonce.label', default: 'Annonce'), annonce.id])
                redirect annonce
            }
            '*' { respond annonce, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        annonceService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'annonce.label', default: 'Annonce'), id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'annonce.label', default: 'Annonce'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
