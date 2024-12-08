# == Schema Information
#
# Table name: inputs
#
#  id                  :bigint           not null, primary key
#  additional_requests :text
#  email_body          :string
#  occasion            :text
#  receiver_company    :string
#  receiver_email      :string
#  receiver_name       :string
#  topics              :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  email_id            :integer
#
class Input < ApplicationRecord
belongs_to :email
validates :topics, presence: true
validates :receiver_name, presence: true
validates :receiver_email, presence: true
validates :receiver_company, presence: true
validates :occasion, presence: true
validates :email_id, presence: true
validates :email_id, uniqueness: true
end
