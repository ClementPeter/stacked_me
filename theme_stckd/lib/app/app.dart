import 'package:stacked_themes/stacked_themes.dart';
import 'package:theme_stckd/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:theme_stckd/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:theme_stckd/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:theme_stckd/ui/views/home/home_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView),
    MaterialRoute(page: HomeView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    Singleton(
      classType: ThemeService,
      resolveUsing: ThemeService.getInstance,
    )
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
