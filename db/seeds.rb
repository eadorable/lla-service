# db/seeds.rb

# Assuming you already have at least one user in the database.
# If not, you can create one as well.
user = User.first || User.create!(email: 'example@example.com', password: 'password')  # Adjust this to create a user if needed

# Create sample records and associate them with the user
Record.create!(
  record_date: Date.today,
  serial_number: "SN123456789",
  ticket_number: "TICKET001",
  device_type: "Laptop",
  customer_problem: "Screen flickering",
  lla_diagnose: "Checked cable connections and updated drivers.",
  action: "Replaced display cable.",
  user: user # Associate with the user
)

Record.create!(
  record_date: Date.today - 1.day,
  serial_number: "SN987654321",
  ticket_number: "TICKET002",
  device_type: "Camera",
  customer_problem: "Battery not charging",
  lla_diagnose: "Tested battery and charging port.",
  action: "Replaced battery.",
  user: user
)

Record.create!(
  record_date: Date.today - 2.days,
  serial_number: "SN112233445",
  ticket_number: "TICKET003",
  device_type: "Tablet",
  customer_problem: "Slow performance",
  lla_diagnose: "Cleared cache and checked for background processes.",
  action: "Performed factory reset.",
  user: user
)

Record.create!(
  record_date: Date.today - 3.days,
  serial_number: "SN556677889",
  ticket_number: "TICKET004",
  device_type: "Smartphone",
  customer_problem: "Wi-Fi disconnecting",
  lla_diagnose: "Checked network settings and reset router.",
  action: "Replaced Wi-Fi antenna.",
  user: user
)

puts "Sample records created successfully!"
