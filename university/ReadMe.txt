This university contract will 
- list all the different faculties and their Dean's
- List the departments in a faculty, their HOD's and the lecturers
- deposit money into the university
- students can pay school fees into the university contract
- the struct of the students will have, their name, Reg no, Year of admission, 
year of graduation, school fees paid or not, active or not, Gp(grade point), whether course rep or not. 

// PAYMENT FUNCTIONS
- function for students to pay school fees
- each student will receive a certain percentage
 of their school fees according to their grade point as a reward at the end of the semester.
- each course rep receives a certain amount at the end of the semester
- Function to pay Dean's 
- Function to pay HOD's
- Function to pay lecturers

// A book NFT marketplace that you can filter according to your department and purchase digital books

//more Global mappings or VARIABLES
- i'll have an array of addresses that will be allowed to graduate or admit or expel a student . 
so it's going to be the VC ie the msg.sender and the registrar. They are the only ones that can do this

// Every lecturer struct will have a property for if he/she is a dean, an HOD. This will help in changing 
deans and HOD's quickly.

//student management functions
- Function to admit a student (require that only the registrar can do this but with the signature of the vc)
- Function to change a Dean (require that only the VC ie the msg.sender can do this)
- Function to change an HOD (require that only the VC ie the msg.sender can do this)
- Function to Graduate a student (require that only the registrar can do this but with the signature of the vc)
- Function to expel a student (require that only the registrar can do this but with the signature of the vc)



VARIABLES
fee price
Dean salary fee
HOD fees
Lecturer fees
percentage of student disbursement fees
school fees for each faculty and departments
