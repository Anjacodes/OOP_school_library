class Corrector
  def correct_name(name)
    name.capitalize.slice(0..9) unless name.length <= 10
  end
end

pp check = Corrector.new
pp check.correct_name('Schifffahrtsgesellschaft')
