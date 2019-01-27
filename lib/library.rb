require "yaml"

class Library
    attr_reader :library_yaml, :library_collection    


    def initialize(library_yaml = "./lib/data.yml")
        @library_yaml = library_yaml
        @library_collection = []
        open()
    end

    def open
        if File.exist?(@library_yaml)
            @library_collection = YAML.load_file(@library_yaml)
        end
    end

    def search_title title
        @library_collection.detect { |obj| obj[:item][:title] == title  }
    end

    def borrow_book(person, book)
        if @library_collection.include? book and book[:available]
            borrowed = search_title(book[:item][:title])
            borrowed[:available] = false
            date = Date.today >> 1
            borrowed[:return_date] = date.strftime("%Y-%m-%d")
            person.borrowed_books << borrowed
            return true
        end
        false
    end

    def save
        File.open(@library_yaml, 'w') do |file|
            file.write(@library_collection.to_yaml)
        end
    end
    
end