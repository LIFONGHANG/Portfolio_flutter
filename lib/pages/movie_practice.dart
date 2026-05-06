import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Moviepractice extends StatefulWidget {
  const Moviepractice({super.key});

  @override
  State<Moviepractice> createState() => _MoviepracticeState();
}

class _MoviepracticeState extends State<Moviepractice> {
  bool isLoading = true;
  String name = '';
  List movies = [];
  @override
  void initState() {
    super.initState();
    fetchMoviedb();
  }

  //Fetch function
  Future<void> fetchMoviedb() async {
    final url = Uri.parse(
      'https://api.themoviedb.org/3/movie/popular?api_key=f3c9d19ddd1a7af2c8e2ec9de5f24755',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      setState(() {
        movies = data['results'];
        isLoading = false;
        print(response.statusCode);
        print(response.body);
      });
    } else {
      print('Error');
    }
  }

  Widget build(BuildContext context) {
    var appBar = AppBar(
      centerTitle: true,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back),
      ),
      title: Text("Movie Practice"),
    );
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Column(
          children: [
            isLoading
                ? const CircularProgressIndicator()
                : Expanded(
                    child: GridView.builder(
                      itemCount: movies.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // 2 columns in a row
                            crossAxisSpacing: 10, // spacing of each columns
                            mainAxisSpacing: 10, // spacing of each row
                            childAspectRatio: 0.9,
                          ),
                      itemBuilder: (BuildContext context, int index) {
                        final movie = movies[index];
                        final image =
                            'https://image.tmdb.org/t/p/w500${movie['poster_path']}';
                        return Card(
                          
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                            
                              Image.network(image, height: 150),
                              Text(movie['title'],textAlign: TextAlign.center,),
                              Text(movie['release_date']),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
