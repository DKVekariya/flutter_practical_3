import 'package:flutter/material.dart';
import 'package:flutter_practical_3/Utils/ColorExtension.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  final String title = 'News';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Color> colors = List.generate(50, (index) => randomColor());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
              floating: true,
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: Text(widget.title)),
        ],
        body: Scaffold(body: ColorFeed(colors: colors)),
      ),
    );
  }
}

class ColorFeed extends StatefulWidget {
  const ColorFeed({super.key, required this.colors});

  final List<Color> colors;

  @override
  State<ColorFeed> createState() => _ColorFeedState();
}

class _ColorFeedState extends State<ColorFeed> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView.builder(
          itemCount: widget.colors.length,
          itemBuilder: (BuildContext context, index) {
            return Card(
              color: widget.colors[index],
              child: const SizedBox(
                height: 100,
                width: double.maxFinite,
              ),
            );
          }),
    );
  }
}
