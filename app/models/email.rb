# == Schema Information
#
# Table name: emails
#
#  id             :bigint           not null, primary key
#  receiver_email :string
#  receiver_name  :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Email < ApplicationRecord
has_many  :inputs, dependent: :destroy
end
