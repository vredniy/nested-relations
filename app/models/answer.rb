class Answer < ActiveRecord::Base
  attr_accessible :name, :question_id

  belongs_to :question

  validates :name, :presence => true
end
