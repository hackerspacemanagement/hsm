class AddPaperclipTools < ActiveRecord::Migration
    def change
        add_column :tools, :picture_file_name,    :string
        add_column :tools, :picture_content_type, :string
        add_column :tools, :picture_file_size,    :integer
        add_column :tools, :picture_updated_at,   :datetime
    end
end
