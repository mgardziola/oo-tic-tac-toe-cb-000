class TicTacToe
  def initialize(board = nil)
    @board=board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index (user_input)
    user_input.to_i - 1 
  end 
  
  def move(input_to_index, token = "X")
    @board[input_to_index] = token
  end
  
  def position_taken?(input_to_index)
    if @board[input_to_index] == "X" || @board[input_to_index] == "O"
      return true  
    else @board[input_to_index] == "" || " "
      return false 
    end 
  end
  
  def valid_move?(input_to_index)
    if input_to_index.between?(0, 8) && !position_taken?(input_to_index)
      return true 
    else 
      return false 
    end 
  end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn
    
    user_input = gets.strip
    
    index = input_to_index(user_input)
    
    if valid_move?(index)
     token = current_player
      move(index, token)
      display_board
    else 
      puts "Please enter 1-9:"
      turn 
    end
    
  end
  
  def won?
    WIN_COMBINATIONS.each do |combination|
      index_1 = combination[0]
      index_2 = combination[1]
      index_3 = combination[2]
   
    
    combo_1 = @board[index_1]
    combo_2 = @board[index_2]
    combo_3 = @board[index_3]
    
    if @board[index_1] == "X" && @board[index_2] == "X" && @board[index_3] == "X"  
      return combination 
    elsif @board[index_1] == "O" && @board[index_2] == "O" && @board[index_3] == "O" 
      return combination
    end
   
     end 
      return false
  end
  
  def full?
    @board.all? {|token| token == "X" || token == "O"} 
  end
  
  def draw? 
    full? && !won? ? true : false 
  end
  
  def over? 
    draw? || won? ? true : false
  end
  
  def winner
   if won?()
    x_count = @board.count("X")
    o_count = @board.count("O")
    
    if x_count > o_count
      return "X" 
    else 
      return "O"
    end
    end
  end 
  
  def play()
    while !over? 
      puts "Please enter 1-9:"
      turn 
    end 
    
    if won?
      puts "Congratulations #{winner}"
    elsif draw?
      puts "Cat's Game!"
    end
  
  end
  
  end
  

  

  