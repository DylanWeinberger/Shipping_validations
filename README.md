
<h1>FatCat Smuggling</h1>
<h4>Shipping application built with Ruby on Rails</h4>

Creators Dylan Weinberger and Alan Bugsy Rhode.

<h4>Before Using</h4>
To create a Administrator with the ability to destroy everything you must use rails console from your command line. Running " Tycoon.create(username: "Knucky", email: "Knucky@aol.com", password:"12345") " in the rails console will create a new Tycoon. To log in use the Tycoon log in form with the username "Knucky" and the password "12345". We do not allow Tycoons to sign up as a security feature since they have full access to edit and delete anything on the site. In the future we will work on adding security features to allow Select Tycoons to sign up.

FatCat Smuggling was designed for Tycoons and Smugglers to connect. It allows the Tycoons to keep track of their fleet of vehciles, missions, and the smugglers who go on those missions using those vehicles. The experience of anybody either visiting the page or using the page should be fairly seamless and fun. In each section there should be many places to click to bring you to profiles with more information. Each section should have a different background image relating to the section that they are in.

#Design

The design was inspired by noir films and comic books. Pictures of the site in action to come soon.
<img src="app/assests/images/fatcat.png">
#Smugglers

Smugglers can sign up and use the site to browse their connections with other smugglers through vehicles they have used on past missions. Smugglers can be chosen to go on a Mission from the create Mission page. Smugglers can add an avatar to their profile. Smugglers are also able to follow other smugglers and see what missions they were on and what vehciles they used.

#Tycoons
Tycoons are the users who essentially run the website. They are able to create and subsequently own cars. They are able to create missions and assign different smugglers to those missions. They are also able to destroy any missions or delete and smuggler accounts. Pretty much all the things a normal Tycoon can do. Tycoons also are able to upload an avatar. Currently there is no way for a new Tycoon to be created from the views pages. They need to be created from the rails console. Since the Tycoons have a lot of power we want to wait till we have an ability to send smugglers an invitation to sign up.

#Missions
Missions can be created by the Tycoons. This model will join our Smugglers with Vehicles. They will also have plenty of information on the specific mission. They need to have a unique name, cost more than $1000, have a cargo description of more than 50 characters and an origin and destination that are not the same.

#Vehicles
Vehicles can also only be created by Tycoons. They are connected to smugglers by the missions that they were on together. Tycoons can upload a picture of their vehicle.



