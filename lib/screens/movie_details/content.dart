import 'package:flutter/material.dart';
import 'package:movie_buddy/components/SectionSubTitle/section_sub_title.dart';
import 'package:movie_buddy/components/SectionTitle/section_title.dart';
import 'package:movie_buddy/models/movie_details.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Content extends StatefulWidget {
  const Content({Key? key, required this.movieDetails}) : super(key: key);

  final MovieDetails movieDetails;

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.movieDetails.ytTrailerCode!,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          '${widget.movieDetails.largeCoverImage}',
          fit: BoxFit.cover,
        ),
        ShaderMask(
          shaderCallback: (rect) {
            return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.white.withOpacity(0.5),
                Colors.white.withOpacity(0),
              ],
              stops: const [0, 0.3, 0.6],
            ).createShader(rect);
          },
          blendMode: BlendMode.dstOut,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff3c416b),
                  Color(0xff10132f),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(title: '${widget.movieDetails.title}'),
              SectionSubTitle(
                title: widget.movieDetails.genres!.join(', '),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
                child: Text(
                  widget.movieDetails.descriptionFull!,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              const SectionTitle(title: 'Trailer'),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressColors: const ProgressBarColors(
                    playedColor: Colors.amber,
                    handleColor: Colors.amberAccent,
                  ),
                  onReady: () {
                    print('Player is ready.');
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
