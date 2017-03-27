class AddOperations < ActiveRecord::Migration
  def up
    Rake::Task['onetime:add_oprations'].invoke
  end

  def down
  end
end
