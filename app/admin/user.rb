ActiveAdmin.register User do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  index do
     selectable_column
     column :id
     column :email
     column :phone do |user|
      if user.profile
        "#{user.profile.phone}"
      end
     end
     column :name do |user|
       if user.profile
         "#{user.profile.first_name} #{user.profile.last_name}"
       end
     end
      column :adress do |user|
        if user.profile
          "#{user.profile.address} #{user.profile.locality} #{user.profile.postal_code}"
        end
      end
    actions
  end
end