import 'package:flavor/provider/get_user_provider.dart';
import 'package:flavor/model/user.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

var userdetailsprovider = Provider.autoDispose<User>((ref) => const User());

class UserDetailsView extends HookConsumerWidget {
  const UserDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetails = ref.watch(userdetailsprovider);
    List result = userDetails.name!.split(' ');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Details ${userDetails.status.toString()}',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ListTile(
                title: const Text(
                  'Name',
                ),
                subtitle: Text(
                  result.length.toString(),
                ),
              ),
              ListTile(
                title: const Text(
                  'Email',
                ),
                subtitle: Text(
                  '${userDetails.email}',
                ),
              ),
              ListTile(
                title: const Text(
                  'Username',
                ),
                subtitle: Text(
                  '${userDetails.username}',
                ),
              ),
              ListTile(
                title: const Text(
                  'Phone Number',
                ),
                subtitle: Text(
                  userDetails.phone,
                ),
              ),
              ListTile(
                title: const Text(
                  'Address',
                ),
                subtitle: Text(
                  userDetails.address!.toString(),
                ),
              ),
              ListTile(
                title: const Text(
                  'Geo',
                ),
                subtitle: Text(
                  '${userDetails.address!.geo!.lat} ${userDetails.address!.geo!.lng}',
                ),
              ),
              ListTile(
                title: const Text(
                  'Company',
                ),
                subtitle: Text(
                  userDetails.company!.name,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(getUserProvider.notifier).update(userDetails.id);
          // Navigator.pop(context);
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
