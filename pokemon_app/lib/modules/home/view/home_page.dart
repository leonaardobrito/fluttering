import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:pokemon_app/modules/home/controller/home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController _controller;

  const HomePage(this._controller, {required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Medicamentos'),
        actions: [
          PopupMenuButton(
            initialValue: _controller.limit,
            onSelected: (value) => _controller.changeTotalPerPage(value),
            itemBuilder: (context) {
              return [
                CheckedPopupMenuItem(
                  value: 15,
                  checked: _controller.limit == 15,
                  child: const Text('15 por pagina'),
                ),
                CheckedPopupMenuItem(
                  value: 20,
                  checked: _controller.limit == 20,
                  child: const Text('20 por pagina'),
                ),
                CheckedPopupMenuItem(
                  value: 50,
                  checked: _controller.limit == 50,
                  child: const Text('50 por pagina'),
                ),
              ];
            },
          )
        ],
      ),
      body: Obx(
        () => LazyLoadScrollView(
          onEndOfPage: () => _controller.nextPage(),
          isLoading: _controller.lastPage,
          child: ListView.builder(
            itemCount: _controller.users.length,
            itemBuilder: (context, index) {
              final user = _controller.users[index];
              return const ListTile(
                  leading: Text("user.page"),
                  title: Text("user.totalItems"),
                  subtitle: Text("user.lastPage"));
            },
          ),
        ),
      ),
    );
  }
}
