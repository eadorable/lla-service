# db/seeds.rb

# Assuming you already have at least one user in the database.
# If not, you can create one as well.
puts "Creating sample records..."
puts "Destroying all existing records..."
Device.destroy_all

user = User.first || User.create!(email: 'e.adorable@lla.de', password: 'password')  # Adjust this to create a user if needed

customers = ["DAIO Engineering", "BT Systems", "Eagle Vizion", "Valvan", "Ionia", "Boulegraf"]
device_types = ["MSI1.9", "MSI1.7", "MPL", "HSI", "MSI+RGB"]
FOV = [1000, 100, 2000, 1300, 1100, 900, 700, 500, 300, 1500]

1000.times do
  device_type = device_types.sample
  serial_number = "H#{rand(1000..999_999_999)}" # Random serial number
  customer = customers.sample
  fov = FOV.sample

  Device.create!(
    device_type: device_type,
    serial_number: serial_number,
    customer: customer,
    user: user, # Associate with the user
    fov: fov
  )
end

puts "Sample records created successfully!"
