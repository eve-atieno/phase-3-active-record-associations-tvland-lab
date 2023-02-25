class Show < ActiveRecord::Base
    has_many :characters
    has_many :actors, through: :characters
    belongs_to :network
  
    # Define characters as an association
    def characters_association
      characters
    end
  
    def actors_list
      self.actors.map(&:full_name)
    end
  end