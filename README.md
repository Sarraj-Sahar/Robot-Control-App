# 🤖 Robot Control Mobile App

</br>This project entitled <b>“Development of a Mobile Application to Control the P-Guard Robot”</b> was part of my internship with Enova Robotics.
The app offers a fully remote solution for security guards to control the robot, send command requests and receive responses and alerts in real time.


## Screens 

The frames drawn on some of the screens are not actually part of the UI. They are  used to give a better understanding of each screen's components. Click **more details** for more info. 

  ### Login Screen
  
</br>
<img src="https://user-images.githubusercontent.com/82158584/232155579-ac5dc1b5-9f2d-4065-aa85-a79cb7b17c77.png" height="500">

---

### Home Screen
</br> 
 <img width="562" alt="home" src="https://user-images.githubusercontent.com/82158584/232203565-9d698889-ddb7-4417-b40d-b43e52080a5c.png">

The Home screen consists of four main parts, they are explained in more detail below : 
<details>
<summary>more details </summary>

</br>
 <img width="562" alt="image" src="https://user-images.githubusercontent.com/82158584/232213791-a91a67d0-ae72-4f75-8332-7b90e0021a13.png">
</br> </br> 

 • The Robot's status panel (A). </br> 
 • The Map and robot's current position (B).</br> 
 • The Cameras’ video streams (C). </br> 
 • the robot’s lights and alerts command menu (D) . </br> 
 </details>
 
  ####  Drawer menu  </br>
  <img width="562" alt="image" src="https://user-images.githubusercontent.com/82158584/232206346-431c770b-5651-4d73-931d-27c965ae2f30.png">
  
 ----
 
### Missions Screen
A **mission** is a set of GPS points that define a path which the robot will navigate autonomously. To create a mission the user will need to enter the new mission’s name **(A)** and then select the Joystick mode or the Map mode and tap the “Start” button **(B)** to start recording.
</br> 
</br> 
 <img width="562" alt="image" src="https://user-images.githubusercontent.com/82158584/232218497-0ef4e1af-17a0-4d23-b9c2-44df970c20c1.png">
</br>

----
####  Mission Creation with Joystick Mode
</br> 
 <img width="562" alt="image" src="https://user-images.githubusercontent.com/82158584/232223469-be5533ff-d30e-4bc4-88d3-da7678002fd2.png">
</br>

 <details>
<summary>more details </summary>
</br>
The user will direct the robot with the app’s joystick <b>(A)</b> and for each desired point he wants to add, <b>(B)</b> he needs to enter the coordinates of the point (Y), set its speed (X): each tap = +1, confirm (A) the point and finally save the scenario (B).
</details>

----

#### Mission Creation with Map Mode
</br> 
 <img width="562" alt="image" src="https://user-images.githubusercontent.com/82158584/232223507-061cf880-1837-4f65-aae0-4bbe56372b02.png">
</br>

 <details>
<summary>more details </summary>
</br>
The user long presses on the map where they want to add a point <b>(A)</b>, then they specify the speed <b>(B)</b>. Finally, they can save or cancel the new mission <b>(C)</b>.
</details>

---
### Scenarios Screen</br> 

A **scenario** consists of one or more missions.</br>
</br> 
 <img width="562" alt="image" src="https://user-images.githubusercontent.com/82158584/232215349-f9225909-8ef7-4114-9d7a-6c3f47e86109.png">
</br>
<details>
<summary>more details </summary>
</br> </br> 
The scenarios' screen allows users to see all available patrol scenarios **(A)**. When a scenario is selected , its path is drawn on the map **(B)** and then the user can choose to launch it and track the robot's movement on the map in real time. The Add Scenario button **(C)** takes the user to the Create Scenario screen.
</details>

---
#### Create Scenario Screen
</br> 
 <img width="562" alt="image" src="https://user-images.githubusercontent.com/82158584/232224054-a0d32338-479f-48c8-8c62-d93ca6cb6fb5.png">
</br>
<details> 
<summary>more details</summary></br>
This only shows the **first part** of the screen where the user can create a new scenario. They will first need to enter the scenario’s name **(A)**, they also can check the random option (the scenario’s missions will be played in random order). And they can set the scenario’s iteration to either 1 (loop) or 0 **(B)**.
</br>
</details> 

---
#### Add Scenario's missions Screen
</br> 
 <img width="562" alt="image" src="https://user-images.githubusercontent.com/82158584/232223343-13922a79-5384-4acb-8d2d-6c4e4a0eb853.png">
</br>
<details> 
<summary>more details</summary></br>
This shows the **second part** of the Create a new scenario screen. The user can add one or more missions **(A)**, and for each mission, they need to specify a pause time: the robot will pause for x seconds between missions **(B)**.
</details> 

---
### Camera Screen</br> 

Live streams and control of the robot's cameras.
</br> 
 <img width="562" alt="image" src="https://user-images.githubusercontent.com/82158584/232223538-046b25f0-f8a5-4ab7-a231-d051977b9c93.png">
</br>

<details> 
<summary>more details</summary></br>
The Camera Screen contains the video streams coming from the robot’s two 360° cameras **(A)**. Meaning the user can rotate these cameras using the slider **(B)** with the option to change the rotation direction: either front or back **(C)**. They can also zoom in or out **(D)**.

---
#### Full screen mode
</br> 
 <img width="562" alt="image" src="https://user-images.githubusercontent.com/82158584/232223699-62700136-bd95-42eb-bc9b-5b941a86a753.png">
</br>
The user can double tap on each video to go into full-screen mode. They can zoom in or out by pinching the screen **(A)**, and they can exit the full screen **(B)**.
</details>

---
### Settings Screen
</br> 
 <img width="562" alt="image" src="https://user-images.githubusercontent.com/82158584/232223817-95519de1-65e7-4bac-827e-76a7ff05db60.png">
</br>
<details>
<summary>more details </summary></br> 
The following figure shows the Settings Screen in which the user can check his account information **(A)** and change his app settings. Mainly the user can turn on/off their notifications **(B)** to receive all different types of alert messages (mission creation, the emergency button changed, scenario launched…), and log out of the app **(C)**.
</details>
