require 'spec_helper'
 
describe Kristin do 
  
  before(:all) do
    @one_page_pdf = file_path("one.pdf")
    @multi_page_pdf = file_path("multi.pdf")
    @no_pdf = file_path("image.png")
    @target_path = "tmp/kristin"
    FileUtils.mkdir_p @target_path
  end

  after(:all) do
    FileUtils.rm_rf @target_path
  end

  describe ".convert" do
    it "should raise error if source file does not exists" do
      lambda { Kristin.convert("nonsense.pdf", "nonsense.html") }.should raise_error(IOError)
    end

    it "should convert a one page pdf to one html file" do
      target = @target_path + "/one.html"
      Kristin.convert(@one_page_pdf, target)
      File.exists?(target).should == true
    end

    it "should convert a multi page pdf to one html file" do
      target = @target_path + "/multi.html"
      Kristin.convert(@multi_page_pdf, target)
      File.exists?(target).should == true
    end

    it "should raise error if pdf is not a real pdf" do
      lambda { Kristin.convert(@no_pdf, "nonsense.html") }.should raise_error(IOError)
    end
  end
end