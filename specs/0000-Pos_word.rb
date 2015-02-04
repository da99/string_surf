
describe 'Pos#word' do

  before {
    @surf = String_Surf.new(
      "one two three four"
    )
    @pos = String_Surf::Pos.new(@surf)
  }

  it "returns the current word" do
    4.times { @pos.next! }
    @pos.word.should == 'three'
  end # === it gives the current word

  it "returns nil if current word is whitespace" do
    @pos.next!
    @pos.word.should == nil
  end

end # === describe 'Pos#word'
