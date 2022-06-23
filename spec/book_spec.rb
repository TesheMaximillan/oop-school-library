require_relative '../book'

describe  "Book Tests" do 
    context "When Testing Book Class" do 
        before do
            @test_book = Book.new("Test Title","Test Author") 
        end
       it "should say 'Test Title' when we access Book Title" do 
          expect(@test_book.title) == "Test Title"
       end

       it "should say 'Test Book Author' when we access Book Author" do 
          expect(@test_book.author) == "Test Author"
       end
       
       it "should say 'Test Book Rentals to be empty before Renting' when we access Book Rentals" do 
          expect(@test_book.rentals.empty?) 
       end

    end
 end