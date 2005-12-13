class Memorial < ActiveRecord::Base
  validates_presence_of [ :firstname, :lastname, :hometown, :date_of_birth, :date_of_death ]
  has_many :comments
  has_many :pictures
  
  def self.search(query)
    if !query.to_s.strip.empty?
      tokens = query.split.collect {|c| "%#{c.downcase}%"}
      find_by_sql(["SELECT * from memorials WHERE #{ (["(LOWER(firstname) LIKE ? OR LOWER(lastname) LIKE ? OR LOWER(hometown) LIKE ?)"] * tokens.size).join(" AND ") } ORDER by created_at DESC", *tokens.collect { |token| [token] * 3 }.flatten])
    else
      []
    end
  end

end
