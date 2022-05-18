import 'package:flutter/material.dart';

class HomeScreenTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: new Scaffold(
        appBar: AppBar(
            title: new TabBar(
          tabs: <Tab>[
            new Tab(text: "Video"),
            new Tab(text: "School"),
            new Tab(text: "Acticles"),
          ], // ,
        )),
        body: new TabBarView(
          children: <Widget>[
            Center(
                child: Text(
              'T Tab',
              style: TextStyle(fontSize: 30),
            )),
            PrimarySchool(),
            Center(
                child: Text(
              'B Tab',
              style: TextStyle(fontSize: 30),
            )),
          ],
        ),
      ),
    );
  }
}

class PrimarySchool extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
     DefaultTabController(
      length: 3,
      child: new Scaffold(
        body: 
        new NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              new SliverAppBar(
                expandedHeight: 200,
                floating: true,
                pinned: true,
                snap: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 170,
                    color: Colors.red,
                  ),
                ),
                bottom: new TabBar(
                  tabs: <Tab>[
                    new Tab(text: "Primary"),
                    new Tab(text: "Secondary"),
                    new Tab(text: "Hight School"),
                  ], // <-- total of 2 tabs
                ),
              ),
            ];
          },
          body: new TabBarView(
            children: <Widget>[
              Center(
                  child: Text(
                'School Tab',
                style: TextStyle(fontSize: 30),
              )),
              Center(
                  child: Text(
                'School Tab',
                style: TextStyle(fontSize: 30),
              )),
              Center(
                  child: Text(
                'School Tab',
                style: TextStyle(fontSize: 30),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
