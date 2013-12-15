class Activity < ActiveRecord::Base
  belongs_to :user



  def self.add(user, activity_type, target, subtarget = nil)
    activity = Activity.new(:user => user, :activity_type => activity_type, :target => target, :subtarget => subtarget)
    activity.save!
    activity
  end

end
