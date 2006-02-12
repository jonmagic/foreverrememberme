class Memorial < ActiveRecord::Base
  validates_presence_of [ :firstname, :lastname, :hometown, :date_of_birth, :date_of_death ]
  has_many :comments
  has_many :pictures, :dependent => true
  belongs_to :primary_picture, :class_name => "Picture", :foreign_key => 'primary_picture_id'
  belongs_to :user
  
  def self.search(args)
    conditions = ["expires_at > ? AND " + args.map {|k, v| "LOWER(#{k}) LIKE ?"}.join(" OR "),
                  Time.now.to_formatted_s(:db), *args.values.map {|v| "%#{v}%"}]
    find(:all, :conditions => conditions, :order => "created_at DESC" )
  end
  
  def self.most_recent
    find :all, :limit => 5, :order => "created_at DESC", :conditions => ["expires_at > ?", Time.now.to_formatted_s(:db)] 
  end

  def full_name
    "#{firstname} #{lastname}"
  end
  


  def expired?
    expires_at < Time.now
  end
  
  def expires_soon?
    (expires_at > Time.now) and (expires_at < (Time.now + 3.months))
  end
end
