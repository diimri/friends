class AddSuperadmin < ActiveRecord::Migration[6.1]

  def change
    User.create! do |u|
        u.email     = 'admin@example.com'
        u.password  = 'password'
        u.superadmin_role = true
    end
  end

end

