module Tapir
  module Entities
    class Domain < Base
      #belongs_to :organization
      #has_many   :hosts
      #has_many   :netblocks
      #has_many   :task_runs
      #validates_uniqueness_of :name
      #validates_presence_of   :name
      
      field :record_created_on, type: Time
      field :record_updated_on, type: Time
      field :record_expires_on, type: Time
      field :disclaimer, type: String 
      field :registrar_name, type: String
      field :registrar_org, type: String
      field :registrar_url, type: String
      field :referral_whois, type: String
      field :registered, type: String
      field :available, type: String
      #field :organization_id, Integer
      #field :host_id, Inteer
      field :created_at, type: Time
      field :updated_at, type: Time
      
    end
  end
end