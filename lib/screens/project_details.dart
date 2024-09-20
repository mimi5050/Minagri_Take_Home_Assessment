import 'package:flutter/material.dart';

class ProjectDetails extends StatefulWidget {
  final String projectName;

  ProjectDetails({required this.projectName});

  @override
  _ProjectDetailsState createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  bool showFullText = false;
  final List<String> tasks = ['Define a Problem With a Client', 'Create Wirefame and Userflow', 'Project Setup & Brief'];
  final Map<String, bool> taskVoting = {
    'Define a Problem With a Client': false,
    'Create Wirefame and Userflow': false,
    'Project Setup & Brief': false,
  };

// Helper widget for displaying team member avatars with reduced size
Widget teamMemberAvatar(String imagePath) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0), 
    child: CircleAvatar(
      radius: 10, 
      backgroundImage: AssetImage(imagePath),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    String description =
        'This project is a Gaming Platform Web & Mobile App designed to provide a comprehensive gaming experience across devices. The app includes features for multiplayer gaming, real-time updates, and an immersive user experience.';

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.projectName, style: const TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.black),
            onPressed: () {
              Navigator.pop(context); 
            },
          ),
          IconButton(
            icon: const Icon(Icons.upload, color: Colors.black),
            onPressed: () {
              
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
             
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Image.asset(
              'assets/images/project1.png', 
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
            const SizedBox(height: 16),

            const Text(
              'Description',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            
            Text(
              showFullText
                  ? description
                  : '${description.substring(0, 100)}...',
              style: const TextStyle(fontSize: 16),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  showFullText = !showFullText;
                });
              },
              child: Text(
                showFullText ? 'See less details' : 'See more details',
                style: const TextStyle(
                  color:  Color(0xFF7980FF),
                  fontSize: 16,
                ),
              ),
            ),
            
            const SizedBox(height: 16),

           
            Table(
              columnWidths: const {
                0: FlexColumnWidth(), 
                1: FlexColumnWidth(),
              },
              children: [
                
// Helper widget for displaying team member avatars with reduced size


// Team Row
TableRow(
  children: [
    _buildTitleWithIcon('Team', Icons.group),
    Row(
      children: [
        teamMemberAvatar('assets/images/person1.png'),
        teamMemberAvatar('assets/images/person2.png'),
        teamMemberAvatar('assets/images/person3.png'),
        teamMemberAvatar('assets/images/person4.png'),
        teamMemberAvatar('assets/images/person5.png'),
        teamMemberAvatar('assets/images/person3.png'),
         teamMemberAvatar('assets/images/person2.png'),
        Container(
          color: const Color(0xFFEF946D),
          padding: const EdgeInsets.all(4),
          child: const Center(
            child: Text(
              '8+',
              style: TextStyle(
                fontSize: 10,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    ),
  ],
),

                const TableRow(
                  children: [SizedBox(height: 16), SizedBox(height: 16)],
                ),
                
               // Team Leader Row
                TableRow(
                  children: [
                    _buildTitleWithIcon('Leader', Icons.person),
                    const Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/images/person1.png'),
                        ),
                        SizedBox(width: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Jeanine Uwase', style: TextStyle(fontSize: 12)),
                            SizedBox(width: 4), // Adjust spacing between name and "(You)"
                            Text('(You)', style: TextStyle(color: Colors.grey, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                const TableRow(
                  children: [SizedBox(height: 16), SizedBox(height: 16)],
                ),
                
                // Status Row
                TableRow(
                children: [
                  _buildTitleWithIcon('Status', Icons.assignment_turned_in),
                  Align(
                    alignment: Alignment.centerLeft, 
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), 
                      decoration: BoxDecoration(
                        color: const Color(0xFFE91E63),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'To Do',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),

                const TableRow(
                  children: [SizedBox(height: 16), SizedBox(height: 16)],
                ),
                
                // Due Date Row
                TableRow(
                  children: [
                    _buildTitleWithIcon('Due Date', Icons.date_range),
                    const Text('September 30, 2024', style: TextStyle(fontSize: 14)),
                  ],
                ),
                const TableRow(
                  children: [SizedBox(height: 16), SizedBox(height: 16)],
                ),
                
                // Attachments Row
                TableRow(
                  children: [
                    _buildTitleWithIcon('Attachments', Icons.attach_file),
                    Row(
                      children: [
                        const Icon(Icons.picture_as_pdf, color: Colors.red),
                        const SizedBox(width: 8),
                        const Text('Reference.pdf', style: TextStyle(fontSize: 12)),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:  const Color(0xFF7980FF), 
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), 
                            textStyle: const TextStyle(fontSize: 12), 
                          ),
                          child: const Text(
                            '+ Add',
                            style: TextStyle(color: Colors.white), // Text color
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            
            const SizedBox(height: 16),

            // Custom Section Button
            // Custom Section Button
          SizedBox(
            width: double.infinity, // Make the button full width
            child: ElevatedButton(
              onPressed: () {
                // Custom section logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7980FF), // Background color
                padding: const EdgeInsets.symmetric(vertical: 20), // Increased vertical padding for height
                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Increased font size and bold text
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Reduced border radius for less rounded corners
                ),
              ),
              child: const Text(
                'Add Custom Section',
                style: TextStyle(color: Colors.white), // Text color
              ),
            ),
          ),



            const SizedBox(height: 16),

            // Sub Task Section
            const Text(
              'Sub Task (3)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // List of Sub Tasks with Voting Icons
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: tasks.map((task) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: taskVoting[task] == true ? Colors.green[50] : Colors.white,
                    border: Border.all(
                      color: taskVoting[task] == true ? Colors.green : Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(task),
                      IconButton(
                        icon: Icon(
                          taskVoting[task] == true ? Icons.check_circle : Icons.check_circle_outline,
                          color: taskVoting[task] == true ? Colors.green : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            taskVoting.update(task, (voted) => !voted);
                          });
                        },
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 16),

            // Add New Sub Task Button
            SizedBox(
              width: double.infinity, // Make the button full width
              child: ElevatedButton(
                onPressed: () {
                  // Add new sub task logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7980FF), // Background color
                  padding: const EdgeInsets.symmetric(vertical: 20), // Increased vertical padding for height
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Increased font size and bold text
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Reduced border radius for less rounded corners
                  ),
                ),
                child: const Text(
                  '+ Add New Sub Task',
                  style: TextStyle(color: Colors.white), // Text color
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  // Helper widget for displaying title with icon
  Widget _buildTitleWithIcon(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  
}
