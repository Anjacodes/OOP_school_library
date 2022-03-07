class Create_Person
  def initialize(state)
    @state = state
  end
  def create_person
    print 'Do you want to create a student (1)  or a teacher (2)? [Input the number]: '
    user_choice = gets.chomp
    print 'Age: '
    @age = gets.chomp.to_i
    print 'Name: '
    @name = gets.chomp
    case user_choice.to_i
    when 1 then create_student
    when 2 then create_teacher
    else p 'Please enter either 1 or 2'
    end
    end

  def create_student
    print 'Has parent permission? [Y/N]: '
    permission_input = gets.chomp.downcase
    permission = permission_input == 'y'
    @state[:people_list] << Student.new(@age, @name, parent_permission: permission)
    p 'Student created successfully'
    puts ''
  end

  def create_teacher
    print 'Specialization: '
    specialization = gets.chomp
    @state[:people_list] << Teacher.new(specialization, @age, @name)
    p 'Teacher created successfully'
    puts ''
  end
end