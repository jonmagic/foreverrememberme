class Memorial < ActiveRecord::Base
  validates_presence_of [ :firstname, :lastname, :hometown, :date_of_birth, :date_of_death ]
  has_many :comments
  has_many :pictures, :dependent => true
  belongs_to :primary_picture, :class_name => "Picture", :foreign_key => 'primary_picture_id'
  belongs_to :user
  has_and_belongs_to_many :tributes
  
  def self.search(args)
    conditions = ["expires_at > ? AND " + args.map {|k, v| "LOWER(#{k}) LIKE ?"}.join(" OR "),
                  Time.now.to_formatted_s(:db), *args.values.map {|v| "%#{v}%"}]
    find(:all, :conditions => conditions, :order => "created_at DESC" )
  end
  
  def self.admin_memorial_search(query)
    if !query.to_s.strip.empty?
      tokens = query.split.collect {|c| "%#{c.downcase}%"}
      find_by_sql(["SELECT * from memorials WHERE #{ (["(LOWER(firstname) LIKE ? OR LOWER(lastname) LIKE ? OR LOWER(hometown) LIKE ?)"] * tokens.size).join(" AND ") } ORDER by created_at DESC", *tokens.collect { |token| [token] * 3 }.flatten])
    else
      []
    end
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
