import 'dart:ui';

import 'package:flutter/material.dart';

class MovieDetailPage extends StatelessWidget {
  final Map movie;

  const MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final backdrop = 'https://image.tmdb.org/t/p/w500${movie['backdrop_path']}';

    final poster = 'https://image.tmdb.org/t/p/w500${movie['poster_path']}';

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 10,
            backgroundColor: Colors.white54,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),color: Colors.black45,
            ),
          ),
        ),
      ),

      body: Stack(
        children: [
          // Background Image
          Positioned.fill(child: Image.network(backdrop, fit: BoxFit.cover)),

          //  Dark Overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.2),
                    Colors.black.withOpacity(0.9),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          //  Movie Content
          SingleChildScrollView(
            child: Column(
              children: [
                // Space for top image
                const SizedBox(height: 260),

                // 🌫 Glass Card
                glasscard(poster),

                const SizedBox(height: 200),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding glasscard(String poster) {
    return Padding(
      padding: const EdgeInsets.all(20),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),

        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),

          child: Container(
            width: double.infinity,

            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),

              borderRadius: BorderRadius.circular(25),

              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),

            child: Padding(
              padding: const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  //  Poster + Info
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      // Poster
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),

                        child: Image.network(
                          poster,
                          height: 180,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                      ),

                      const SizedBox(width: 16),

                      // Movie Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              movie['title'],

                              style: const TextStyle(
                                color: Colors.white,

                                fontSize: 24,

                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 12),

                            Text(
                              "⭐ ${movie['vote_average']}",

                              style: const TextStyle(
                                color: Colors.white70,

                                fontSize: 16,
                              ),
                            ),

                            const SizedBox(height: 8),

                            Text(
                              "📅 ${movie['release_date']}",

                              style: const TextStyle(
                                color: Colors.white70,

                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  //  Overview Title
                  const Text(
                    "Overview",

                    style: TextStyle(
                      color: Colors.white,

                      fontSize: 20,

                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  //  Overview Text
                  Text(
                    movie['overview'],

                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
