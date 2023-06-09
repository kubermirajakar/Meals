import 'package:flutter/material.dart';
import 'package:meals/screen/BottomNavigationTabs.dart';
import 'package:meals/widgets/Drawer.dart';

class FilteredSCreen extends StatefulWidget {
  @override
  State<FilteredSCreen> createState() {
    return _FilteredScreenState();
  }
}

class _FilteredScreenState extends State<FilteredSCreen> {
  var _GluttenFreeFilterSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters!'),
      ),
      drawer: MainDrawer(
        onSelectDrawerOption: (msg) {
          Navigator.of(context).pop();
          if (msg == 'meals') {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => BottomNavigationTab(),
            ));
          }
        },
      ),
      body: Column(children: [
        SwitchListTile(
          value: _GluttenFreeFilterSet,
          onChanged: (isChecked) {
            setState(() {
              _GluttenFreeFilterSet = isChecked;
            });
          },
          title: Text(
            'Glutten-free',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          subtitle: Text(
            'only include Glutten-free meals',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: EdgeInsets.only(left: 32, right: 22),
        )
      ]),
    );
  }
}
