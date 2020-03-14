import pyautogui
import time
import random
from datetime import datetime
random.seed(datetime.now())

pyautogui.FAILSAFE=False

name_male = ["Abhinav Amin","Qabeel Sathe","Abhishek Kara","Nakul Ramkissoon","Bahadur Bhargava","Kalyan Koshy","Himanshu Sodhani","Charandeep Vohra","Hanuman Virk","Nitin Ganesan","Krishna Persaud","Sohail Mital","Kartik Chada","Mohan Ghosh","Govind Sane","Hanuman Mishra","Uday Bobal","Rajesh Mohabir","Aadish Trivedi","Varun Gaba","Emran Sachdev","Suresh Deol","Alex Narayanan","Satish Wason","Sid Gagrani","Nazir Chaudhary","Sharad Bansal","Jaswant Shroff","Saurabh Dar","Parveen Loyal","Atul Sule","Arjun Garde","Sai Bhavsar","Ajinkya Kadakia","Devendra Sura","Srinivasan Sagar","Munaf Jaggi","Chand Mehta","Parvez Gopal","Parveen Bobal","Harpreet Kala","Samir Naik","Azhar Cheema","Tanay Amin","Rupesh Viswanathan","Fakaruddin Uppal","Giaan Prabhu","Sumit Sundaram","Sirish Panchal","Ratan Swaminathan","Akhil Nawal","Shashank Ghose","Sai Iyengar","Owais Jaggi","Himanshu Subramaniam","Kailash Chaudhary","Alex Sheth","Arpit Master","Ajay Dave","Jobin Dhawan","Raju Sarkar","Govind Magar","Yogesh Karnik","Kalyan Chawla","Pradeep Chaudhary","Chinmay Sarin","Pirzada Mane","Aniruddh Parsa","Sharad Lal","Fardeen Venkatesh","Ibrahim Bhakta","Mohanlal Sankaran","Mohanlal Gobin","Fakaruddin Ratti","Ghanshyam Sami","Ehsaan Kar","Emran Wadhwa","Arpit Nagar","Sai Kapur","Akhil Pai","Vivek Pardeshi","Kushal Apte","Subhash Bhatti","Ajay Memon","Mohanlal Bala","Baalkrishan Saran","Yogesh Varma","Amrit Sarraf","Tanay Vaidya","Virat Vaidya","Pravin Ganguly","Gaurav Ramroop","Zaad Saini","Suresh Tiwari","Tarun More","Deepesh Mishra","Abhishek Suri","Samir Kapadia","Hari Dasgupta","Parveen Baral","Sahil Golla","Siddharth Savant","Satish Chia","Jatin Masih","John Barman","Deep Wali","Aadil Pathak","Ekbal Mital","Nayan Shere","Gajendra Das","Abbas Kadakia","Wahid Bhandari","Hetan Kapur","Gauransh Uppal","Qabool Sabharwal","Suresh Ghose","Wahid Dial","Omar Andra","Ekbal Balay","Chirag Mane","Lalit Ramnarine","Kirti Raja","Nirmal Goda","Sid Mital","Srinivasan Boase","Krishna Thaman","Pirzada Mall","Himesh Barman","Aniruddh Sule","Venkat Deol","Srinivasan Morar","Munaf Parmar","Arvind Saraf","Hanuman Tandon","Animesh Radhakrishnan","Bhola Ganguly","Ghanshyam Brahmbhatt","Satishwar Kabra","Jobin Gandhi","Wafa Natarajan","Parveen Narula","Manpreet Bir","Neerendra Kara","Naseer Chowdhury","Devendra Manne","Gauransh Bose","Vikrant Pau","Pranay Krish","Charandeep Lata","Qabool Karan","Sahil Thaman","Rajesh Bumb","Ghalib Tara","Mitesh Sood","Zahir Mital","Abhinav Patil","Gaurav Sridhar","Jagat Sharaf","Chirag Narayan","Wafa Mandal","Govind Dial","Umar Tailor","Munaf Lad","Bhola Bakshi","Rajesh Mahal","Alex Bhatnagar","Labeen Viswanathan","Kartik Tella","Obaid Bedi","Moti Vaidya","Kamlesh Tripathi","Brock Yohannan","Rahim Mahabir","Nakul Kapadia","Elias Krishnan","Hemendra Rama","Abhishek Barad","Gauransh Mander","Ujwal Parekh","Yash Varty","Ujwal Lodi","Arun Srinivas","Nakul Parikh","Tushar Tata","Mehul Bhatia","Satishwar Borah","Mehul Chandran","Darpan Kurian","Shashank Ratta","Radhe Maraj","Manpreet Chopra","Fardeen Khare","Rupal Deshpande","Rashid Magar","Sirish Datta","Deepesh Gandhi","Wafiq Kalla","Tarun Bali","Tanay Misra","Jagat Barman"]
name_female =["Vimala Atwal","Lakshmi Narayanan","Jayshree Shenoy","Nupur Bora","Kasturba Ahluwalia","Nandini Sethi","Damini Nagy","Zeenat Anand","Kamini Chana","Namita Kumer","Aastha Ratti","Isha Chandra","Alpa Kuruvilla","Priyanka Maharaj","Kiran D’Alia","Laveena Gandhi","Trishana Dada","Indrani Cheema","Hema Sibal","Indrani Vohra","Jiya Tak","Yamini Ramkissoon","Mukti Sura","Aayushi Ganesh","Shobha Chanda","Ragini Nigam","Damini Narula","Gowri Narayanan","Supriya Varty","Nagma Gade","Sukriti Kashyap","Swati Nair","Kusum Philip","Manjari Bakshi","Jagruti Arora","Afreen Rama","Rakhi Rajagopalan","Kim Surana","Bhairavi Lala","Zara Nair","Zara Desai","Anjana Palla","Farah Deo","Runjhun Choudhury","Swati Ratti","Namita Krish","Damini Chandra","Bhaagyasree Dugar","Nupur Butala","Divya Sarraf","Damini Parikh","Mini Cherian","Basanti Bath","Radhika Chia","Isha Kalla","Bagwati Sarma","Charu Chadha","Lakshmi Murty","Sameedha Rattan","Ruchi Amin","Sheetal Pant","Babita Ghosh","Jayshree Gade","Teena Gill","Munni Mehan","Mridula Sastry","Tanuja Sodhani","Mayawati Sandhu","Nishita Deol","Riya Kibe","Nancy Minhas","Nishi Doctor","Neela Oak","Damini Raman","Anshula Sunder","Kim Mahadeo","Damini Magar","Kirti Khosla","Kamini Lad","Runjhun Taneja","Nilima Som","Kusum Gole","Chhavi Beharry","Chhavi Balakrishnan","Devika Narine","Amolika Anne","Charu Sarna","Rohini Varghese","Kanika Mehta","Geetanjali Surana","Mayawati Nagy","Yamini Bath","Prerna Hans","Chandni Rajagopal","Charu Mishra","Anshu Khalsa","Supriya Dalal","Bhanupriya Balan","Munni Lall","Sara Sundaram","Sameedha Dar","Heena Wali","Chandni Mallick","Sushmita Menon","Riddhi Minhas","Rimi Sur","Anjana Jani","Pinky Ravel","Priyanka Sachar","Farah Bajaj","Urmi Sami","Fatima Narain","Preshita Sidhu","Jagruti Muni","Rosey Rajan","Veena Sing","Geetanjali Shah","Kalyani Dugar","Tejaswani Prakash","Esha Matthai","Chhaya Srivastava","Narmada Tank","Neha Naruka","Kiran Narang","Rohini Meka","Sunita Soni","Anshu Yohannan","Urmi Kapoor","Uma Sehgal","Tulsi Karan","Damini Menon","Sameedha Om","Amolika Mehrotra","Hema Garg","Mayawati Hora","Rita Sehgal","Aayushi Sha","Nandini Deo","Sukriti Rastogi","Ruchi Savant","Esha Jayaraman","Damini Rau","Shweta Talwar","Kiran Shukla","Nupur Hayer","Esha Tripathi","Shobha Nagarajan","Gunjan Bahri","Lalita Kurian","Megha Sankar","Naina Balasubramanian","Ragini Gara","Kunti Deo","Alaknanda Nadkarni","Mukti Dhingra","Heena Nadkarni","Tanuja Sandal","Seema Arora","Munni Sura","Alaknanda Pal","Nitika Shukla","Namita Aurora","Hina Saran","Zara Bava","Amrita Behl","Ankita Bera","Fatima Biyani","Laveena Venkataraman","Esha Arora","Riya Saraf","Kalpana Parsa","Supriya Dhillon","Poonam Srinivas","Himani Borra","Sapna Bansal","Chhavi Tata","Sushmita Ramesh","Supriya Rau","Swati Shankar","Bhairavi Som","Preshita Kohli","Esha Krish","Aayushi Sani","Munni Balakrishnan","Preshita Dalal","Isha Menon","Anjana Narula","Himani Sridhar","Jayshree Buch","Vineeta Kale","Madhu Vasa","Komal Prashad","Niyati Verma","Rohini Baria","Akhila Hegde","Aishwarya Aggarwal","Namita Nath","Pinky Ganguly","Diya Agrawal","Jasmin Sem"]

