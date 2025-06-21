part of 'recommend_course_cubit.dart';

@immutable
sealed class RecommendCourseState {}

final class RecommendCourseInitial extends RecommendCourseState {}

final class RecommendCourseLoading extends RecommendCourseState {}

final class RecommendCourseSuccess extends RecommendCourseState {
  final List<AvaliableCourses> Recommended_courses;
  RecommendCourseSuccess({required this.Recommended_courses});
}

final class RecommendCourseFailure extends RecommendCourseState {
  final String errMessage;
  RecommendCourseFailure({required this.errMessage});
}