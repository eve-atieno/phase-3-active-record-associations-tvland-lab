class Actor < ActiveRecord::Base
    has_many :characters
    has_many :shows, through: :characters
  
    def characters
      Character.where(actor_id: id)
    end
  
    def full_name
      "#{first_name} #{last_name}"
    end
  
    def shows
      shows = []
      characters.each do |character|
        shows << character.show
      end
      shows.uniq
    end

    def list_roles
        characters.map do |character|
          "#{character.name} - #{character.show.name}"
        end
      end
    end
