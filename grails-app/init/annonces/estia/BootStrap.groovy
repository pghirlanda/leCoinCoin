package annonces.estia

class BootStrap {

    def init = { servletContext ->
        def adminRole = new Role(authority: "ROLE_ADMIN").save()
        def modoRole = new Role(authority: "ROLE_MODO").save()
        def clientRole = new Role(authority: "ROLE_CLIENT").save()

        def userAdmin = new User(username: "admin", password: "admin", email: "admin@estia.fr").save()
        def userMod = new User(username: "modo", password: "modo", email: "modo@estia.fr").save()

        UserRole.create(userAdmin, adminRole, true)
        UserRole.create(userMod, modoRole, true)

        ["Alice", "Bob", "Charlie", "Dany", "Etienne"].each{
            String username ->
                def userInstance = new User(username: username, password: "password", email: username + "@estia.fr")
                (1..5).each{
                    Integer annonceIdx ->
                        def annonceInstance = new Annonce(
                                title: "Title $username $annonceIdx",
                                description: "Description $username $annonceIdx",
                                price: 100F * annonceIdx,
                                active: true
                        )

                        (1..5).each{

                            Integer illustrationIdx ->
                                annonceInstance.addToIllustrations(new Illustration(filename: "grails.svg"))
                        }
                        userInstance.addToAnnonces(annonceInstance)
                }
                userInstance.save(flush: true, failOnError: true)
                UserRole.create(userInstance, clientRole, true)
        }

    }
    def destroy = {
    }
}
