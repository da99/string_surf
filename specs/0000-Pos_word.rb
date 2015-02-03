
describe 'Pos#word' do

  before {
    @surf = String_Surf.new(trim <<-EOF)
      one two three four
    EOF
    @pos = String_Surf::Pos.new(@surf)
  }

  it "returns the current word" do
    4.times { @pos.next! }
    @pos.word.should == 'two'
  end # === it gives the current word

  it "returns the current word if in middle of word" do
    @pos.next!
    @pos.word.should == 'one'
  end # === it gives the current word

  it "returns the current word if at end of word" do
    12.times { @pos.next! }
    @pos.word.should == 'three'
  end # === it gives the current word

  it "returns nil if current word is whitespace" do
    3.times { @pos.next! }
    @pos.word.should == nil
  end

end # === describe 'Pos#word'
