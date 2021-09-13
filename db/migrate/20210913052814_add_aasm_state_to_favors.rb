class AddAasmStateToFavors < ActiveRecord::Migration[6.1]
  def change
    add_column :favors, :aasm_state, :string
  end
end
