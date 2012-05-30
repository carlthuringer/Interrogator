class Birthday
  def self.interrogate
    year = ""
    month = ""
    day = ""
    puts "What year were you born in?"
    gets year
    puts "What month were you born in?"
    gets month
    puts "What day were you born on?"
    gets day
    puts "So, you were born on #{month} #{day}, #{year}?"
  end
end
