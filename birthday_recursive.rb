class Birthday
  def self.interrogate
    puts "What year were you born in?"
    year = get_input
    puts "What month were you born in?"
    month = get_input
    puts "What day were you born on?"
    day = get_input
    puts "So, you were born on #{month} #{day}, #{year}?"
  end

  def self.get_input
    input = ""
    gets input
    input
  end
end
