
class ParsableFile
  #after_save :log
  #validates_presence_of :path
  #validates_uniqueness_of :path
  
  include Mongoid::Document
  include EntityHelper

  field :name, type: String
  field :status, type: String
  field :confidence, type: Integer  
  field :path, type: String
  field :type, type: String
  field :created_at, type: Time
  field :updated_at, type: Time

  def to_s
    "#{self.class}: #{name} (#{path})"
  end

end
