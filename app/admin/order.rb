ActiveAdmin.register Order do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :list, :of, :washer_id, :on, :order
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
    column :user_id
    column :name do |order|
      "#{order.user.profile.full_name}" if order.user && order.user.profile
    end
    column :created_at
    column :email do |order|
      "#{order.user.email}" if order.user
    end
    column :temperature
    column :pickup_start_date
    column :delivery_start_date
    column :address do |order|
      "#{order.user.profile.full_address}" if order.user && order.user.profile
    end
    column :status
    actions
  end

  form do |f|
    f.input :washer, as: :select, collection: Hash[User.all.map{|u| [u.profile.full_name, u.id]}]
    f.submit
  end
  # show do
  #   div do
  #     "#{order.user.profile.full_name}" if order.user && order.user.profile
  #   end
  # end
end