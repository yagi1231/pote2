class Post < ApplicationRecord
    validates :room, {presence: true}
    validates :introduce, {presence: true}
    validates :fe, {presence: true}
    validates :address, {presence: true}
    validates :user_idd, {presence: true}
 
    scope :get_by_name, ->(room) {
        where("room like ?", "%#{room}%")
        }

        def user
            return User.find_by(id: self.user_idd)
          end
       

          
end