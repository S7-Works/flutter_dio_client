<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

This package is used to include a dio client in the application.

<!-- ## Features

TODO: List what your package can do. Maybe include images, gifs, or videos. -->

## Getting started

Include the package in ```pubspec.yaml``` 
```dart
 dio_clients:
    git:
     url: https://github.com/S7-Works/flutter_dio_client.git
     ref: main
 ```    

## Usage

 Check longer examples
to `/example` folder.

```dart
 fetchUsers() async {
    final myUrl = Constants.baseUrl;

    var dioClient = DioClientNoAuthorization(myUrl);

    read(userProviderLoader.notifier).state = true;
    List<User> users = [];

    Response? res;
    res = await dioClient.get(myUrl);

    final List list = res.data;

    users = list.map((e) => User.fromJson(e)).toList();
    state = users;
    read(userProviderLoader.notifier).state = false;
  }
```
```dart
 fetchUsers() async {
    final myUrl = Constants.baseUrl;

    var dioClient = DioClientAuthorization(myUrl,authorization: "<add uthorization here>");
//   var dioClient = DioClientAuthorization(myUrl,authorization: "Basic sssssssssssssssssssssssssssssssssssss");
    read(userProviderLoader.notifier).state = true;
    List<User> users = [];

    Response? res;
    res = await dioClient.get(myUrl);

    final List list = res.data;

    users = list.map((e) => User.fromJson(e)).toList();
    state = users;
    read(userProviderLoader.notifier).state = false;
  }
```

