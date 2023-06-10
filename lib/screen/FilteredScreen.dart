import 'package:flutter/material.dart';
import 'package:meals/screen/BottomNavigationTabs.dart';
import 'package:meals/widgets/Drawer.dart';

enum Filter { gluttenFree, lactoseFree, vegetarian, vegan }

class FilteredSCreen extends StatefulWidget {
  FilteredSCreen({super.key, required this.selectedFilters});

  Map<Filter, bool> selectedFilters;

  @override
  State<FilteredSCreen> createState() {
    return _FilteredScreenState();
  }
}

class _FilteredScreenState extends State<FilteredSCreen> {
  var _GluttenFreeFilterSet = false;
  var _LactoseFreeFilterSet = false;
  var _VegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _GluttenFreeFilterSet = widget.selectedFilters[Filter.gluttenFree]!;
    _LactoseFreeFilterSet = widget.selectedFilters[Filter.lactoseFree]!;
    _VegetarianFilterSet = widget.selectedFilters[Filter.vegetarian]!;
    _veganFilterSet = widget.selectedFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop({
          Filter.gluttenFree: _GluttenFreeFilterSet,
          Filter.lactoseFree: _LactoseFreeFilterSet,
          Filter.vegetarian: _VegetarianFilterSet,
          Filter.vegan: _veganFilterSet
        });
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Your Filters!'),
        ),
        // drawer: MainDrawer(
        //   onSelectDrawerOption: (msg) {
        //     Navigator.of(context).pop();
        //     if (msg == 'meals') {
        //       Navigator.of(context).push(MaterialPageRoute(
        //         builder: (ctx) => BottomNavigationTab(),
        //       ));
        //     }
        //   },
        // ),
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
          ),
          SwitchListTile(
            value: _LactoseFreeFilterSet,
            onChanged: (isChecked) {
              setState(() {
                _LactoseFreeFilterSet = isChecked;
              });
            },
            title: Text(
              'Lactose-free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'only include Lactose-free meals',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 32, right: 22),
          ),
          SwitchListTile(
            value: _VegetarianFilterSet,
            onChanged: (isChecked) {
              setState(() {
                _VegetarianFilterSet = isChecked;
              });
            },
            title: Text(
              'Vegetarian',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'only include Vegetarian meals',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 32, right: 22),
          ),
          SwitchListTile(
            value: _veganFilterSet,
            onChanged: (isChecked) {
              setState(() {
                _veganFilterSet = isChecked;
              });
            },
            title: Text(
              'Vegan',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'only include Vegan meals',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 32, right: 22),
          ),
        ]),
      ),
    );
  }
}
