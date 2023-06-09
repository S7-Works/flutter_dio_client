import 'package:example/provider/get_user_provider.dart';
import 'package:example/views/search.dart';
import 'package:example/views/viewdetails.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(getUserProvider);
    final loader = ref.watch(userProviderLoader);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DIO Client',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchFromApi(),
                ),
              );
            },
          ),
        ],
      ),
      body: loader == true
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];

                return ListTile(
                  title: Text(user.username!),
                  subtitle: Text(user.id!.toString()),
                  trailing: Text(user.name!),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProviderScope(
                          overrides: [
                            userdetailsprovider.overrideWithValue(
                              user,
                            ),
                          ],
                          child: const UserDetailsView(),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
