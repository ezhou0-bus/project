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

end
