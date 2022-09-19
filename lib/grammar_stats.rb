class GrammarStats
  def initialize
    @true_counter = 0
    @overall_counter = 0
  end

  def counters
    return @true_counter
    return @overall_counter
  end

  def check(text)
    fail "Error: No text entered." if text.empty?
    check_result = (text.match?(/^[A-Z]/) && text.match?(/[.!?]$/)) 
    if check_result == true 
      @true_counter +=1
    end
    @overall_counter +=1
    return check_result
  end

  def percentage_good
    @percentage_good = ((@true_counter / @overall_counter.to_f) * 100).to_i
  end
end