module Tapir
  module Entities
    class Finding < Base
      #has_many     :task_runs

      field :content, type: String
      field :created_at, type: Time
      field :updated_at, type: Time
    
    end
  end
end