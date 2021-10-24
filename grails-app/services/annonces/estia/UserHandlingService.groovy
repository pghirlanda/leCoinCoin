package annonces.estia

import grails.gorm.transactions.Transactional

@Transactional
class UserHandlingService {

    UserService userService
    def handleUserDelete(Long id) {
        UserRole.removeAll(User.get(id))
        userService.delete(id)
    }
}
