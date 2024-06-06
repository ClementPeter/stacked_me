import 'package:form_stckd/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:form_stckd/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:form_stckd/ui/views/home/home_view.dart';
import 'package:form_stckd/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:form_stckd/ui/views/text_reverse/text_reverse_view.dart';
import 'package:form_stckd/ui/views/email_verifier/email_verifier_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    CupertinoRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: TextReverseView),
    MaterialRoute(page: EmailVerifierView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
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
