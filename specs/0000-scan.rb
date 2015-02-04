
describe 'String_Surf :scan' do

  it "returns the string as an array" do
    String_Surf.scan("a b c").
      should == ['a', ' ', 'b', ' ', 'c']
  end # === it returns the string as an array

  it "groups whitespace together, except new lines \\n" do
    String_Surf.scan("1  \t \n  2 \n  3").
      should == ["1", "  \t ", "\n", "  ", "2", " ", "\n", "  ", "3"]
  end # === it groups whitespace together, except new lines \\n

end # === describe 'String_Surf :scan'
