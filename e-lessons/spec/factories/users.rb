FactoryGirl.define do

  factory :user do
    name "Admin"
    email "generjet@gmail.com"
    password "1234568899"
    account "sumitomo123"

    trait :admin do
      role 'admin'
    end
  end


# ======== Transient model ===================================================
# factory :user do

#     trait :admin do
#       role 'admin'
#     end

#   transient do
#     role_name “admin”
#   end
 
#   role do
#     Role.find_by(name: role_name) || FactoryGirl.create(:role, name: role_name)
#   end
# end

end
