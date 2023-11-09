import 'package:flutter/material.dart';
import 'tableau_list_cell_view.dart';

class TableauCard extends StatelessWidget {
  const TableauCard({
    super.key,
    required this.progress,
    required this.themeColor,
    required this.widget,
    required this.titleTextStyle,
  });

  final double progress;
  final Color themeColor;
  final TableauListCellView widget;
  final TextStyle titleTextStyle;

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17.0),
        side: BorderSide(
          color: progress > 0 && progress < 1 ? themeColor : Colors.transparent,
          width: 2.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            SizedBox(
              width: 200,
              child: Center(
                child: Text(
                  widget.tableau.title,
                  style: titleTextStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.tableau.startTime),
                const Spacer(),
                Container(
                  alignment: Alignment.center,
                  width: 200,
                  child: LinearProgressIndicator(
                    value: progress,
                    color: themeColor,
                    backgroundColor: themeColor.withAlpha(50),
                  ),
                ),
                const Spacer(),
                Text(widget.tableau.endTime),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
