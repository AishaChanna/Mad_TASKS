import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ImageZoomScreen(),
    );
  }
}

class ImageZoomScreen extends StatefulWidget {
  @override
  _ImageZoomScreenState createState() => _ImageZoomScreenState();
}

class _ImageZoomScreenState extends State<ImageZoomScreen> {
  TransformationController _controller = TransformationController();
  int _currentImageIndex = 0;
  List<String> _imageList = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHmiBGCa2ONcTn1lXuF8UgZ6zWKbc4pFReqXPGy5A0Ig&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8WJgMcfFKhRhKuTvfwSPYqqIpUbR0BZbv0d4Jk0Ni8A&s',
  ];

  void _changeImage() {
    setState(() {
      _currentImageIndex = (_currentImageIndex + 1) % _imageList.length;
      _controller.value = Matrix4
          .identity(); // Reset the transformation when changing the image
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Zoom and Change'),
      ),
      body: GestureDetector(
        onTap: _changeImage,
        child: Center(
          child: InteractiveViewer(
            transformationController: _controller,
            minScale: 1.0,
            maxScale: 3.0,
            child: Image.network(
              _imageList[_currentImageIndex],
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
