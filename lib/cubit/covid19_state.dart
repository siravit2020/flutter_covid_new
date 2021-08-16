part of 'covid19_cubit.dart';

@immutable
abstract class Covid19State {}

class Covid19Initial extends Covid19State {}

class FetchData extends Covid19State {
  final TodayModel today;
  final General infoCase;
 

  FetchData(this.today, this.infoCase);

}