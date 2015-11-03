class Color < ActiveRecord::Base
  def self.my_pallete
    ["#fff", "#f00", "#0f0", "#00f"]
  end

  def self.default
    my_pallete.first
  end
end
