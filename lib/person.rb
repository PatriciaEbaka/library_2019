class Person
    attr_reader :firstname, :lastname, :name
    attr_accessor :borrowed_books

    def initialize(firstname, lastname)
        @firstname = firstname
        @lastname = lastname
        @name = "#{firstname} #{lastname}"
        @borrowed_books = []
    end


    
end