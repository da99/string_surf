
describe 'Pos#next_word' do

  before {
    @words = "yellow   orange    pink    blue    green"
    @surf  = String_Surf.new @words
    @pos   = String_Surf::Pos.new(@surf)
  }

  it "returns the next word when pos is on current word" do
    @pos.next!
    @pos.next_word.should == 'orange'
  end # === it returns the next word when pos is on current word

  it "returns nil if on last word" do
    8.size.times { @pos.next! }
    @pos.next_word.should == nil
  end

  it "returns the next word when on whitespace" do
    @pos.next!
    @pos.next!
    @pos.next!
    @pos.next_word.should == 'pink'
  end # === it returns the next word when on whitespace

  it "returns nil if next word is on another line" do
    pos = String_Surf::Pos.new(String_Surf.new("a\nb\nc"))
    pos.next_word.should == nil
  end

end # === describe 'Pos#next_word'
