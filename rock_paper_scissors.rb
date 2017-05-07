class RockPaperScissors
  GAME_RULE = {
    :rock => {
      scissor: :win
    },
    :paper => {
      rock: :win
    },
    :scissors => {
      paper: :win
    }
  }

  VAILD_INPUT = %i(rock paper scissors)

  def initialize(params)
    @player_1 = params.argv[0]
    @player_2 = params.argv[1]

    check_input

  rescue Exception => e
    puts e.message
    # puts e.backtrace.inspect
    exit
  end

  def call
    proccess_result

    puts "Player 1 : #{@player_1_result}"
    puts "Player 2 : #{@player_2_result}"
  end

  private

  def check_input
    raise "please give choises for two players, ex: #{VAILD_INPUT.join(', ')}" unless @player_1 && @player_2

    @player_1 = @player_1.downcase.to_sym
    @player_2 = @player_2.downcase.to_sym

    raise "player 1 didn't give a correct choice" unless VAILD_INPUT.include? @player_1

    raise "player 2 didn't give a correct choice" unless VAILD_INPUT.include? @player_2
  end

  def proccess_result
    return @player_1_result = @player_2_result = 'equal' if @player_1 == @player_2

    @player_1_result = GAME_RULE[@player_1][@player_2] || :lose
    @player_2_result = GAME_RULE[@player_2][@player_1] || :lose
  end
end

RockPaperScissors.new(ARGF).call
