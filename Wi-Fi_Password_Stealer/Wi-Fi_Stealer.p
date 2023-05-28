import os

# creating password file
pass_file = open('password.txt', 'w')
pass_file.write('The passwords hacked are : \n\n')
pass_file.close()

# lists for password data
wifi_files = []
wifi_names = []
wifi_pwds = []

os.system('netsh wlan export profile key=clear')

for file in os.listdir():
    if file.startswith('Wi-Fi') and file.endswith('.xml'):
        wifi_files.append(file)
        for each in wifi_files:
            with open(each, 'r') as f:
                for line in f.readlines():
                    if '<name>' in line:
                        front_remove = line.split('<name>')
                        back_remove = front_remove[1].split('</name>')
                        wifi_names.append(back_remove[0])

                    if '<keyMaterial>' in line:
                        front_remove = line.split('<keyMaterial>')
                        back_remove = front_remove[1].split('</keyMaterial>')
                        wifi_pwds.append(back_remove[0])

                        for i in range(len(wifi_pwds)):
                            with open('password.txt', 'a') as d:
                                d.write(f'Name : {wifi_names[i]}\nPassword : {wifi_pwds[i]}\n\n')

            os.remove(each)
            print('The passwords are stored in password.txt')

