# ARPL-Long-Range-Antenna_setup
How to setup a stable communication between your laptop and an external device through the Arpl long range antenna.
In this reporsitory is described how to connect your laptop, through wired connection, and an external device (drone or robot) to the ARPL-Long-Range Antenna. 

This repository is valid with the Antenna Ubiquiti AM ..... and the device Ubiquiti Rocket M2. 
**Tools Required:**
 - Antenna ... (Fig. 1) 
 - Rocket M2 (Fig. 2).
 - Switch (Fig. 3).
 
**How To Setup the Antenna:**
- Take the Switch and attach one side to the wall power outlet. 
- Connect the swith to the Antenna with an ethernet cable through the POE port.
- Connect the LAN port to your laptop also using another Ethernet cable. 
- On your computer open a new page in your browser. 
- Access to the Network Management setup page (called airOS) typing 'https://192.168.69.1
- In the next page click Advance and Accept Risk. 
- The login page will appear as in Fig. 4. Type login 'ubnt' and password 'arpllab11'. 
- Click on the Ubiquiti logo tab at the top left corner of the setup window page (Fig. 5). 
- In the Ubiquiti logo tab check that **<br /> AIRMax <br />** is disabled. 
- In the Network Tab, check that the setting Network Mode is defined on Bridge. 
- The Network Tab page should be appear as in Fig. 5. 

**On Your Laptop:**
 - Initialize a new workspace with the following commands 
  ```txt
  mkdir -p ws
 ```
 - In ws download this repository typing in a shell the following command. 
 ```txt
 git clone ....
 ```
 - Type ifconfig to verify the ip address assigned to your ethernet connection. If different from the range 192.168.1.XXX, type:
  ```txt
sudo ifconfig {name_of_the_connection} 192.168.1.XXX
 ```
Change XXX with a value between 3 and 254. 

- Go inside dhcp folder, make the script run_dhcp_docker.bash executable, run the script:
 ```txt
  cd dhcp
  
  chmod +x run_dhcp_docker.bash

  ./run_dhcp_docker.bash
  ```
 
 When the script is running, your computer is acting as a virtual router, making possible to use the Rocket M2 in Bridge Mode. 
 
**On the external device:**
- Go to Wifi Settings and connect the pc to ARPL-Long-Range Wifi signal. 
- Check the Ip assigned to the device with ifconfig. 
- Try to ping the laptop to see if the communication is enabled. 

As a final step configure the laptop ROS_MASTER_URI with the ip address of the external device. This permits to run the roscore on the external device and to have all the topic lists in your pc. 
- Navigate to hosts folder:
```txt
cd /etc
vim hosts
```
- Modify the file inserting a new row with the ip address of your device and the name of the device {name_device}.
- Go to .bashrc file. 
- Add 
```txt
ROS_MASTER_URI:=https://{name_device}:11201
```
 
