# $Id$

# Equivalent to a header guard in C/C++
# Used to prevent the class/module from being loaded more than once
unless defined? Famfamfam
  require 'fileutils'

module Famfamfam

  # :stopdoc:
  VERSION = '0.0.1'
  LIBPATH = ::File.expand_path(::File.dirname(__FILE__)) + ::File::SEPARATOR
  PATH = ::File.dirname(LIBPATH) + ::File::SEPARATOR
  # :startdoc:


  def self.icons
    Dir["#{libpath}famfamfam/*"]
  end
  
  def self.copy_icons( dest_dir )
    puts "=="*45
    puts "making dir #{dest_dir}" unless File.exists? dest_dir
    puts "copying icons to #{dest_dir}"
    puts "=="*45
    FileUtils.mkdir_p dest_dir unless File.exists? dest_dir
    FileUtils.cp(Famfamfam.icons, dest_dir) 
  end
  
  def self.remove_icons( dest_dir )
    puts "=="*45
    puts "removing icons from #{dest_dir}"
    puts "=="*45
    icons = icon_names
    icons.collect!{|icon| dest_dir + "/" + icon}
    FileUtils.rm(icons)
  end
  
  def self.icon_names
    icons = Famfamfam.icons
    icons.collect!{|icon| File.basename(icon)}
  end


  # Returns the version string for the library.
  #
  def self.version
    VERSION
  end

  # Returns the library path for the module. If any arguments are given,
  # they will be joined to the end of the libray path using
  # <tt>File.join</tt>.
  #
  def self.libpath( *args )
    args.empty? ? LIBPATH : ::File.join(LIBPATH, *args)
  end

  # Returns the lpath for the module. If any arguments are given,
  # they will be joined to the end of the path using
  # <tt>File.join</tt>.
  #
  def self.path( *args )
    args.empty? ? PATH : ::File.join(PATH, *args)
  end

  # Utility method used to require all files ending in .rb that lie in the
  # directory below this file that has the same name as the filename passed
  # in. Optionally, a specific _directory_ name can be passed in such that
  # the _filename_ does not have to be equivalent to the directory.
  #

  def self.require_all_libs_relative_to( fname, dir = nil )
    dir ||= ::File.basename(fname, '.*')
    search_me = ::File.expand_path(
        ::File.join(::File.dirname(fname), dir, '**', '*.rb'))

    Dir.glob(search_me).sort.each {|rb| require rb}
  end



  
end  # module Famfamfam

require 'rubygems'
require 'main'
Famfamfam.require_all_libs_relative_to __FILE__

end  # unless defined?

# EOF
