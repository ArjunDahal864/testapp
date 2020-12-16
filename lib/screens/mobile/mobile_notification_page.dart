import 'package:app/bloc/notice/notice_bloc.dart';
import 'package:app/bloc/notice/notice_event.dart';
import 'package:app/bloc/notice/notice_state.dart';
import 'package:app/model/noti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:bloc/bloc.dart';
class MobileNotificationPage extends StatefulWidget {
  @override
  _MobileNotificationPageState createState() => _MobileNotificationPageState();
}

class _MobileNotificationPageState extends State<MobileNotificationPage> {
  @override
  void initState() {
    super.initState();
    _loadNotice();
  }

  _loadNotice() async {
    context.read<NoticeBloc>().add(NoticeEvents.fetchNotice);
  }

  @override
  // ignore: deprecated_member_use
  Widget build(BuildContext context) {
    return Scaffold(
      body: _dynamicBody(),
    );
  }
}

_dynamicBody() {
  return Center(
    child: Column(
      children: [
        BlocBuilder<NoticeBloc, NoticeState>(
          builder: (BuildContext context, NoticeState state) {
            if (state is NoticeError) {
              final error = state.error;
              String msg = '${error.msg} \n Tap To Retry';
              return Text(msg);
            } else if (state is NoticeLoaded) {
              List<Noti> noti = state.noti;
              return _list(noti);
            } else {
              return CircularProgressIndicator();
            }
          },
        )
      ],
    ),
  );
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
                Text(notice.msg,style: TextStyle(fontSize: 22),),
                SizedBox(height: 5,),
                Text(notice.author.username,style: TextStyle(fontSize: 20),),
                SizedBox(height: 5,),
                Text(notice.time,style: TextStyle(fontSize: 18),)
              ],
            ),
          ),
        ),
      );
    },
  ));
}
