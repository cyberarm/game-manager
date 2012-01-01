class Game < ActiveRecord::Base
 validates_presence_of :name, :path
 validates_uniqueness_of :name
 default_scope :order => 'created_at DESC'
end
