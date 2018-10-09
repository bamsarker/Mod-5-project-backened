class Child < ApplicationRecord
    has_many :user_children
    has_many :users, through: :user_children
    has_many :days

    def child_parents
        child_all_users = self.user_children.map{|user_child| User.all.find(user_child.user_id)}
        child_all_users.select{|user| user.childminder == false}
    end 

    def age_years
        now = Time.now.utc.to_date
        dob = self.date_of_birth
        now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
    end

    def age_months
        now = Time.now.utc.to_date
        dob = self.date_of_birth
        if (now.month >= dob.month) 
            now.month - dob.month - ((now.day >= dob.day) ? 0 : 1)
        elsif (now.month < dob.month)
            12 - dob.month + ((now.day < dob.day) ? 0 : 1)
        end 
    end 
end
