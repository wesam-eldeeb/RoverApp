import 'package:Rover/featuers/Category/widgets/tab_item.dart';
import 'package:flutter/material.dart';

class TabContainer extends StatefulWidget {
  @override
  State<TabContainer> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,

        /// دا المفروض يتعمل لما يبقي معايا ال Api
        /// sourceList.length
        child: Column(
          children: [
            TabBar(
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                isScrollable: true,
                indicatorColor: Colors.transparent,
                tabs:

                    ///sourceList.map((source) => TabItem(
                    ///source : source,
                    ///isSelected : true)).toList()
                    /// دا المفروض يتعمل لما يبقي معايا ال Api
                    [
                  TabItem(
                      isSelected: true

                      ///selectedIndex == widget.sourceList.indexOf(source)
                      ,
                      source: "All"),
                  TabItem(isSelected: false, source: "New"),
                ]),

            ///Expanded(child: MyTripScreen(source: widget.sourceList[selectedIndex]),
          ],
        ));
  }
}
