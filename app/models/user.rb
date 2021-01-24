class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  #setting value only when the object is new and not persisted
  #before_create will override existing value and we do not want to set default value if object already has values.
  after_initialize :set_default, unless: :persisted?

  def mood
    self.nausea > self.happiness ? mood = "sad" : mood = "happy"
  end

  private

  def set_default
    self.admin ||= false if self.admin.nil?
  end
end
