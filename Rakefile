# Copyright (C) 2011 Red Hat, Inc.
# Written by Ken Keiter <kenkeiter@redhat.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 2 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
# MA  02110-1301, USA.  A copy of the GNU General Public License is
# also available at http://www.gnu.org/copyleft/gpl.html.
#
# Author:: Kenneth Keiter (mailto:ken@kenkeiter.com)
# Copyright:: Copyright (C) 2011 Red Hat, Inc.
# License:: Distributed under GPLv2

require 'rubygems'
require 'rake/gempackagetask'
require 'spec/rake/spectask'

GEM_NAME='spherical'
GEM_VERSION='0.0.1'

desc "Open an irb session preloaded with this library"
task :console do
  sh "irb -rubygems -I lib -r spherical.rb -I spec -r spec_helper.rb"
end

SPEC = Gem::Specification.new do |s|
    s.name = GEM_NAME
    s.author = 'Ken Keiter'
    s.version = GEM_VERSION
    s.email = "kenkeiter@redhat.com"
    s.homepage = "http://www.aeolusproject.org/spherical.html"
    s.summary = "A wrapper for the VMware VI API"
    s.description = <<-EOS
Spherical provides a clean interface to all functionality offered by
vSphere and ESX servers, including traversal of complex datatypes.

It dynamically abstracts the server-side object graph locally, and allows
for full extensibility.
EOS
    s.files = FileList["Rakefile", "lib/**/*.rb", "examples/**/*.rb"]
    s.test_files = FileList["spec/**/*.rb"]
    s.extra_rdoc_files = FileList["LICENSE", "README.rdoc"]
    s.required_ruby_version = '>= 1.8.1'

    s.add_dependency('savon')
    s.add_dependency('xml-simple')
    s.add_development_dependency('rspec')
end

Rake::GemPackageTask.new(SPEC) do |pkg|
end

desc "Run all specs"
Spec::Rake::SpecTask.new('spec') do |t|
    t.spec_files = FileList['spec/**/*_spec.rb']
end
