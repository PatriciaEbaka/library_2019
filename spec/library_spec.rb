require 'spec_helper'
require "library"
require "person"

describe Library do
    subject(:lib) { described_class.new()}
    subject(:lib1) { described_class.new("libraryinfo.yml")}
    let(:book) {
        {
            available: true, 
            item: {
                    title:"Pippi Långstrump", 
                    author:"Astrid Lindgren"
                },
            return_date: nil
        }
    }
    let(:person) {
        Person.new("James", "Harden")
    }

    let(:book_unavailable){
        {
            item: {
                    title: "Skratta lagom! Sa pappa Åberg",
                    author: "Gunilla Bergström"
                },
            available: false,
            return_date: '2016-05-25'
        }
    }

    describe ".initialize" do
        context "when given 0 argments" do
            it "sets the library_yaml file to default" do
                expect(lib.library_yaml).to eql("./lib/data.yml")
            end

            it "should have 5 books in its collection" do 
                expect(lib.library_collection.size).to eql(5)
            end
        end

        context "when given a file path" do
            it "sets the library_yaml to the given file path" do
                expect(lib1.library_yaml).to eql("libraryinfo.yml")
            end

            it "should have 0 books in its collection" do
                expect(lib1.library_collection.count).to eql(0)
            end
        end
    end

    describe ".search_title" do
        it "it returns match when book found" do
            result  = lib.search_title("Pippi Långstrump")
            expect(result).to eql(book)
        end
    end

    describe ".borrow_book" do
        context "when book is in library" do
            context "when book is available" do
                it "should allow the user to borrow the book" do
                    is_borrowed = lib.borrow_book(person, book)
                    expect(is_borrowed).to eql(true)
                    expect(person.borrowed_books.count).to eql(1)
                end
            end

            context "when book is not available" do
                it "should not allow the book to be borrowed" do
                    is_borrowed = lib.borrow_book(person, book_unavailable)
                    expect(is_borrowed).to eql(false)
                end
            end
        end
    end
end
