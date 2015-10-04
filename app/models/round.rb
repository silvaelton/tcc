class Round 
  include ActiveModel::Model

  IMAGE_TYPES = ['Animal', 'Humano', 'Objeto']
  IMAGE_IDS   = [0,0,0]


  def self.play!(options = {})
    @group  = options[:group_id]
    @player = options[:player]
    @index  = options[:index]
    @choice = options[:choice]

    case @group.to_i 
    when 1
      return false if @index.to_i == 90
      
      if @player == 1
          @play = Play.new
          @play.group_id  = @group
          @play.player_id = @player
          @play.choice_type = @choice
          @play.save
      end
    when 2
      if @player == 1
      end
      if @player == 2
      end
    when 3
      if @player == 1
      end
      if @player == 2
      end
    end
  end

  def self.turn!(index, group)
    if group.to_i == 1
      index
    else
      index = (index.to_i / 2)
      ((index.to_i / 2) == 0) ? 1 : index
    end
  end

  def self.player_turn!(index,group)
    if group.to_i == 1
      1
    else
      index.to_i % 2
    end
  end

  def self.images!(index)
    ids     = Array.new
    3.times { ids << rand(1...21) }

    [ids, IMAGE_TYPES.shuffle]
  end

end