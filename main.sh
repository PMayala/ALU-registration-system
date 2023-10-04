#!/bin/bash

  # Function to create a student record
   create_student_record() {
 	echo "Enter Student Email:"
 	read email
 	echo "Enter Student Age:"
 	read age
 	echo "Enter Student ID:"
 	read student_id

 # Store the student information in the file
 	echo "$email, $age, $student_id" >> students-list_0923.txt
 	echo "Student record created successfully."
   }

 # Function to view all students
   view_all_students() {
 	echo "List of all students:"
 	cat students-list_0923.txt
   }

 # Function to delete a student record by Student ID
   delete_student_by_id() {
 	echo "Enter Student ID to delete:"
 	read student_id

 # Use grep to remove the line containing the specified studentID
 	sed -i "/$student_id/d" students-list_0923.txt
 	echo "Student with ID $student_id deleted successfully."
   }

 # Function to update a student record by Student ID
   update_student_by_id() {
 	echo "Enter Student ID to update:"
 	read student_id
 	echo "Enter new Student Email:"
 	read new_email
 	echo "Enter new Age:"
 	read new_age

 # Use awk to find and replace the line containing the specified student ID
 	awk -v id="$student_id" -v email="$new_email" -v age="$new_age" '{if ($3 == id) $1=email; $2=age}1' OFS=", " students-list_0923.txt > temp.txt
 	mv temp.txt students-list_0923.txt
 	echo "Student with ID $student_id updated successfully."
   }

 # Main menu
   while true; do
 	echo "Choose an option:"
 	echo "1. Create Student Record"
 	echo "2. View All ALU BSE Students"
 	echo "3. Delete Student Record"
 	echo "4. Update Student Record"
 	echo "5. Exit"
 	read choice

 	case $choice in
   	1)
     	create_student_record
     	;;
   	2)
     	view_all_students
     	;;
   	3)
     	delete_student_by_id
     	;;
   	4)
     	update_student_by_id
     	;;
   	5)
     	echo "Exiting the application."
     	exit
     	;;
   	*)
     	echo "Invalid option. Please try again."
     	;;
 	esac
 done

