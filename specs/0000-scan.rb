
describe 'String_Surf :scan' do

  it "returns the string as an array" do
    String_Surf.scan("a b c").should == [
      ['a', nil, nil],
      [nil, ' ', nil],
      ['b', nil, nil],
      [nil, ' ', nil],
      ['c', nil, nil]
    ]
  end # === it returns the string as an array

  it "groups whitespace together, except new lines \\n" do
    String_Surf.scan("1  \t \n  2 \n  3").should == [
      ["1" , nil, nil],
      [nil , "  \t ", nil],
      [nil , nil, "\n"],
      [nil , "  ", nil],
      ["2" , nil, nil],
      [nil , " ", nil],
      [nil , nil, "\n"],
      [nil , "  ", nil],
      ["3" , nil, nil]
    ]
  end # === it groups whitespace together, except new lines \\n

end # === describe 'String_Surf :scan'
