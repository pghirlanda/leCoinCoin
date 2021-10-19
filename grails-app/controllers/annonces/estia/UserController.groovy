package annonces.estia

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import org.springframework.web.multipart.MultipartHttpServletRequest

import static org.springframework.http.HttpStatus.*

class UserController {

    UserService userService
    UserHandlingService userHandlingService
    Role role1

    static allowedMethods = [save: "POST", update: "PUT"]

    @Secured(value=["hasRole('ROLE_ADMIN')"])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond userService.list(params), model:[userCount: userService.count()]
    }

    @Secured(value=["hasRole('ROLE_ADMIN')"])
    def show(Long id) {
        respond userService.get(id)
    }

    def create() {
        respond new User(params)
        role1 = Role.findByAuthority("ROLE_CLIENT")
    }

    def save(User user) {
        if (user == null) {
            notFound()
            return
        }
        try {
            userService.save(user)
            UserRole.create(user, role1, true)
        } catch (ValidationException e) {
            respond user.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*' { respond user, [status: CREATED] }
        }
    }

    @Secured(value=["hasRole('ROLE_ADMIN')"])
    def edit(Long id) {
        respond userService.get(id)
    }

    @Secured(value=["hasRole('ROLE_ADMIN')"])
    def update(User user) {
        if (user == null) {
            notFound()
            return
        }

        try {
            role1 = Role.findById(params.nouveauRole)
            userService.save(user)
            UserRole.removeAll(user)
            UserRole.create(user, role1, true)
        } catch (ValidationException e) {
            respond user.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*'{ respond user, [status: OK] }
        }
    }

    @Secured(value=["hasRole('ROLE_ADMIN')"])
    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        userHandlingService.handleUserDelete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
                redirect action:"index", method:"GET"
            }
            '*'{redirect action:"index"}
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
