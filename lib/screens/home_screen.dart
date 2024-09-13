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
      body: Column(
        children: [
          // Search Section
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple[400],
                borderRadius: BorderRadius.circular(10),
            
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.deepPurple[400]),
                      hintText: 'nft website de',
                      hintStyle: TextStyle(color: Colors.deepPurple[400]),
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

          // Recent Projects Section with Project Cards
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                projectCard('assets/images/project1.png', 'Gaming Platform Web & Mobile App', 'June 22, 2024', 75, 10),
                projectCard('assets/images/project2.png', 'Furniture Web & Mobile App', 'March 29, 2024', 60, 5),
              ],
            ),
          ),
        ],
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

  // Project Card Widget
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
                Text(projectName, style: TextStyle(fontSize: 16)),
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
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        height: 4,
                        color: Colors.blue[100],
                      ),
                      Container(
                        height: 4,
                        width: progress * 2.5,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                Text('$progress%'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: List.generate(3, (index) {
                return Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile_picture.png'),
                    radius: 12,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
