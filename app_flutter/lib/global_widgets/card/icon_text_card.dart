import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class IconTextCard extends StatefulWidget {
  const IconTextCard({
    this.icons,
    this.topText = "",
    this.middleText = "",
    this.bottomText = "",
  });

  final List<String>? icons;
  final String topText;
  final String middleText;
  final String bottomText;

  @override
  State<IconTextCard> createState() => _IconTextCardState();
}

class _IconTextCardState extends State<IconTextCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          child: StaggeredGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: [
              StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1.2,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: this
                        .widget
                        .icons!
                        .map((imgUrl) => !imgUrl.endsWith('svg')
                            ? Image.network(imgUrl, width: 25, height: 25)
                            : SvgPicture.network(imgUrl, width: 25, height: 25))
                        .toList(),
                  )),
              StaggeredGridTile.count(
                  crossAxisCellCount: 3,
                  mainAxisCellCount: 1.2,
                  child: Text(this.widget.topText,
                      style: TextStyle(fontSize: 14.sp))),
              StaggeredGridTile.count(
                  crossAxisCellCount: 4,
                  mainAxisCellCount: 2.3,
                  child: Text(this.widget.middleText,
                      style: TextStyle(fontSize: 14.sp))),
              StaggeredGridTile.count(
                  crossAxisCellCount: 4,
                  mainAxisCellCount: 0.5,
                  child: Text(this.widget.bottomText,
                      style: TextStyle(fontSize: 12.sp))),
            ],
          ),
        ));
  }
}
