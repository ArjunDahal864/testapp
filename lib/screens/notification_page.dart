import 'package:app/bloc/notice/notice_bloc.dart';
import 'package:app/repo/repo.dart';
import 'package:app/screens/desktop/desktop.dart';
import 'package:app/screens/mobile/mobile.dart';
import 'package:app/screens/tablet/tablet.dart';
import 'package:app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: BlocProvider(
        create: (context) => NoticeBloc(notiRepo: NoticeReopImpl()
        ),
        child: MobileNotificationPage(),
      ),
      // mobile: MobileNotificationPage(),
      desktop: DesktopNotificationPage(),
      tablet: TabletNotificationPage(),
    );
  }
}
