class ChangeAccounttypeToUsertype < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :account_type, :user_type
  end
end
