import 'package:flutter/material.dart';
import 'project_details.dart'; 
import 'profile_screen.dart';
import 'chat_screen.dart';

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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Create a project", style: TextStyle(fontSize: 18)),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const TextField(
                decoration: InputDecoration(
                  labelText: "Project Name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Color(0xFF7980FF)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    icon: const Icon(Icons.list, color: Color(0xFF7980FF)),
                    label: const Text("List",
                        style: TextStyle(color:  Color(0xFF7980FF))),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  const Color(0xFF7980FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    icon: const Icon(Icons.dashboard, color: Colors.white),
                    label: const Text("Board",
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "Visibility",
                  border: OutlineInputBorder(),
                ),
                items: const [
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
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor:  const Color(0xFF7980FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
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

void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });

  if (index == 2) { // Navigate to ChatScreen when chat icon is tapped
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChatScreen()),
    );
  } else if (index == 3) { // Navigate to ProfileScreen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfileScreen()),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
     appBar: AppBar(
  toolbarHeight: 60,
  backgroundColor:  const Color(0xFF7980FF),
  iconTheme: const IconThemeData(color: Colors.white), 
  title: Padding(
    padding: const EdgeInsets.only(top: 18.0),
    child: Row(
      children: [
        Stack(
          children: [
            const CircleAvatar(
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
        const SizedBox(width: 10),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jennifer Lyine',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 5),
            Text(
              'Hi Jennifer, Good Morning!',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ],
    ),
  ),
  centerTitle: true,
  actions: const [
    Padding(
      padding: EdgeInsets.only(right: 30.0),
      child: Icon(
        Icons.notifications_active_outlined,
        color: Colors.white,
      ),
    ),
  ],
),

      drawer: Drawer(
        child: ListView(
          children: [
            // Drawer Header with Profile section
            Container(
              color:  const Color(0xFF7980FF), 
              padding: const EdgeInsets.only(top: 18, bottom: 18, left: 20),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/applog.png',
                    height: 40,
                    width: 40,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'Task Management App',
                    style: TextStyle(
                        fontSize: 18,
                        color:
                            Colors.white), 
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(top: 25, bottom: 25, left: 20),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(
                        'assets/images/profile_picture.png'), 
                  ),
                  SizedBox(
                      width: 10), 
                  Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .start, 
                    children: [
                      Text(
                        'Good Morning',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black), 
                      ),
                      Text(
                        'Jennifer Lyine',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ), 
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color.fromARGB(255, 180, 179, 179), 
              height: 2, 
              thickness: 1, 
              indent: 12, 
              endIndent: 10, 
            ),
            // MAIN MENU heading
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'MAIN MENU',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            ExpansionTile(
              title: const Text('Home'),
              leading: const Icon(Icons.home), 
              childrenPadding:
                  const EdgeInsets.only(left: 20), 
              children: [
                ListTile(
                  title: const Text("Child Category 2"),
                  leading: const Icon(Icons.abc_outlined),
                  onTap: () {
                    //action on press
                  },
                ),

                ListTile(
                  title: const Text("Child Category 2"),
                  leading: const Icon(Icons.cable_outlined),
                  onTap: () {
                    //action on press
                  },
                ),

                //more child menu
              ],
            ),
            ExpansionTile(
              title: const Text('Pages'),
              leading: const Icon(Icons.pages), 
              childrenPadding:
                  const EdgeInsets.only(left: 20), 
              children: [
                ListTile(
                  title: const Text("Child Category 2"),
                  leading: const Icon(Icons.abc_outlined),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("Child Category 2"),
                  leading: const Icon(Icons.accessibility),
                  onTap: () {
                    
                  },
                ),
              ],
            ),

            ListTile(
              leading: const Icon(Icons.widgets),
              title: const Text('Components'),
              onTap: () {
                
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
               
              },
            ),
            ListTile(
              leading: const Icon(Icons.chat),
              title: const Text('Chat'),
              onTap: () {
                
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        // Wrapping Column in SingleChildScrollView
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color:
                   const Color(0xFF7980FF),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: size.width *.8, 
                  height: 50, 
                  decoration: BoxDecoration(
                    color:  const Color(0xFF7980FF), 
                    borderRadius:
                        BorderRadius.circular(6), 
                    border: Border.all(
                        color: Colors.white,
                        width: 0.5), 
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 8.0), 
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ), 
                        hintText: 'Search...',
                        hintStyle:
                            TextStyle(color: Colors.white), 
                        border: InputBorder.none, 
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recent Projects',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // View all projects action
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'View All',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),

            // Recent Projects Cards Section
            SizedBox(
              height: 330, 
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  projectCard(
                      'assets/images/project1.png',
                      'Gaming Platform Web &\nMobile App',
                      'June 22, 2024',
                      75,
                      10),
                  projectCard('assets/images/project2.png',
                      'Furniture Web & Mobile App', 'March 29, 2024', 60, 5),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0)
                  .copyWith(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Today\'s Tasks',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'View All',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
        Container(
          margin: const EdgeInsets.only(bottom: 80.0), 
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 4,
              child: ListTile(
                leading: const Icon(
                  Icons.business_center,
                  color:  Color(0xFF7980FF),
                  size: 40, // Reduced icon size
                ),
                title: const Text(
                  'Fintech Project',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                
                subtitle: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/person4.png'), 
                      radius: 12,
                    ),
                    const SizedBox(width: 0), 
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/person2.png'), 
                      radius: 12,
                    ),
                    const SizedBox(width: 0), 
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/person3.png'), 
                      radius: 12,
                    ),
                    const SizedBox(width: 0), 
                    Container(
                        color: const Color(0xFFEF946D), 
                        padding: const EdgeInsets.all(4), 
                        child: const Center(
                          child: Text(
                            '3+', 
                            style: TextStyle(
                              fontSize: 10,        
                              color: Colors.white, 
                            ),
                          ),
                        ),
                      ),
                     const SizedBox(width: 8), 
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        const Icon(Icons.chat_bubble, size: 24), 
                        Positioned(
                          right: -6, // Adjust as needed
                          top: -6, // Adjust as needed
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 16,
                              minHeight: 16,
                            ),
                            child: const Text(
                              '4', 
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10, 
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: SizedBox(
                  width: 100, 
                  height: 120, 
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      
                      Transform.scale(
                        scale: 1.5, 
                        child: CircularProgressIndicator(
                          value: 0.85, 
                          backgroundColor: Colors.grey[300],
                          color: Colors.blue,
                          strokeWidth: 4, 
                        ),
                      ),
            
                      const Text(
                        '85%',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18, 
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
        ),
      ),

              floatingActionButton: Padding(
                padding: const EdgeInsets.only(bottom: 20.0, left:25.0), 
                child: FloatingActionButton(
                  onPressed: _openCreateProjectDialog,
                  backgroundColor:  const Color(0xFF7980FF),
                  child: const Icon(Icons.add, color: Colors.black),
                ),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

              
          bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(right: 30.0),
              child: Icon(Icons.task_alt),
            ),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Icon(Icons.chat_bubble),
            ),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF7980FF),
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    
              
            );
          }

          Widget projectCard(String imagePath, String projectName, String date,
              int progress, int comments) {
            return Container(
              width: 300,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black12)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Project Icon with Background
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Colors.lightGreen,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.work, color: Colors.black),
                        ),
                        // Project name bold
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              projectName,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        const Icon(Icons.more_horiz),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.calendar_today, size: 15),
                            const SizedBox(width: 4),
                            Text(date),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.chat_bubble, size: 15),
                            const SizedBox(width: 4),
                            Text('$comments'),
                            const SizedBox(width: 16),
                            const Icon(Icons.link, size: 14),
                            const SizedBox(width: 4),
                            const Text('30'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProjectDetails(
                              projectName:
                                  projectName, 
                            ),
                          ),
                        );
                      },
                      child: Image.asset(imagePath, fit: BoxFit.cover, height: 150),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/person1.png'),
                                  radius: 12,
                                ),
                                SizedBox(width: 0), 
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/person2.png'),
                                  radius: 12,
                                ),
                                SizedBox(width: 0),
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/person3.png'),
                                  radius: 12,
                                ),
                              ],
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Progress label
                                    const Text(
                                      'Progress',
                                      style: TextStyle(
                                          fontSize: 14, fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 4),
                                    // Progress bar
                                    Stack(
                                      children: [
                                        Container(
                                          height: 8, 
                                          decoration: BoxDecoration(
                                            color: Colors.blue[100],
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                        ),
                                        Container(
                                          height: 6, 
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
