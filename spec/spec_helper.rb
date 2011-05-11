$: << File.join(File.dirname(__FILE__), '../lib')

require 'spherical'
require 'pp'

#RSpec.configure do |config|
#    config.include Savon::Spec::Macros
#end

def create_test_host
    # Configure how to access the vsphere installation in the file
    # mentioned in the environment variable SPHERICAL_CONFIG
    # That must be a YAML file with the following form
    #   ---
    #   :vsphere:
    #     :provider: API_URL
    #     :user: USERNAME
    #     :password: PASSWORD
    unless ENV["SPHERICAL_CONFIG"]
        raise "Please set SPHERICAL_CONFIG"
    end
    file = File::expand_path(ENV["SPHERICAL_CONFIG"])
    cfg = YAML::load(File::read(file))
    c = cfg[:vsphere]
    Spherical::Host.new(:api => c[:provider],
                        :username => c[:user],
                        :password => c[:password])
end
