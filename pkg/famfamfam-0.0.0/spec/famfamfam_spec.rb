# $Id$

require File.join(File.dirname(__FILE__), %w[spec_helper])

describe Famfamfam do
  
  it "should have 1000 icons" do
    icons = Famfamfam.icons
    puts icons[0]
    icons.length.should == 1000
  end
  
  it "should copy links to public/images in current dir" do
      Famfamfam.copy_icons "public/images"
      icons = Dir["#{Famfamfam.libpath}/../public/images/*"]
      icons.length.should == 1000
  end
  
  it "should copy links to a given dir" do
      dest_dir = "images/icons"
      Famfamfam.copy_icons dest_dir
      puts "looking up copied icons in: #{Famfamfam.libpath}../#{dest_dir}"
      icons = Dir["#{Famfamfam.libpath}../#{dest_dir}/*"]
      icons.length.should == 1000
  end
  
  it "should remove icons in public/images" do
      Famfamfam.remove_icons "public/images"
      icons = Dir["#{Famfamfam.libpath}/../public/images/*"]
      icons.length.should == 0
  end
  
  it "should remove icons in a given dir" do
    dest_dir = "images/icons"
    Famfamfam.remove_icons dest_dir
    icons = Dir["#{Famfamfam.libpath}../#{dest_dir}/*"]
    icons.length.should == 0
  end

  
  
end

# EOF
