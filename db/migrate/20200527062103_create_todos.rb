class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.datetime   :start_date_time,   null: false
      t.string     :content,           null: false
      t.string     :campany
      t.string     :LOC

      t.timestamps
    end
    

  end
end
