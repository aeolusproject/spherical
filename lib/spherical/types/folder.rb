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

module Spherical

  class Folder < ManagedReference

    represent_managed :Folder
    include Searchable # allow Folders to be searched
    include Traversable # this entity has children

    # Create a new folder beneath this one. Return a ManagedReference to
    # the new folder.
    def create_subfolder(name)
      create_folder(:name => name)
    end

    def traverse(path, type = Object, create = false)
      elements = path.kind_of?(String) ? path.split('/').reject(&:empty?) : path
      return self if elements.empty?
      target = elements.pop
      path = elements.inject(self) do |folder, ele|
        folder.find(ele, Spherical::Folder) || (create && folder.create_subfolder(ele)) || return
      end
      if result = path.find(target, type)
        result
      elsif create and type == Spherical::Folder
        path.create_subfolder(target)
      else
        nil
      end
    end

  end

end
