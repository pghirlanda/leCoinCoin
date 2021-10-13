package annonces.estia

class Illustration {

    String filename
    String coucou
    static belongsTo = [annonce: Annonce]
    static constraints = {
        filename nullable: false, blank: false
    }
}
