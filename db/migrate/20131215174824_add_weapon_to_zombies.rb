class AddWeaponToZombies < ActiveRecord::Migration
  def change
    add_column :zombies, :weapon, :string
  end
end
