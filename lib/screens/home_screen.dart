import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_user/providers/user_provider.dart';
import '../widgets/random_user_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random User"),
        centerTitle: true,
      ),
      body: Consumer<UserProvider>(
        builder: (BuildContext context, UserProvider value, Widget? child) {
          var users = value.userModel?.result;
          bool isLoading = value.loading;
          if(users == null && isLoading == true){
            value.fetchUser();
            return const Center(
                child: CircularProgressIndicator());

          }else if(value.loading){
            return const Center(
                child: CircularProgressIndicator());
          }else{
            return ListView.separated(
                itemBuilder: (context, index) => RandomUserCard(
                  name: users?.elementAt(index)['name'],
                  email: users?.elementAt(index)['email'],
                  pfp: users?.elementAt(index)['image'],
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: 5);
          }
        },
      ),
      floatingActionButton: Consumer<UserProvider>(
        builder: (BuildContext context, UserProvider value, Widget? child){
          return FloatingActionButton(
              onPressed: (){
                  value.fetchUser();

              },
              child: const Icon(Icons.refresh));
        }),
      );
  }
}
