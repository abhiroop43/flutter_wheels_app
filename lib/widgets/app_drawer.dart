import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final void Function(String identifier) setScreen;
  const AppDrawer({
    super.key,
    required this.setScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer),
              child: Container(
                margin: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(
                      Icons.directions_car,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      size: 32,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text('Vrooom!!',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer)),
                  ],
                ),
              )),
          ListTile(
            leading: const Icon(Icons.category),
            title: const Text('Categories'),
            onTap: () {
              setScreen('categories');
              // if (Navigator.of(context).canPop()) {
              //   Navigator.of(context).pop();
              // }

              // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              //   return HomeScreen();
              // }));
            },
          ),
          ListTile(
            leading: const Icon(Icons.select_all),
            title: const Text('Vehicles'),
            onTap: () {
              // TODO: show all vehicles
            },
          ),
          ListTile(
            leading: const Icon(Icons.filter_alt),
            title: const Text('Filters'),
            onTap: () {
              setScreen('filters');
            },
            // () {
            //   if (Navigator.of(context).canPop()) {
            //     Navigator.of(context).pop();
            //   }

            //   Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            //     return FiltersScreen();
            //   }));
            // },
          )
        ],
      ),
    );
  }
}
