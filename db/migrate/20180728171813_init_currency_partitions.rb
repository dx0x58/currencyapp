class InitCurrencyPartitions < ActiveRecord::Migration[5.2]
  def up
    unless extension_present?('pg_partman')
      raise 'Extension pg_partman is required'
    end

    execute <<~SQL
      SELECT partman.create_parent('public.currencies', 'created_at', 'partman', 'weekly');
    SQL
  end

  def down
    execute <<-SQL
      select partman.undo_partition('public.currencies', p_keep_table := false);
      delete from partman.part_config where parent_table = 'public.currencies';
    SQL
  end

  private

  def extension_present?(name)
    execute("select extname from pg_extension where extname = '#{name}' limit 1").to_a.present?
  end
end
