import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectDrawerOption});

  final void Function(String msg) onSelectDrawerOption;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(.8),
                ],
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.fastfood, size: 30),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Cooking Up!',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.restaurant,
                size: 25, color: Theme.of(context).colorScheme.onBackground),
            title: Text(
              'Meals',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            onTap: () {
              onSelectDrawerOption('meals');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings,
                size: 25, color: Theme.of(context).colorScheme.onBackground),
            title: Text(
              'Filters',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            onTap: () {
              onSelectDrawerOption('filters');
            },
          ),
        ],
      ),
    );
  }
}
