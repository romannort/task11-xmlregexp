require "rspec"
require '../../parse_xml'

describe "XmlChecker" do

  it "should return 'true' for empty string" do
    parse_xml("").should == true
  end

  it "should return 'true' for empty volume" do
    parse_xml("<volume></volume>").should == true
  end

  it "should return 'true' for string with files inside volume" do
    parse_xml("<volume><file></file></volume>").should == true
  end

  it "should return 'false' for files without volume" do
    parse_xml("<file></file>").should == false
  end

  it "should return 'true' for volume with folders" do
    parse_xml("<volume><folder><folder></folder></folder></volume>").should == true
  end

  it "should return 'false' for folders outside volume" do
    parse_xml("<folder><volume></volume></folder>").should == false
  end

  it "should return 'true' for files in folders and volume" do
    parse_xml("<volume><file></file><folder><file></file></folder><file></file></volume>").should == true
  end

  it "should return 'false' for folders inside files" do
    parse_xml("<volume><file><folder></folder></file></volume>").should == false
  end

  it "should return 'false' for files inside files" do
    parse_xml("<volume><file><file></file></file></volume>").should == false
  end

end