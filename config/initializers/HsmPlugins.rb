class Plugins
  @@all = []
  def self.all
    @@all ||= []
  end

  def self.add element
    if @@all
      @@all << element
    else
      @@all = [element]
    end
  end
end
