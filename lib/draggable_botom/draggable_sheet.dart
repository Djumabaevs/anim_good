import 'package:flutter/material.dart';

class DraggableSheet extends StatefulWidget {
  DraggableSheet({Key? key}) : super(key: key);

  @override
  State<DraggableSheet> createState() => _DraggableSheetState();
}

class _DraggableSheetState extends State<DraggableSheet> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      minChildSize: 0.15,
      initialChildSize: 0.15,
      builder: (context, scrollController) {
        return AnimatedBuilder(
          animation: scrollController,
          builder: (context, child) {
            double percentage = initialPercentage;
            if(scrollController.hasClients) {
              percentage = scrollController.position.viewportDimension / 
              MediaQuery.of(context).size.height;
            }
            return ...
          };
      },);
  }
}

Opacity(
  opacity: percentage == 1 ? 1 : 0,
  child: ListView.builder(itemBuilder: itemBuilder),
)

Opacity(
  opacity: percentage == 1 ? 1: 0,
  child: MyEventItem(
    event: event,
    percentageCompleted: percentage,
  )
)