require './person'

class Teacher < Person
  def initialize(specialization, *args, **kwargs)
    super(*args, **kwargs)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

# p teacher1 = Teacher.new(38, 'Tom Johnson', 'mathematics')
# p teacher1.can_use_services?

# p teacher2 = Teacher.new(16, 'Laura Smith', 'music')
# p teacher2.can_use_services?
