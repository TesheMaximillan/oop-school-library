require_relative '../book'

describe  "Book Tests" do 
    context "When Testing Book Class" do 
        before do
            @test_book = Book.new("Test Title","Test Author") 
        end
       it "should say 'Test Title' when we access Book Title" do 
          expect(@test_book.title) == "Test Title"
       end
       
    end
 end