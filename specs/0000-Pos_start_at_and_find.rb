
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

  it "returns pos of :word_bound" do
    9.times { @pos.next! }
    @pos.start_at_and_find(@pos.pos, :word_bound).
      should == 13
  end

  it "returns size-1 if pos is at end and target is :word_bound" do
    @pos.start_at_and_find(@words.size - 1, :word_bound).
      should == (@words.size - 1)
  end

end # === describe 'Pos#start_at_and_find'
