import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[400], // Dimmer purple (slightly blue)
        title: Row(
          children: [
            // Profile picture with green dot
            Stack(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profile_picture.png'),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green, // Green dot indicating active user
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jennifer',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  'Hi Jennifer, Good Morning!',
                  style: TextStyle(color: Colors.white, fontSize: 12), // Reduced font size
                ),
              ],
            ),
            Spacer(),
            IconButton(
              icon: Stack(
                children: [
                  Icon(Icons.notifications, color: Colors.white),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red, // Red dot indicating new notification
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                    ),
                  ),
                ],
              ),
              onPressed: () {
                // Notification logic
              },
            ),
            IconButton(
              icon: Icon(Icons.menu, color: Colors.white), // Moved drawer icon here
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Drawer opens
              },
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('Task Management App')),
            ListTile(title: Text('Home')),
            ListTile(title: Text('Pages')),
            ListTile(title: Text('Components')),
            ListTile(title: Text('Profile')),
            ListTile(title: Text('Chat')),
            ListTile(title: Text('Logout')),

          ],
        ),
      ),
      body: Column(
        children: [
          // Search Section
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple[400], // Same color as AppBar
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // White search bar
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.deepPurple[400]), // Purple search icon
                      hintText: 'nft website de',
                      hintStyle: TextStyle(color: Colors.deepPurple[400]), // Purple hint text
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Recent Projects Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Projects |',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                ElevatedButton(
                  onPressed: () {
                    // View all projects action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Black background
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'View All',
                    style: TextStyle(color: Colors.white), // White text
                  ),
                ),
              ],
            ),
          ),

          // Recent Projects Section (Reduced size)
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                projectCard(),
                projectCard(),
                projectCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget projectCard() {
    return Container(
      width: 250, // Reduced card size
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(blurRadius: 4, color: Colors.grey, spreadRadius: 1)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project Header
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.greenAccent,
                  child: Icon(Icons.business, color: Colors.black), // Project icon
                ),
                SizedBox(width: 10),
                Text('Project Name', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)), // Reduced font size
                Spacer(),
                Icon(Icons.more_vert),
              ],
            ),
          ),

          // Date, Comments, Shares
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Text('Date: 2024-09-13', style: TextStyle(fontSize: 12)), // Reduced font size
                Spacer(),
                Icon(Icons.comment, size: 18),
                Text(' 10', style: TextStyle(fontSize: 12)), // Reduced font size
                SizedBox(width: 10),
                Icon(Icons.share, size: 18),
                Text(' 5', style: TextStyle(fontSize: 12)), // Reduced font size
              ],
            ),
          ),

          // Project Image
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 120, // Reduced image height
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('assets/images/project_image.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Project Progress
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 5,
                        color: Colors.blue, // Blue progress bar
                      ),
                    ),
                    SizedBox(width: 10),
                    Text('75%'), // Progress percentage
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage('assets/images/person1.png'),
                    ),
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage('assets/images/person2.png'),
                    ),
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage('assets/images/person3.png'),
                    ),
                     CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage('assets/images/person4.png'),
                    ),
                     CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage('assets/images/person5.png'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
