import 'package:dio/dio.dart';
import 'package:dio_client/dio_client.dart';
import 'package:flavor/model/user.dart';
import 'package:flavor/utils/flavor_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userProviderLoader = StateProvider((ref) => false);

final getUserProvider = StateNotifierProvider<GetUser, List<User>>((ref) {
  return GetUser(ref.read);
});

class GetUser extends StateNotifier<List<User>> {
  final Reader read;
  GetUser(this.read) : super([]) {
    fetchUsers();
  }

  fetchUsers() async {
    final myUrl = "${FlavorConfig.instance.values.baseUrl}";

    var dioClient = DioClientAuthorization(myUrl);

    read(userProviderLoader.notifier).state = true;
    List<User> _users = [];

    Response? res;
    res = await dioClient.get(myUrl);

    final List list = res.data;

    _users = list.map((e) => User.fromJson(e)).toList();
    state = _users;
    read(userProviderLoader.notifier).state = false;
  }

  update(int? id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          User(
            id: todo.id,
            name: todo.name,
            email: todo.email,
            phone: todo.phone,
            website: todo.website,
            company: todo.company,
            status: !todo.status!,
            username: todo.username,
            address: todo.address,
          )
        else
          todo,
    ];
  }
}
