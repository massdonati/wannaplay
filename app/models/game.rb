class Game
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :sport, :type => String
  field :date, :type => DateTime
  field :location, :type => String
  field :price, :type => Integer
  field :allowed_number_of_players, :type => Integer, :default => 10

  

  has_and_belongs_to_many :players
  has_many :comments, :as => :commentable 
  
  validates_numericality_of :allowed_number_of_players, :greater_than => 0



end