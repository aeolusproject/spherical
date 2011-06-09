require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Spherical::Host do

  context 'upon connecting' do

    before(:all) do
      @host = create_test_host
    end

    it "should provide service information" do
      @host.about.should be_instance_of(Hash)
    end

    it "should list datacenters" do
      @host.datacenters.should be_instance_of(Array)
    end

    it "should have folder properties" do
      dc = @host.datacenters.first
      dc.collect.should include("hostFolder", "vmFolder", "permission")
      dc.config_status.id.should be_instance_of(String)
    end

    it 'should list instances' do
      @host.datacenters.each do |dc|
        dc.instances.each do |child|
          child.type.should == :VirtualMachine
          child.mac_addresses.should_not be_nil
        end
      end
    end

    it 'should have a datastore' do
      @host.datacenters.each do |dc|
        pp dc.datastore.size
      end
    end
  end

end
