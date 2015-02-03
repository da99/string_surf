
describe :string_surf do

  it "runs" do
    ss = String_Surf.new(trim <<-EOF)
      /*/* This is a title.

      This is text.

      This is a *link* http://www.mises.org/
    EOF

    ss.describe '/*/*', :start_of_line, :grab_line do |match, surfer|
      "H1 #{match[:text]}"
    end

    ss.describe '*', :surround, :words, :grab_word do |match, surfer|
      if text['http']
        "link: #{match[:text]}"
      else
        match[:original]
      end
    end

    ss.run

    trim(ss.text).should == trim(<<-EOF)
      H1: This is a title.

      This is text.

      This is a link: http://www.mises.org/
    EOF

  end # === it runs

end # === describe :string_surf
