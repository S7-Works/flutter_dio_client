import 'package:dio/dio.dart';
import 'package:dio_clients/dio_clients.dart';
import 'package:example/model/user.dart';
import 'package:example/utils/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userProviderLoader = StateProvider((ref) => true);


final getUserProvider = StateNotifierProvider<GetUser, List<User>>((ref) {
  return GetUser(ref);
});

class GetUser extends StateNotifier<List<User>> {
  final Ref ref;
  GetUser(this.ref) : super([]) {
    fetchUsers();
  }

  fetchUsers() async {
    final myUrl = Constants.baseUrl;

    var dioClient = DioClientNoAuthorization(myUrl);

    List<User> users = [];

    Response? res;
    res = await dioClient.get(myUrl,);

    final List list = res.data;

    users = list.map((e) => User.fromJson(e)).toList();
    state = users;
   ref.read(userProviderLoader.notifier).state = false;
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
