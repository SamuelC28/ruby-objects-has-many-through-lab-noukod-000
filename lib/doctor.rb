# class Doctor
#   attr_accessor :name
# 
#   def initialize(name)
#     @name = name
#     @appointments = []
#   end
# 
#   def add_appointment(appointment)
#     @appointments << appointment
#     appointment.doctor = self
#   end
# 
#   def appointments
#     @appointments
#   end
# 
#   def patients
#     @appointments.collect { |appointment| appointment.patient }
#   end
# end

class Doctor
  attr_reader :name, :appointment, :patient
  @@all_doc = []
  def initialize(name)
    @name = name
    @@all_doc << self
  end
  def self.all
    @@all_doc
  end
  def new_appointment(patient, date)
    Appointment.new(patient, self, date)
  end
  def appointments
    Appointment.all.select do |appointment|
      appointment.doctor == self
    end
  end
  def patients
    appointments.map do |appointment|
      appointment.patients
    end
  end
end