random.shuffle(name_male)

cnt = 1;
for x in name_female:
    while pyautogui.locateOnScreen('CApture.png') == None:
        print("not found")
    pyautogui.click(157, 374)
    pyautogui.typewrite(x)
    print(x + "=" + str(cnt) )

    #Age
    pyautogui.hotkey('Tab')
    time.sleep(0.5)
    for no in range(random.randint(1,10)):
        pyautogui.keyDown('down')

    #Gender
    pyautogui.hotkey('Tab')
    time.sleep(0.5)
    #pyautogui.keyDown('space')
    pyautogui.keyDown('down')

    pyautogui.hotkey('Tab')
    time.sleep(0.5)

    #Profession
    pyautogui.hotkey('Tab')
    time.sleep(0.5)
    for no in range(random.randint(1,15)):
        pyautogui.keyDown('down')


    #Annual Household Income
    pyautogui.hotkey('Tab')
    time.sleep(0.5)
    for no in range(random.randint(1,18)):
        pyautogui.keyDown('down')

    #Which of the following social media sites do you use on a regular basis? (Please select all that apply)
    no_opt = 0
    for no in range(5):
        pyautogui.hotkey('Tab')
        choice = random.randint(1,5)
        if choice%2 == 0 :
            pyautogui.keyDown('space')
            no_opt = 1
        time.sleep(1)
    if no_opt == 0:
        pyautogui.keyDown('space')


    #Time spent on social media per week
    pyautogui.hotkey('Tab')
    time.sleep(0.5)
    randno = random.randint(0,5)
    if randno == 0:
        pyautogui.keyDown('space')
    else:
        for no in range(randno):
            pyautogui.keyDown('down')


    #Time spent on traditional marketing
    pyautogui.hotkey('Tab')
    time.sleep(0.5)
    randno = random.randint(0,5)
    if randno == 0:
        pyautogui.keyDown('space')
    else:
        for no in range(randno):
            pyautogui.keyDown('down')


    #Does social media trigger you to purchase a product/service?
    pyautogui.hotkey('Tab')
    time.sleep(0.5)
    #for no in range(random.randint(1,4)):
    pyautogui.keyDown('space')


    #Have you ever clicked on any ads on social media?
    pyautogui.hotkey('Tab')
    time.sleep(0.5)
    randno = random.randint(0,2)
    if randno == 0:
        pyautogui.keyDown('space')
    else:
        pyautogui.keyDown('down')


    #Have you ever participated in campaigns or contests on social media?
    pyautogui.hotkey('Tab')
    time.sleep(0.5)
    pyautogui.keyDown('space')
    #for no in range(random.randint(1,3)):
    #    pyautogui.keyDown('down')

    #Which of the following traditional marketing channels do you find attractive? *
    no_opt = 0
    for no in range(4):
        pyautogui.hotkey('Tab')
        choice = random.randint(1,10)
        if choice%2 == 0 :
            pyautogui.keyDown('space')
            no_opt = 1
        time.sleep(1)
    if no_opt == 0:
        pyautogui.keyDown('space')

    #Do you feel information searching is easier on social media as compared to traditional marketing channels?
    pyautogui.hotkey('Tab')
    time.sleep(0.5)
    randno = random.randint(0,2)
    if randno == 0:
        pyautogui.keyDown('space')
    else:
        for no in range(randno):
            pyautogui.keyDown('down')


    #Do you search for brand/product information on social media before making a purchase?    pyautogui.hotkey('Tab')
    pyautogui.hotkey('Tab')
    time.sleep(0.5)
    randno = random.randint(0,1)
    if randno == 0:
        pyautogui.keyDown('space')
    else:
        for no in range(randno):
            pyautogui.keyDown('down')

    #Rank on a scale of 1 to 5 the source of product / brand information you use from the following (1 being the highest and 5 being the lowest) *
    num_list = [1,3,2,4,0]
    #random.shuffle(num_list)
    for num1 in num_list:
        pyautogui.hotkey('Tab')
        time.sleep(0.5)
        if num1 == 0:
            pyautogui.keyDown('space')
        else :
            for no in range(num1):
                pyautogui.keyDown('down')


    #Do you feel social media draws more consumers attention than traditional media channels  pyautogui.hotkey('Tab')
    pyautogui.hotkey('Tab')
    time.sleep(0.5)
    randno = random.randint(0,2)
    if randno == 0:
        pyautogui.keyDown('space')
    else:
        for no in range(randno):
            pyautogui.keyDown('down')

    #Rank on a scale of 1 to 5 the source of product / brand information you use from the following (1 being the highest and 5 being the lowest) *
    num_list = [5,1,5,4]
    random.shuffle(num_list)
    for num1 in num_list:
        pyautogui.hotkey('Tab')
        time.sleep(0.5)
        for no in range(num1):
            pyautogui.keyDown('down')

    # Do you search for brand/product information on social media before making a purchase?    pyautogui.hotkey('Tab')
    pyautogui.hotkey('Tab')
    time.sleep(0.5)
    randno = random.randint(0,1)
    if randno == 0:
        pyautogui.keyDown('space')
    else:
        pyautogui.keyDown('down')



    #Rank the following social media posts in order of your liking (1 being the highest and 7 being the lowest) *    num_list = [1,2,3,4,5]
    num_list = [6, 1, 5, 4, 0, 3, 2]
    #random.shuffle(num_list)
    for num1 in num_list:
        pyautogui.hotkey('Tab')
        time.sleep(0.5)
        if num1 == 0:
            pyautogui.keyDown('space')
        else :
            for no in range(num1):
                pyautogui.keyDown('down')

    # Which of the following do you prefer while searching for product information before purchasing?   pyautogui.hotkey('Tab')
    pyautogui.hotkey('Tab')
    time.sleep(0.5)
    randno = random.randint(0,2)
    if randno == 0:
        pyautogui.keyDown('down')
    else:
        pyautogui.keyDown('space')


    # Are you likely to share your reviews about your purchase on social media?    time.sleep(0.5)
    pyautogui.hotkey('Tab')
    time.sleep(0.5)
    randno = random.randint(0,10)
    if randno % 2 == 0:
        pyautogui.keyDown('space')
    else:
        pyautogui.keyDown('down')


    # Are you likely to change your attitude towards a certain brand / product after reading positive / negative reviews about it on social media?    randno = random.randint(0,1)
    pyautogui.hotkey('Tab')
    time.sleep(0.5)
    randno = random.randint(0, 10)
    if randno%2 == 0:
        pyautogui.keyDown('space')
    else:
        pyautogui.keyDown('down')
        pyautogui.keyDown('down')

    num_list = [0,1,3]
   # random.shuffle(num_list)
    for num1 in num_list:
        pyautogui.hotkey('Tab')
        time.sleep(0.5)
        if num1 == 0:
            pyautogui.keyDown('space')
        else:
            for no in range(num1):
                pyautogui.keyDown('down')

    pyautogui.hotkey('Tab')
    time.sleep(0.5)
    pyautogui.hotkey('Tab')
    time.sleep(0.5)
    pyautogui.keyDown('space')

    while pyautogui.locateOnScreen('CApture1.png') == None:
        print("not found")

    pyautogui.hotkey('Tab')
    time.sleep(0.5)
    pyautogui.keyDown('enter')
    #time.sleep(5)


    #pyautogui.hotkey('Tab')
    #time.sleep(3)
    #pyautogui.hotkey('Tab')
    #time.sleep(3)
    #pyautogui.hotkey('Tab')
    #time.sleep(3)
    #pyautogui.hotkey('Tab')

    cnt+=1

#
#

#pyautogui.typewrite("Akshata")

#pyautogui.typewrite(["enter"])
