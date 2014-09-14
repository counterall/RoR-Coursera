class PostValidator < ActiveModel::EachValidator
	def validate(record)
		record.errors[:title] << "Must started with a capital letter!" unless record.title =~ /\A[A-Z]/ 
	end
end


class Post < ActiveRecord::Base
#include ActiveModel::Validations
has_many :comments, dependent: :destroy
validates :title, presence: true
validates :body, length: {maximum: 15}, allow_blank: false
end

