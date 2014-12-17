ActiveAdmin.register Order do
  permit_params :washer_id, :temperature, :pickup_start_date, :delivery_start_date, :formula_id

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
    column :washer do |order|
      "#{order.washer.profile.full_name}" if order.washer && order.washer.profile
    end
    actions
  end

  form do |f|
    f.input :washer, as: :select, collection: Hash[User.washer.map{|u| [u.profile.full_name, u.id]}]
    f.input :temperature
    f.input :pickup_start_date
    f.input :delivery_start_date
    f.input :formula

    f.submit
  end

  show do
    div do
      "User: #{order.user.profile.full_name}" if order.user && order.user.profile
    end
    div do
      "Address: #{order.user.profile.full_address}" if order.user && order.user.profile
    end
    div do
      "Washer: #{order.washer.profile.full_name}" if order.washer && order.washer.profile
    end

  end
end