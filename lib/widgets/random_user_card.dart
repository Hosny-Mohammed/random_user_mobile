import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RandomUserCard extends StatelessWidget {
  final String name;
  final String email;
  final String pfp;
  const RandomUserCard({super.key, required this.name, required this.email, required this.pfp});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
          width: double.infinity,
          height: 85,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(pfp),
                radius: 35,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 25),
                  ),
                  Row(
                    children: [
                      Text(
                        email,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  )
                ],
              ),
              // const Spacer(),
              // const Icon(
              //   Icons.check_circle,
              //   color: Colors.grey,
              // )
            ],
          ),
        )
    );();
  }
}
