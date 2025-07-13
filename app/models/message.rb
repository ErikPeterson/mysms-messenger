class Message

  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :content, type: String
  field :phone_number, type: String
  field :sent_at, type: Time
  field :sent, type: Mongoid::Boolean
  field :sid, type: String

  belongs_to :user
end
