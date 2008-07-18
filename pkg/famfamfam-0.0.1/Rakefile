# Look in the tasks/setup.rb file for the various options that can be
# configured in this Rakefile. The .rake files in the tasks directory
# are where the options are used.

load 'tasks/setup.rb'

ensure_in_path 'lib'
require 'famfamfam'

task :default => 'spec:run'

PROJ.name = 'famfamfam'
PROJ.authors = 'Tyler Montgomery'
PROJ.email = 'tyler.a.montgomery@gmail.com'
PROJ.url = 'http://ubermajestix.com/gems/famfamfam'
PROJ.rubyforge.name = 'famfamfam'
PROJ.version = "0.0.1"
PROJ.spec.opts << '--color'

depend_on "main", ">= 2.8.2"

# EOF
