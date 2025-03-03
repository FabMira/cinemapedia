
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/domain/entities/entities.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

final FutureProviderFamily<List<Video>, int> videosFromMovieProvider =
    FutureProvider.family(
  (ref, int movieId) {
    final movieReporitory = ref.watch(movieRepositoryProvider);
    return movieReporitory.getYoutubeVideosById(movieId);
  },
);

class VideosFromMovie extends ConsumerWidget {
  final int movieId;
  const VideosFromMovie({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moviesFromVideos = ref.watch(videosFromMovieProvider(movieId));

    return moviesFromVideos.when(
      data: (videos) => _VideosList(videos: videos),
      loading: () =>
          const Center(child: CircularProgressIndicator(strokeWidth: 2)),
      error: (_, __) =>  Center(
          child: Text('No se pudieron cargar los videos de esta película por')),
    );
  }
}

class _VideosList extends StatelessWidget {
  final List<Video> videos;

  const _VideosList({required this.videos});

  @override
  Widget build(BuildContext context) {
    if (videos.isEmpty) {
      return const SizedBox();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: const Text('Videos',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        _YoutubeVideoPlayer(youtubeId: videos.first.youtubeKey, name: videos.first.name,)
      ],
    );
  }
}

class _YoutubeVideoPlayer extends StatefulWidget {
  final String youtubeId;
  final String name;

  const _YoutubeVideoPlayer({required this.youtubeId, required this.name});

  @override
  _YoutubeVideoPlayerState createState() => _YoutubeVideoPlayerState();
}

class _YoutubeVideoPlayerState extends State<_YoutubeVideoPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
        initialVideoId: widget.youtubeId,
        flags: const YoutubePlayerFlags(
            hideThumbnail: true,
            showLiveFullscreenButton: false,
            mute: false,
            autoPlay: false,
            disableDragSeek: true,
            loop: false,
            isLive: false,
            forceHD: false,
            enableCaption: false));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text(widget.name), YoutubePlayer(controller: _controller)],
      ),
    );
  }
}
