import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/camera_icon.dart';
import 'dart:developer';


class AvatarSelectionScreen extends StatefulWidget {
  const AvatarSelectionScreen({super.key});

  @override
  State<AvatarSelectionScreen> createState() => _AvatarSelectionScreenState();
}

class _AvatarSelectionScreenState extends State<AvatarSelectionScreen> {
  String playerName = ''; // Όνομα χρήστη
  int? selectedAvatarIndex; // Για την επιλογή avatar
  final ImagePicker _picker = ImagePicker(); // Για να ανοίγεις την κάμερα

  // Συνάρτηση για άνοιγμα κάμερας
  Future<void> _openCamera() async {
  final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
  if (photo != null) {
    log('Φωτογραφία τραβήχτηκε: ${photo.path}');
  }
}

  // Λίστα με τις εικόνες των avatars
  final List<String> avatarImages = [
    'assets/images/avatars/avatar1.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3phasiko'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          // TextField για το όνομα
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'ENTER YOUR NAME',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.keyboard),
              ),
              onChanged: (value) => setState(() {
                playerName = value;
              }),
            ),
          ),
          const SizedBox(height: 20),

          // CameraIcon για άνοιγμα κάμερας
          CameraIcon(
            onIconPressed: _openCamera,
          ),
          const SizedBox(height: 20),

          // Κείμενο για τα avatars
          const Text('Or choose your avatar:', style: TextStyle(fontSize: 16)),
          const SizedBox(height: 10),

          // GridView με avatars
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // 4 avatars ανά σειρά
                childAspectRatio: 1,
              ),
              itemCount: avatarImages.length,
              itemBuilder: (context, index) {
                final isSelected = selectedAvatarIndex == index;

                return GestureDetector(
                  onTap: () => setState(() {
                    selectedAvatarIndex = index;
                  }),
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected ? Colors.blue : Colors.transparent,
                        width: 3,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        avatarImages[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Κουμπί NEXT
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: ElevatedButton(
              onPressed: () {
                if (playerName.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter your name'),
                    ),
                  );
                } else {
                  log('Όνομα: $playerName, Avatar Index: $selectedAvatarIndex');
                }
              },
              child: const Text('NEXT'),
            ),
          ),
        ],
      ),
    );
  }
}
