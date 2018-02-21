# class Url < ApplicationRecord
class Url < ActiveRecord::Base
  validates :original, :presence => true

end
