require 'spec_helper'
require 'person'


describe Person do
    describe ".initialize" do
        context "when passed args" do
            subject(:person){ described_class.new("James", "Harden")}
            it "should set the name of the person" do
                expect(person.name).to eql("James Harden")
            end
        end
    end
end