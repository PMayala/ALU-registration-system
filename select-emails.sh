#!/bin/bash
# Select just the emails of the students
cut -d',' -f 1 students-list_0923.txt > student-emails.txt
echo "Student emails have been selected and saved to student-emails.txt."

