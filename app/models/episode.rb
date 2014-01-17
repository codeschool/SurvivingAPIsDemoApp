class Episode < ActiveRecord::Base
  validates_presence_of :title
end
