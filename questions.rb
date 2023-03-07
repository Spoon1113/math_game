class Questions

  def initialize
    @ran_num1 = rand(1..12)
    @ran_num2 = rand(1..12)
  end

  def ask_question(name)
    puts "#{name}: What does #{@ran_num1} times #{@ran_num2} equal?"
  end

  def correct_answer?(input)
  input.to_i == @ran_num1 * @ran_num2
  end

end