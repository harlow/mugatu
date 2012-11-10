ActiveRecord::Migration.create_table :hansels do |t|
  t.string :name
  t.timestamps
end

class Hansel < ActiveRecord::Base
  include ActiveModel::ForbiddenMethodsProtection
end

ActiveRecord::Migration.create_table :mugatus do |t|
  t.string :name
  t.timestamps
end

class Mugatu < ActiveRecord::Base
  include ActiveModel::ForbiddenMethodsProtection

  def to_s
    "It's that damn Hansel! He's so hot right now!"
  end
end