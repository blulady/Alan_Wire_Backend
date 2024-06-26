# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Department.destroy_all

["Engineering", "Extrusion", "Lead Person", "Maintenance", "Mfg Management", "Material Handler", "Next Step", "Office", "Repack", "Sales", "Str - Bunching", "Supervision", "Warehouse", "Wire Drawing"].each do |department_name|
    Department.find_or_create_by!(department_name: department_name)
end

Position.destroy_all
["Back Office", "Bare Repack Operator", "Contractor", "Irrigation Customer Service", "Electrical Customer Service", "Electrical Sales", "Engineering", "Extrusion Operator", "Extrusion Repacker", "FMLA", "Inactive", "Irrigation Sales", "Lead Person", "LOA", "Material Handler", 
"Management", "Maintenance", "Maitenance Management", "Production Management", "Quality Control", "Quality Tech", "Repack Operator", "Safety", "Scrap/Reclaim", "Summer Temp", "Supervisor", "Str/Bunch Operator" "Trainee", "Trainer",
"Warehouse", "Warehouse Manager", "Wire Drawing Operator"].each do |position_title|
    Position.find_or_create_by!(position_title: position_title)
end

User.destroy_all
User.create(email: "admin@email.com", password: "adminpassword", username: "admin")
User.create(email: "reg_user@email.com", password: "reg_userpassword", username: "reg_user")
admin_user = User.find_or_create_by(username: "admin")
reg_user = User.find_or_create_by(username: "reg_user")

Profile.destroy_all
Profile.create(employee_number: 12345, first_name: 'admin', last_name: 'admin', user_id: admin_user.id, is_admin: true)
Profile.create(employee_number: 12346, first_name: 'reg_user', last_name: 'reg_user', user_id: reg_user.id, is_admin: false)
admin_profile = Profile.find_by(employee_number: 12345)
reg_profile = Profile.find_by(employee_number: 12346)

Chart.destroy_all
Chart.create(chart_title: "Futures", chart_data: '{
    "type": "line",
    "data": {
      "labels": ["January", "February", "March", "April", "May", "June", "July"],
      "datasets": [{
        "label": "Price",
        "data": [12, 35, 75, 81, 55, 67, 99],
        "fill": false,
        "borderColor": "#36A2EB",
        "tension": 0.1
      }]
    }
  }')

Chart.create(chart_title: "Monthly Wire Output", chart_data: '{
  "type": "line",
  "data": {
    "labels": ["January", "February", "March", "April", "May", "June", "July"],
    "datasets": [{
      "label": "Wire (1000 ft.)",
      "data": [1200, 3500, 7500, 8100, 5500, 6700, 9900],
      "fill": false,
      "borderColor": "#FFCE56",
      "tension": 0.1
    }]
  }
}')

Chart.create(chart_title: "Sales Projections", chart_data: '{
      "type": "bar",
      "data": {
        "labels": ["July", "August", "September", "October", "November", "December", "January"],
        "datasets": [{
          "label": "Monthly Sales",
          "data": [65, 59, 80, 81, 56, 55, 40],
          "backgroundColor": "#FF6384",
          "borderColor": "#FF6384",
          "borderWidth": 1
        }]
      },
      "options": {
        "scales": {
          "y": {
            "beginAtZero": true
          }
        }
      }
    }')
    

Chart.create(chart_title: "Machine Down Time", chart_data: '{
  "type": "bar",
  "data": {
      "labels": ["Machine 1", "Machine 2", "Machine 3"],
      "datasets": [{
          "label": "Hours",
          "data": [15, 200, 75],
          "backgroundColor": ["#FF6384", "#36A2EB", "#FFCE56"],
          "hoverBackgroundColor": ["#FF6384", "#36A2EB", "#FFCE56"]
      }]
  },
  "options": {
      "responsive": true,
      "plugins": {
          "legend": {
              "position": "top"
          }
      }
  }
}')

Chart.create(chart_title: "Production", chart_data: '{
  "type": "pie",
  "data": {
      "labels": ["Machine 1", "Machine 2", "Machine 3"],
      "datasets": [{
          "data": [300, 50, 100],
          "backgroundColor": ["#FF6384", "#36A2EB", "#FFCE56"],
          "hoverBackgroundColor": ["#FF6384", "#36A2EB", "#FFCE56"]
      }]
  },
  "options": {
      "responsive": true,
      "plugins": {
          "legend": {
              "position": "top"
          }
      }
  }
}')

# ADMIN
admin_profile.departments << Department.find_by(department_name: "Engineering")
admin_profile.departments << Department.find_by(department_name: "Sales")
admin_profile.departments << Department.find_by(department_name: "Extrusion")
admin_profile.charts << Chart.find_by(chart_title: "Futures")
admin_profile.positions << Position.find_by(position_title: "Back Office")

# USER
reg_profile.departments << Department.find_by(department_name: "Engineering")
reg_profile.departments << Department.find_by(department_name: "Extrusion")
reg_profile.departments << Department.find_by(department_name: "Sales")
reg_profile.charts << Chart.find_by(chart_title: "Futures")
reg_profile.positions << Position.find_by(position_title: "Electrical Customer Service")

# DEPARTMENTS
engineering_dept = Department.find_by(department_name: "Engineering")
extrusion_dept = Department.find_by(department_name: "Extrusion")
sales_dept = Department.find_by(department_name: "Sales")
engineering_dept.charts << Chart.find_by(chart_title: "Machine Down Time")
engineering_dept.charts << Chart.find_by(chart_title: "Futures")
extrusion_dept.charts << Chart.find_by(chart_title: "Monthly Wire Output")
extrusion_dept.charts << Chart.find_by(chart_title: "Production")
sales_dept.charts << Chart.find_by(chart_title: "Sales Projections")

