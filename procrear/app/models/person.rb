class Person < ApplicationRecord
    has_one :loan

    def full_name
        first_name + " " + last_name
    end

    
    def sexo
        if self.gender == 1
            "Masculino"
        else
            "Femenino"
        end
    end

    def edad
        Time.now.to_date - self.birth_date.to_date
    end
end
