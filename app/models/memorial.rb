class Memorial < ActiveRecord::Base
  validates_presence_of [ :firstname, :lastname, :hometown, :date_of_birth, :date_of_death ]
  has_many :comments
  has_many :pictures
  belongs_to :primary_picture, :class_name => "Picture", :foreign_key => 'primary_picture_id'
  belongs_to :user
  
  def self.search(query)
    if !query.to_s.strip.empty?
      tokens = query.split.collect {|c| "%#{c.downcase}%"}
      find_by_sql(["SELECT * from memorials WHERE #{ (["(LOWER(firstname) LIKE ? OR LOWER(lastname) LIKE ? OR LOWER(hometown) LIKE ?)"] * tokens.size).join(" AND ") } ORDER by created_at DESC", *tokens.collect { |token| [token] * 3 }.flatten])
    else
      []
    end
  end
  
  def self.most_recent
#     find_by_sql(["SELECT * from memorials LIMIT 5"])
    find :all, :limit => 5, :order => "created_at DESC" 
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
