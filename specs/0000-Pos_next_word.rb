
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
    (@words.size - 2).times { @pos.next! }
    @pos.next_word.should == nil
  end

  it "returns the next word when on whitespace" do
    (@words.index('pink') - 2).times { @pos.next! }
    @pos.next_word.should == 'pink'
  end # === it returns the next word when on whitespace

  it "returns last char if last word is one char long" do
    pos = String_Surf::Pos.new(String_Surf.new('one c'))
    pos.next!
    pos.next!
    pos.next_word.should == 'c'
  end # === it returns last char if last word is one char long

end # === describe 'Pos#next_word'
