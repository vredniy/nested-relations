class Question < ActiveRecord::Base
  attr_accessible :name, :answers_attributes

  has_many :answers

  accepts_nested_attributes_for :answers

  validates :name, :presence => true
end
