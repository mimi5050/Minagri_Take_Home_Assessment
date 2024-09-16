import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _openCreateProjectDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Create a project", style: TextStyle(fontSize: 18)),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "Project Name",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.purple),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    icon: Icon(Icons.list, color: Colors.purple),
                    label: Text("List", style: TextStyle(color: Colors.purple)),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    icon: Icon(Icons.dashboard, color: Colors.white),
                    label: Text("Board", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "Visibility",
                  border: OutlineInputBorder(),
                ),
                items: [
                  DropdownMenuItem(
                    value: "public",
                    child: Row(
                      children: [
                        Icon(Icons.public, color: Colors.green),
                        SizedBox(width: 10),
                        Text("Public"),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: "private",
                    child: Row(
                      children: [
                        Icon(Icons.lock, color: Colors.red),
                        SizedBox(width: 10),
                        Text("Private"),
                      ],
                    ),
                  ),
                ],
                onChanged: (value) {},
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  "Create Project",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Screen Content'),
    Text('Tasks Page'),
    Text('Profile Page'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.deepPurple[400],
      title: Row(
        children: [
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
                    color: Colors.green,
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
              Text('Jennifer', style: TextStyle(color: Colors.white, fontSize: 16)),
              Text('Hi Jennifer, Good Morning!', style: TextStyle(color: Colors.white, fontSize: 12)),
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
                      color: Colors.red,
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openDrawer();
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
    body: SingleChildScrollView(  // Wrapping Column in SingleChildScrollView
      child: Column(
        children: [
          Container(
            color: Colors.deepPurple[400], // Same background color as the AppBar
            child: Column(
              children: [
             Padding(
  padding: EdgeInsets.all(16.0),
  child: Container(
    width: 550, // Set a specific width for the search area
    height: 50, // Set a specific height for the search area
    decoration: BoxDecoration(
      color: Colors.deepPurple[400], // Match the AppBar color
      borderRadius: BorderRadius.circular(6), // Reduced border radius
      border: Border.all(color: Colors.white, width: 1), // Reduced border width
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0), // Adjust horizontal padding
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.white), // Search icon color
          hintText: 'Search...', // Hint text
          hintStyle: TextStyle(color: Colors.white), // Hint text color
          border: InputBorder.none, // Remove the default border
        ),
      ),
    ),
  ),
),




              ],
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Projects',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                ElevatedButton(
                  onPressed: () {
                    // View all projects action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'View All',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          
          // Recent Projects Cards Section
          SizedBox(
            height: 330,  // Set a specific height for ListView
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                projectCard('assets/images/project1.png', 'Gaming Platform Web &\nMobile App', 'June 22, 2024', 75, 10),
                projectCard('assets/images/project2.png', 'Furniture Web & Mobile App', 'March 29, 2024', 60, 5),
              ],
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(top: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today\'s Tasks',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                ElevatedButton(
                  onPressed: () {
                    // View all tasks action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'View All',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.business_center, color: Colors.purple),
                title: Text(
                  'Fintech Project',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Complete by today'),
                trailing: Icon(Icons.check_circle, color: Colors.green),
              ),
            ),
          ),
        ],
      ),
    ),
    
    floatingActionButton: FloatingActionButton(
      onPressed: _openCreateProjectDialog,
      backgroundColor: const Color.fromARGB(255, 165, 135, 170),
      child: Icon(Icons.add, color: Colors.black),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    bottomNavigationBar: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.task),
          label: 'Tasks',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.purple[400],
      onTap: _onItemTapped,
    ),
  );
}


// Updated Project Card Widget with Reduced Space Between Profile Pictures
Widget projectCard(String imagePath, String projectName, String date, int progress, int comments) {
  return Container(
    width: 300,
    margin: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black12)],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Project Icon with Background
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.work, color: Colors.black),
              ),
              // Project name bold
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    projectName,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Icon(Icons.more_vert),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 14),
                  SizedBox(width: 4),
                  Text(date),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.comment, size: 14),
                  SizedBox(width: 4),
                  Text('$comments'),
                  SizedBox(width: 16),
                  Icon(Icons.share, size: 14),
                  SizedBox(width: 4),
                  Text('Share'),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Image.asset(imagePath, fit: BoxFit.cover, height: 150),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile pictures and progress label + bar in a row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Profile pictures with reduced spacing
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/person1.png'),
                        radius: 12,
                      ),
                      SizedBox(width:0), // Reduced spacing by 20px
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/person2.png'),
                        radius: 12,
                      ),
                      SizedBox(width: 0),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/person3.png'),
                        radius: 12,
                      ),
                    ],
                  ),
                  // Progress label and bar
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Progress label
                          Text(
                            'Progress',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          // Progress bar
                          Stack(
                            children: [
                              Container(
                                height: 8, // Thickness of the progress bar
                                decoration: BoxDecoration(
                                  color: Colors.blue[100],
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              Container(
                                height: 6, // Thickness of the progress bar
                                width: progress * 2.5,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Progress percentage
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text('$progress%'),
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
