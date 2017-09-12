class Player

  def play_turn(warrior)
     
    #The warrior does not need rest
    if(!needRest?(warrior))
      strongWarrior(warrior)

    #The warrior needs rest
    else
      warriorNeedsRest(warrior)
    end
  end
  def warriorNeedsRest(warrior)
      #If something is directly in front of her
      if(!coastClear?(warrior))
        warrior.walk!(:backward)
      #If nothing is directly in front of her  
      elsif(coastClear?(warrior))
        warrior.rest!
      else
        warrior.attack!
      end 
  end


  def strongWarrior(warrior)
      #Walk if no one is in from of her
      if(warrior.feel.empty?)
        warrior.walk!
      #Attack if something is in front of her
      else
        warrior.attack!
      end  
  end

  def needRest?(warrior)
    if(warrior.health > 10)
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

