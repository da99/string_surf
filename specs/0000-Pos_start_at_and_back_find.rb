
describe 'Pos#start_at_and_back_find' do

  before {
    @words = "0zero   8eight     19nineteen     3four"
    @surf  = String_Surf.new @words
    @pos   = String_Surf::Pos.new(@surf)
  }

  it "returns position of target" do
    36.times { @pos.next! }
    @pos.start_at_and_back_find(@pos.pos, '3').
      should == 34
  end # === it returns position of target

  it "returns nil if pos is on target char" do
    8.times { @pos.next! }
    @pos.start_at_and_back_find(@pos.pos, '8').
      should == nil
  end

  it "returns nil if pos is on pos zero" do
    @pos.start_at_and_back_find(0, '0').
      should == nil
  end # === it returns nil if pos is on pos zero

end # === describe 'Pos#start_at_and_back_find'