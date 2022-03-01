class Corrector
  def correct_name(name)
    name.capitalize!.slice(0..9)
  end
end

pp check = Corrector.new
pp check.correct_name('schifffahrtsgesellschaft')
