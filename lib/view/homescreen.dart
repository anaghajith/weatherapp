import 'package:flutter/material.dart';
import 'package:weatherapp/api/api.dart';
import 'package:weatherapp/view/settingscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<Map<String,dynamic>> Location;

  @override
  void initState() {
   Location = API().fetchLocationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Weather App"),
        backgroundColor: Colors.white10,
        leading: IconButton(
          icon: Icon(Icons.settings),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Text("Temperature",style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(
                child: FutureBuilder(
                  future: Location,
                  builder: (context,snapshot) {
                    if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                      return Text("$snapshot.temp");
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  } },
                ),
              ),
              SizedBox(height: 15,),
              Text("Weather",style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 15,),
        
              Text("Location",style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 15,),
        
              ElevatedButton(
                  onPressed: (){
                    RefreshIndicator(
                      displacement: 250,
                      backgroundColor: Colors.blueGrey,
                      color: Colors.white,
                      strokeWidth: 3,
                      triggerMode: RefreshIndicatorTriggerMode.onEdge,
                      onRefresh: () async {
                        await Future.delayed(Duration(milliseconds: 1500));
                        setState(() {});
                      },
                      child: Text(""),
                    );
                  },
                  child: Text("Refresh")
              ),
            ],
          ),
        ),
      ),
    );
  }
}

