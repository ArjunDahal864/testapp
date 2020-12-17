import 'package:app/bloc/search/search_bloc.dart';
import 'package:app/bloc/search/search_event.dart';
import 'package:app/bloc/search/search_state.dart';
import 'package:app/model/noti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabletSearchPage extends StatefulWidget {
  @override
  _TabletSearchPageState createState() => _TabletSearchPageState();
}

class _TabletSearchPageState extends State<TabletSearchPage> {
  
    _loadNotice(String query) async {
    context.read<SearchBloc>().add(FetchNotice(query:query ));
  }

  var textController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: BlocBuilder<SearchBloc, SearchState>(
                builder: (BuildContext context, SearchState state) {
              if (state is SearchError) {
                final err = state.error;
                String msg = 'got some error ${err.msg}';
                return Text(msg);
              } else if (state is Loaded) {
                List<Noti> noti = state.noti;
                return Column(children:[
                  _list(noti)
                ]);
              } else if (state is Loading) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: textController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white70,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Colors.blue, style: BorderStyle.solid)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Colors.blue, style: BorderStyle.solid)),
                        hintText: "Query",
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      child: FlatButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        onPressed: () {
                          textController.text = "Data";
                          _loadNotice(textController.text);
                        },
                        color: Colors.lightBlue,
                        child: Text(
                          "Search",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  )
                ]);
              }
            }),
          )
        ]);
  }
}

Widget _list(List<Noti> noti) {
  return Expanded(
      child: ListView.builder(
    itemCount: noti.length,
    itemBuilder: (ctx, index) {
      Noti notice = noti[index];
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notice.msg,
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  notice.author.username,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  notice.time,
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
        ),
      );
    },
  ));
}
