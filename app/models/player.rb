class Player

  include Mongoid::Document

  field :name, :type => String
  field :email, :type => String
  
  belongs_to :game

end