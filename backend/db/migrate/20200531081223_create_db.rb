class CreateDb < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
    end
    create_table :user_friends do |t|
      t.integer :user_id
      t.integer :friend_id
    end
    create_table :movies do |t|
      t.string :name
    end
    create_table :liked_movies do |t|
      t.integer :user_id
      t.integer :movie_id
    end
  end
end
