class Player


  def play_turn(warrior)
    
    if(!needRest?(warrior))
      if(warrior.feel.empty?)
        warrior.walk!
      else
        warrior.attack!
      end  
    elsif(!coastClear?(warrior))
        warrior.walk!(:backward)
    elsif(coastClear?(warrior))
      warrior.rest!
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
