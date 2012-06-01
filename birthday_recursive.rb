class Birthday
  def self.questions
    ["What year were you born in?",
     "What month were you born in?",
     "What day were you born on?"]
  end

  def self.interrogate
    answers = questions.map do |question|
      puts question
      get_input
    end

    puts "So, you were born on #{answers[1]} #{answers[2]}, #{answers[0]}?"
  end

  def self.get_input
    input = ""
    input = gets("\n").strip
  end
end
