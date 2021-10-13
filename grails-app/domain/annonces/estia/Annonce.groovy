package annonces.estia

class Annonce {

    String title
    String description
    Float price
    Boolean active = Boolean.FALSE


    Date dateCreated
    Date lastUpdated

    static belongsTo = [author: User]
    static hasMany = [illustrations: Illustration]
    static constraints = {
        title nullable: false, blank: false, size: 5..100
        description nullable: true, blank: true
        price nullable: false, min: 0F
    }
}
