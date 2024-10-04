import 'package:flutter/material.dart';

class UserDetailCard extends StatefulWidget {
  const UserDetailCard({super.key});

  @override
  _UserDetailCardState createState() => _UserDetailCardState();
}

class _UserDetailCardState extends State<UserDetailCard>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 5, 10, 3),
        child: Container(
            alignment: const Alignment(0, 0),
            child: Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 0.0),
                child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: height * 0.17,
                    width: double.infinity,
                    child: Column(children: [
                      Padding(
                          padding: const EdgeInsets.fromLTRB(15.0, 10, 0, 0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Center(
                                    child: CircleAvatar(
                                      radius: 28,
                                      backgroundImage:
                                          AssetImage("assets/profile.png"),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: Colors.orange[50],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: const Text(
                                            "admin",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                              color: Colors.deepOrange,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 10.0),
                                        child: Text(
                                          "Saliou Seck",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 21,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 50,
                                            ),
                                            Text(
                                              "",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]))
                    ])))));
  }
}
