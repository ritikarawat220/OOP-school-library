require_relative 'student'
class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students << student
    student.classroom = self
  end
end

classroom = Classroom.new('Physics')
student1 = Student.new(10, nil, name: 'Eva')
student2 = Student.new(12, nil, name: 'Frank')
student3 = Student.new(11, nil, name: 'Grace')

classroom.add_student(student1)
classroom.add_student(student2)
classroom.add_student(student3)

puts classroom.students.map(&:name)

