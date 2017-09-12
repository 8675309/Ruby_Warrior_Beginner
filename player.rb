class Player
  
  :backward
  :attack
  :forward
  :rest
  
  def initialize()
     @minHealth = 20
     @lastMove = 'nothing'
     @lastHealth = 0
     @archerAttack = false
  end

  def play_turn(warrior)
    print "Archer Attack? "
    puts @archerAttack

    if(archerAttack?(warrior))
      @archerAttack = true
    end    
    #warrior is strong or is being attacked by an archer
    if(!needRest?(warrior) || @archerAttack)
      beAggressive(warrior)
    #The warrior needs rest
    else
      rest(warrior)
    end
    @lastHealth = warrior.health
  end

  def rest(warrior)
      #If something is directly in front of her
      if(!coastClear?(warrior))
        warrior.walk!(:backward)
        @lastMove = :backward
      #If nothing is directly in front of her  
      elsif(coastClear?(warrior))
        warrior.rest!
        @lastMove = :rest
      end 
  end

  def archerAttack?(warrior)
    if( @lastMove == :rest && warrior.health < @lastHealth )
      true
    else
      false
    end
  end  

  def beAggressive(warrior)
      #Walk if no one is in from of her
      if(warrior.feel.empty?)
        warrior.walk!
        @lastMove = :forward
      #Attack if something is in front of her
      else
        warrior.attack!
        @lastMove = :attack
      end  
  end

  def needRest?(warrior)
    if(warrior.health >= @minHealth)
      false
    else 
      true
    end
  end 
  
  def coastClear?(warrior)
    if(warrior.feel.empty?)
      true
    else
      false
    end
  end
end

