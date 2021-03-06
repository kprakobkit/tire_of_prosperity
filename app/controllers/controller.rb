class Controller
  def convert_string_to_objects(string) # stay
    list_of_letter = []

    string.split("").each_with_index do |letter, index|
      list_of_letter << Letter.new(letter, index)
    end

    list_of_letter
  end

  def hide_phrase(phrase) # stay
    list_of_letter = convert_string_to_objects(phrase)
    letters_to_hide = phrase.split("").sample(phrase.length*0.5)
    exceptions =[" ", ",", ".", "?", "!", ";", ":"]
    list_of_letter.each do |letter|
      if exceptions.include?(letter.letter)
        next
      elsif letters_to_hide.include?(letter.letter)
        letter.hidden = true
      else
        letter.hidden = false
      end
    end

    list_of_letter
  end

  def done?(hidden_phrase, number_of_wrong)

    # if number_of_wrong > 4
    #   puts "\e[H\e[2J"
    #   puts "you lose"
    #   return true
    # end

    hidden_phrase.each do |letter|
      if letter.hidden == true
        return false
      end
    end
    puts "\e[H\e[2J"
    puts "you win!"
    true
  end

  def pick_a_category
    puts "What category would you like to choose from?"
    categories = Category.all
    categories.each do |category|
      puts "#{category.id}. #{category.name}"
    end
    puts
    print "> "
    user_input = gets.chomp
    @selected_category = Category.find(user_input)
    @selected_category.phrases.sample.phrase.downcase
  end

  def save_user_score(score)
    puts "Please enter your name:"
    puts
    print "> "
    user_name = gets.chomp
    UserScore.create(name: user_name, score: score, category_id: @selected_category.id)
  end

  def show_high_score_for_category
    puts "High scores for #{@selected_category.name}"
    @selected_category.user_scores.order(score: :desc).each_with_index do |user_score, index|
      puts "#{1+index}. #{user_score.name}  #{user_score.score}"
    end
  end
  # run program

  def play
    View.welcome_screen

    answer_phrase = pick_a_category
    hidden_phrase = hide_phrase(answer_phrase)
    View.show_hidden_phrase(hidden_phrase)
    letters_tried = []

    number_of_wrong = 0
    score = 0

    until done?(hidden_phrase, number_of_wrong)
      found_letter = false
      View.clear_screen
      score_multiplier = rand(1..10)
      View.show_score_multiplier(score, score_multiplier, @selected_category)
      View.show_hidden_phrase(hidden_phrase)
      View.tries(letters_tried)
      View.ask_for_user_input
      users_guess = gets.chomp.downcase
      letters_tried << users_guess


      hidden_phrase.each do |letter|
        if letter.letter == users_guess
          letter.hidden = false
          found_letter = true
        end
      end

      if found_letter
        score += answer_phrase.count(users_guess) * score_multiplier
      else
        score -= score_multiplier
      end
    end

    puts "answer: " + answer_phrase
    puts "Your final score: #{score}"
    save_user_score(score)
    puts "Thanks for playing"
    show_high_score_for_category
  end
end
