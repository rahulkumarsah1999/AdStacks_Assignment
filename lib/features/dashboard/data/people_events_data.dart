import '../../../../core/theme/app_colors.dart';
import '../models/people_event_model.dart';

const birthdayEvent = PeopleEventModel(
  title: 'Today Birthday',
  total: 2,
  avatarCount: 2,
  buttonLabel: 'Birthday Wishing',
  buttonColor: AppColors.purple,
  avatarColor: AppColors.purple,
);

const anniversaryEvent = PeopleEventModel(
  title: 'Anniversary',
  total: 3,
  avatarCount: 3,
  buttonLabel: 'Anniversary Wishing',
  buttonColor: AppColors.pink,
  avatarColor: AppColors.pink,
);