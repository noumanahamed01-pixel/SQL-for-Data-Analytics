while True:
    print("===========Student_Report===========")
    print("1. Add Student:")
    print("2. View Student:")
    print("3. Calculate Grade:")
    print("4. Exit")
    choice=int(input("Enter Your Choice:\n"))
    if choice==1:
        name=input("Enter Student Name:\n")
        age=int(input("Enter Student Age:\n"))
        marks=int(input("Enter Student Marks:\n"))
    elif choice==2:
        print(f"Student Name: {name}")
        print(f"Age: {age}")
        print(f"Marks: {marks}")
    elif choice==3:
        if marks>90:
           print("Grade A")
        elif marks>=80 and marks<=89:
             print("Grade B")
        elif marks>=70 and marks<=79:
            print("Grade C")
        else:
            print("Failed")
    elif choice==4:
        print("Exit")
    else:
        print("Invalid Choice.")