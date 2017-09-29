gem 'activerecord', '=4.2.7'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')

class Contact < ActiveRecord::Base

  def note=(note)
    @note = "#{@note} #{note}"
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end
end
