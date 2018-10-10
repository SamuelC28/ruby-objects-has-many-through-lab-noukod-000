# class Patient
#   attr_accessor :name
# 
#   def initialize(name)
#     @name = name
#     @appointments = []
#   end
# 
#   def add_appointment(appointment)
#     @appointments << appointment
#     appointment.patient = self
#   end
# 
#   def appointments
#     @appointments
#   end
# 
#   def doctors
#     @appointments.collect { |appointment| appointment.doctor }
#   end
# end

class Patient
  attr_reader :name, :appointment, :doctor
  def initialize(name)
    @name = name
  end
  def new_appointment(doctor, date)
    Appointment.new(self, doctor, date)
  end
  def appointments
    Appointment.all.select do |appointment|
      appointment.patient == self
    end
  end
  def doctors
    Appointment.all.map do |appointment|
      appointment.doctor
    end
  end
end
