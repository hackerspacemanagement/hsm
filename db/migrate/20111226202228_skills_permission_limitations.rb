class SkillsPermissionLimitations < ActiveRecord::Migration
  def change
      # This, if not nil, contains the role a user must have to grant a particular user
      # the given skill.
      add_column :skills, :role_required_to_grant, :string
  end
end
