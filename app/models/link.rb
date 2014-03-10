# == Schema Information
#
# Table name: links
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  user_id     :integer
#  url         :string(255)
#  checked     :boolean          default(FALSE)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Link < ActiveRecord::Base

	acts_as_taggable

  belongs_to :user

  validates :name, presence: true
  validates :url, presence: true

end
