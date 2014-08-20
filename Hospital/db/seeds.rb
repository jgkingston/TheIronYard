# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Faker::Config.locale = 'en-US'

def time_rand_past from = 0.0, to = Time.now
  Time.at(from + rand * (to.to_f - from.to_f))
end

def time_rand_future from = Time.now, to = (Time.now + 7592000)
  Time.at(from + rand * (to.to_f - from.to_f))
end

facilities = Facility.create([{name: "New Vegas Medical Clinic", description: "Best Care in the Wastes", bed: 20 }, {name: "Y-17", description: "Location Unknown", bed: 99}])

medications = Medication.create([{name: "Tylenol"}, {name: "RadAway"}, {name: "Placebo"}, {name: "RadX"}, {name: "StimPack"}, {name: "Mentats"}])


facilities.each do |facility|
  for i in 0..30
    Patient.create(lastname: "#{Faker::Name.last_name}", firstname: "#{Faker::Name.first_name}", description: "#{Faker::Lorem.paragraph}", gender: "#{'fe'*(i%2)}male", dob: "#{time_rand_past}", facility_id: "#{facility.id}")
  end
  for i in 0..5
    Doctor.create(name: "#{Faker::Name.last_name}", specialty: "#{Faker::Name.body_part} #{Faker::Name.operation}", facility_id: "#{facility.id}" )
  end
  facility.patients.each do |patient|
    Prescription.create(patient_id: "#{patient.id}", medication_id: "#{rand(medications.first.id..medications.last.id)}", instruction: "#{Faker::Hacker.say_something_smart}")
  end
  facility.patients.each do |patient|
    Appointment.create(patient_id: "#{patient.id}", doctor_id: "#{rand(facility.doctors.first.id..facility.doctors.last.id)}", when: "#{time_rand_future}")
  end
  facility.doctors.each do |doctor|
    Appointment.create(patient_id: "#{rand(facility.patients.first.id..facility.patients.last.id)}", doctor_id: "#{doctor.id}", when: "#{time_rand_future}")
  end

end

