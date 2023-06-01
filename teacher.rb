require_relative 'person'

class Teacher < Person
  def initialize(age, specialization, name: 'Unknown')
    super(age, name: name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
