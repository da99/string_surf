
describe 'Pos#start_at_and_find' do

  before {
    @words = "0zero    9nine      2twenty      3three"
    @surf  = String_Surf.new @words
    @pos   = String_Surf::Pos.new(@surf)
  }

  it "returns position of char" do
    8.times { @pos.next! }
    @pos.start_at_and_find(@pos.pos, '9').
      should == 9
  end # === it returns position of char

  it "returns nil if pos is on target char" do
    9.times { @pos.next! }
    @pos.start_at_and_find(@pos.pos, '9').
      should == nil
  end # === it returns nil if pos is on target char

  it "returns nil if pos is on zero" do
    @pos.start_at_and_find(@pos.pos, '0').
      should == nil
  end # === it returns nil if pos is on zero

end # === describe 'Pos#start_at_and_find'
