class Game
  include Mongoid::Document
  include Mongoid::Timestamps
  
  attr_accessible :sport, :date, :location, :price
  
  field :sport, :type => String
  field :date, :type => Date
  field :location, :type => String
  field :price, :type => Integer, :default => 0
  field :allowed_number_of_players, :type => Integer, :default => 10
  field :time, :type => String
  

  has_and_belongs_to_many :players
  has_many :comments, :as => :commentable
  belongs_to :user
  
  validates_numericality_of :allowed_number_of_players, :greater_than => 0
  validates_presence_of :sport, :message => "Non deve essere vuoto"
  validates_presence_of :date, :message => "Non deve essere vuoto"
  
  def validate!
    errors.add(:players, "Too many players for this game") if players.count > allowed_number_of_players
  end

  def enough_players
   self.allowed_number_of_players <= self.players.count
  end

end