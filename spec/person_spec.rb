require_relative '../person'

describe  "Person Tests" do 
    context "When Testing Person Class" do 
        before do
            @test_person = Person.new(26,TRUE,"Test Person") 
        end
       it "should say 'Test Person Name' when we access Person Name" do 
          expect(@test_person.name) == "Test Person"
       end

       it "should say 'Test Person Age' when we access Person Age" do 
          expect(@test_person.age) == 26
       end
       
       it "should say 'Test Person Rentals to be empty on Initialize' when we access Person Rentals" do 
          expect(@test_person.rentals.empty?) 
       end

       it "should say 'Initiaze With Unkonw Name' when we access Person name" do 
         test_person1 = Person.new(26,TRUE)
        expect(test_person1.name) == 'Unknown' 
     end

    end
 end