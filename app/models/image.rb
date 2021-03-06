class Image < ActiveRecord::Base
  has_many     :task_runs
  has_many     :physical_locations
  after_save   :log

  include ModelHelper

  def to_s
    "#{self.class}: #{self.id}"
  end

  def filename
    self.local_path.split(File::SEPARATOR).last
  end

private

  def log
    TapirLogger.instance.log self.to_s
  end

end
