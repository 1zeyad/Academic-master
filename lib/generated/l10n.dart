// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Plan`
  String get plan {
    return Intl.message(
      'Plan',
      name: 'plan',
      desc: '',
      args: [],
    );
  }

  /// `Plans`
  String get plans {
    return Intl.message(
      'Plans',
      name: 'plans',
      desc: '',
      args: [],
    );
  }

  /// `Results`
  String get results {
    return Intl.message(
      'Results',
      name: 'results',
      desc: '',
      args: [],
    );
  }

  /// `Courses`
  String get courses {
    return Intl.message(
      'Courses',
      name: 'courses',
      desc: '',
      args: [],
    );
  }

  /// `Registration`
  String get registration {
    return Intl.message(
      'Registration',
      name: 'registration',
      desc: '',
      args: [],
    );
  }

  /// `Regulation`
  String get regulation {
    return Intl.message(
      'Regulation',
      name: 'regulation',
      desc: '',
      args: [],
    );
  }

  /// `Academic Info`
  String get academicInfo {
    return Intl.message(
      'Academic Info',
      name: 'academicInfo',
      desc: '',
      args: [],
    );
  }

  /// `Recommend Courses`
  String get recommendCourses {
    return Intl.message(
      'Recommend Courses',
      name: 'recommendCourses',
      desc: '',
      args: [],
    );
  }

  /// `Training`
  String get training {
    return Intl.message(
      'Training',
      name: 'training',
      desc: '',
      args: [],
    );
  }

  /// `Academic Training`
  String get academicTraining {
    return Intl.message(
      'Academic Training',
      name: 'academicTraining',
      desc: '',
      args: [],
    );
  }

  /// `Academic Alert`
  String get academicAlert {
    return Intl.message(
      'Academic Alert',
      name: 'academicAlert',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back !`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back !',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Select Level`
  String get select_level {
    return Intl.message(
      'Select Level',
      name: 'select_level',
      desc: '',
      args: [],
    );
  }

  /// `Level`
  String get level {
    return Intl.message(
      'Level',
      name: 'level',
      desc: '',
      args: [],
    );
  }

  /// `Semester`
  String get semester {
    return Intl.message(
      'Semester',
      name: 'semester',
      desc: '',
      args: [],
    );
  }

  /// `Code`
  String get code {
    return Intl.message(
      'Code',
      name: 'code',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Credits`
  String get credits {
    return Intl.message(
      'Credits',
      name: 'credits',
      desc: '',
      args: [],
    );
  }

  /// `Lecture Hours`
  String get lecture_hours {
    return Intl.message(
      'Lecture Hours',
      name: 'lecture_hours',
      desc: '',
      args: [],
    );
  }

  /// `Practical Hours`
  String get practical_hours {
    return Intl.message(
      'Practical Hours',
      name: 'practical_hours',
      desc: '',
      args: [],
    );
  }

  /// `Course Grades`
  String get courseGrades {
    return Intl.message(
      'Course Grades',
      name: 'courseGrades',
      desc: '',
      args: [],
    );
  }

  /// `Term`
  String get term {
    return Intl.message(
      'Term',
      name: 'term',
      desc: '',
      args: [],
    );
  }

  /// `hours`
  String get hours {
    return Intl.message(
      'hours',
      name: 'hours',
      desc: '',
      args: [],
    );
  }

  /// `No data available`
  String get noData {
    return Intl.message(
      'No data available',
      name: 'noData',
      desc: '',
      args: [],
    );
  }

  /// `Course`
  String get course {
    return Intl.message(
      'Course',
      name: 'course',
      desc: '',
      args: [],
    );
  }

  /// `Hours`
  String get credit {
    return Intl.message(
      'Hours',
      name: 'credit',
      desc: '',
      args: [],
    );
  }

  /// `Degree`
  String get degree {
    return Intl.message(
      'Degree',
      name: 'degree',
      desc: '',
      args: [],
    );
  }

  /// `Grade`
  String get grade {
    return Intl.message(
      'Grade',
      name: 'grade',
      desc: '',
      args: [],
    );
  }

  /// `Term GPA`
  String get termGpa {
    return Intl.message(
      'Term GPA',
      name: 'termGpa',
      desc: '',
      args: [],
    );
  }

  /// `Attempted Hours`
  String get attemptedHours {
    return Intl.message(
      'Attempted Hours',
      name: 'attemptedHours',
      desc: '',
      args: [],
    );
  }

  /// `Total Earned Hours`
  String get totalEarnedHours {
    return Intl.message(
      'Total Earned Hours',
      name: 'totalEarnedHours',
      desc: '',
      args: [],
    );
  }

  /// `Page Title`
  String get customAppBarTitle {
    return Intl.message(
      'Page Title',
      name: 'customAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Selected courses`
  String get customInsideAppBarTitle {
    return Intl.message(
      'Selected courses',
      name: 'customInsideAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Select Courses`
  String get selectCourses {
    return Intl.message(
      'Select Courses',
      name: 'selectCourses',
      desc: '',
      args: [],
    );
  }

  /// `Student Data`
  String get studentData {
    return Intl.message(
      'Student Data',
      name: 'studentData',
      desc: '',
      args: [],
    );
  }

  /// `Student Grades`
  String get studentGrades {
    return Intl.message(
      'Student Grades',
      name: 'studentGrades',
      desc: '',
      args: [],
    );
  }

  /// `Fall`
  String get fall {
    return Intl.message(
      'Fall',
      name: 'fall',
      desc: '',
      args: [],
    );
  }

  /// `Summer`
  String get summer {
    return Intl.message(
      'Summer',
      name: 'summer',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `required`
  String get fieldIsRequired {
    return Intl.message(
      'required',
      name: 'fieldIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password must be between 4 and 30 characters`
  String get passwordLengthError {
    return Intl.message(
      'Password must be between 4 and 30 characters',
      name: 'passwordLengthError',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while resetting the password`
  String get forgetPasswordError {
    return Intl.message(
      'An error occurred while resetting the password',
      name: 'forgetPasswordError',
      desc: '',
      args: [],
    );
  }

  /// `Verification code sent successfully`
  String get forgetPasswordSuccess {
    return Intl.message(
      'Verification code sent successfully',
      name: 'forgetPasswordSuccess',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while resetting the password`
  String get resetPasswordError {
    return Intl.message(
      'An error occurred while resetting the password',
      name: 'resetPasswordError',
      desc: '',
      args: [],
    );
  }

  /// `Password updated successfully`
  String get resetPasswordSuccess {
    return Intl.message(
      'Password updated successfully',
      name: 'resetPasswordSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Domitta University`
  String get domittaUniversity {
    return Intl.message(
      'Domitta University',
      name: 'domittaUniversity',
      desc: '',
      args: [],
    );
  }

  /// `Login successful`
  String get loginSuccess {
    return Intl.message(
      'Login successful',
      name: 'loginSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Verification code failed`
  String get verificationFailed {
    return Intl.message(
      'Verification code failed',
      name: 'verificationFailed',
      desc: '',
      args: [],
    );
  }

  /// `Verification successful`
  String get verificationSuccess {
    return Intl.message(
      'Verification successful',
      name: 'verificationSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password`
  String get forgetPassword {
    return Intl.message(
      'Forget Password',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Your Email`
  String get yourEmail {
    return Intl.message(
      'Your Email',
      name: 'yourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Re-enter password`
  String get reEnterPassword {
    return Intl.message(
      'Re-enter password',
      name: 'reEnterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forgetPasswordQ {
    return Intl.message(
      'Forget Password?',
      name: 'forgetPasswordQ',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get login {
    return Intl.message(
      'Log in',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Code Verification`
  String get codeVerification {
    return Intl.message(
      'Code Verification',
      name: 'codeVerification',
      desc: '',
      args: [],
    );
  }

  /// `Enter 4 digit code that was sent to your email`
  String get enter4DigitCode {
    return Intl.message(
      'Enter 4 digit code that was sent to your email',
      name: 'enter4DigitCode',
      desc: '',
      args: [],
    );
  }

  /// `Verify Code`
  String get verifyCode {
    return Intl.message(
      'Verify Code',
      name: 'verifyCode',
      desc: '',
      args: [],
    );
  }

  /// `Resend email`
  String get resendEmail {
    return Intl.message(
      'Resend email',
      name: 'resendEmail',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get currentPassword {
    return Intl.message(
      'Current Password',
      name: 'currentPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirmNewPassword {
    return Intl.message(
      'Confirm New Password',
      name: 'confirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter current password`
  String get enterCurrentPassword {
    return Intl.message(
      'Enter current password',
      name: 'enterCurrentPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter new password`
  String get enterNewPassword {
    return Intl.message(
      'Enter new password',
      name: 'enterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm new password`
  String get confirmNewPasswordHint {
    return Intl.message(
      'Confirm new password',
      name: 'confirmNewPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `New password does not match`
  String get newPasswordMismatch {
    return Intl.message(
      'New password does not match',
      name: 'newPasswordMismatch',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirmButton {
    return Intl.message(
      'Confirm',
      name: 'confirmButton',
      desc: '',
      args: [],
    );
  }

  /// `Hrs\nto be Graduated`
  String get hoursToGraduate {
    return Intl.message(
      'Hrs\nto be Graduated',
      name: 'hoursToGraduate',
      desc: '',
      args: [],
    );
  }

  /// `Registration Rules`
  String get registrationRules {
    return Intl.message(
      'Registration Rules',
      name: 'registrationRules',
      desc: '',
      args: [],
    );
  }

  /// `Academic Requirements`
  String get academicRequirements {
    return Intl.message(
      'Academic Requirements',
      name: 'academicRequirements',
      desc: '',
      args: [],
    );
  }

  /// `Specialization Requirements`
  String get specializationRequirements {
    return Intl.message(
      'Specialization Requirements',
      name: 'specializationRequirements',
      desc: '',
      args: [],
    );
  }

  /// `University Requirements`
  String get universityRequirements {
    return Intl.message(
      'University Requirements',
      name: 'universityRequirements',
      desc: '',
      args: [],
    );
  }

  /// `Faculty Requirements`
  String get facultyRequirements {
    return Intl.message(
      'Faculty Requirements',
      name: 'facultyRequirements',
      desc: '',
      args: [],
    );
  }

  /// `Basic Science Requirements`
  String get basicScienceRequirements {
    return Intl.message(
      'Basic Science Requirements',
      name: 'basicScienceRequirements',
      desc: '',
      args: [],
    );
  }

  /// `Retake Rules`
  String get retakeRules {
    return Intl.message(
      'Retake Rules',
      name: 'retakeRules',
      desc: '',
      args: [],
    );
  }

  /// `Dismissal Rules`
  String get dismissalRules {
    return Intl.message(
      'Dismissal Rules',
      name: 'dismissalRules',
      desc: '',
      args: [],
    );
  }

  /// `Select Section`
  String get selectSection {
    return Intl.message(
      'Select Section',
      name: 'selectSection',
      desc: '',
      args: [],
    );
  }

  /// `Levels`
  String get levels {
    return Intl.message(
      'Levels',
      name: 'levels',
      desc: '',
      args: [],
    );
  }

  /// `Grades`
  String get grades {
    return Intl.message(
      'Grades',
      name: 'grades',
      desc: '',
      args: [],
    );
  }

  /// `Course GPA Ranges`
  String get courseGpaRanges {
    return Intl.message(
      'Course GPA Ranges',
      name: 'courseGpaRanges',
      desc: '',
      args: [],
    );
  }

  /// `Cumulative GPA Ranges`
  String get cumGpaRanges {
    return Intl.message(
      'Cumulative GPA Ranges',
      name: 'cumGpaRanges',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get from {
    return Intl.message(
      'From',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get to {
    return Intl.message(
      'To',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `GPA`
  String get gpa {
    return Intl.message(
      'GPA',
      name: 'gpa',
      desc: '',
      args: [],
    );
  }

  /// `Requirements`
  String get requirements {
    return Intl.message(
      'Requirements',
      name: 'requirements',
      desc: '',
      args: [],
    );
  }

  /// `Hour Requirements`
  String get hourRequirements {
    return Intl.message(
      'Hour Requirements',
      name: 'hourRequirements',
      desc: '',
      args: [],
    );
  }

  /// `Course Info`
  String get courseInfo {
    return Intl.message(
      'Course Info',
      name: 'courseInfo',
      desc: '',
      args: [],
    );
  }

  /// `My Courses`
  String get myCourses {
    return Intl.message(
      'My Courses',
      name: 'myCourses',
      desc: '',
      args: [],
    );
  }

  /// `Recommended Courses`
  String get recommendedCourses {
    return Intl.message(
      'Recommended Courses',
      name: 'recommendedCourses',
      desc: '',
      args: [],
    );
  }

  /// `Lecture Hours`
  String get lectureHours {
    return Intl.message(
      'Lecture Hours',
      name: 'lectureHours',
      desc: '',
      args: [],
    );
  }

  /// `Practical Hours`
  String get practicalHours {
    return Intl.message(
      'Practical Hours',
      name: 'practicalHours',
      desc: '',
      args: [],
    );
  }

  /// `Credit Hours`
  String get creditHours {
    return Intl.message(
      'Credit Hours',
      name: 'creditHours',
      desc: '',
      args: [],
    );
  }

  /// `Prerequisite`
  String get prerequisite {
    return Intl.message(
      'Prerequisite',
      name: 'prerequisite',
      desc: '',
      args: [],
    );
  }

  /// `No prerequisite`
  String get noPrerequisite {
    return Intl.message(
      'No prerequisite',
      name: 'noPrerequisite',
      desc: '',
      args: [],
    );
  }

  /// `Info`
  String get info {
    return Intl.message(
      'Info',
      name: 'info',
      desc: '',
      args: [],
    );
  }

  /// `Selected`
  String get selected {
    return Intl.message(
      'Selected',
      name: 'selected',
      desc: '',
      args: [],
    );
  }

  /// `Register !`
  String get register {
    return Intl.message(
      'Register !',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Field`
  String get field {
    return Intl.message(
      'Field',
      name: 'field',
      desc: '',
      args: [],
    );
  }

  /// `CS`
  String get cs {
    return Intl.message(
      'CS',
      name: 'cs',
      desc: '',
      args: [],
    );
  }

  /// `Gained Hours`
  String get gainedHours {
    return Intl.message(
      'Gained Hours',
      name: 'gainedHours',
      desc: '',
      args: [],
    );
  }

  /// `Personal Data`
  String get personalData {
    return Intl.message(
      'Personal Data',
      name: 'personalData',
      desc: '',
      args: [],
    );
  }

  /// `Academic Data`
  String get academicData {
    return Intl.message(
      'Academic Data',
      name: 'academicData',
      desc: '',
      args: [],
    );
  }

  /// `Courses Grades`
  String get coursesGrades {
    return Intl.message(
      'Courses Grades',
      name: 'coursesGrades',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `University ID`
  String get universityId {
    return Intl.message(
      'University ID',
      name: 'universityId',
      desc: '',
      args: [],
    );
  }

  /// `National ID`
  String get nationalId {
    return Intl.message(
      'National ID',
      name: 'nationalId',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Warning Number`
  String get classNumber {
    return Intl.message(
      'Warning Number',
      name: 'classNumber',
      desc: '',
      args: [],
    );
  }

  /// `Academic Year`
  String get academicYear {
    return Intl.message(
      'Academic Year',
      name: 'academicYear',
      desc: '',
      args: [],
    );
  }

  /// `First Semester`
  String get firstSemester {
    return Intl.message(
      'First Semester',
      name: 'firstSemester',
      desc: '',
      args: [],
    );
  }

  /// `Second Semester`
  String get secondSemester {
    return Intl.message(
      'Second Semester',
      name: 'secondSemester',
      desc: '',
      args: [],
    );
  }

  /// `Max Registration Hours`
  String get maxRegistrationHours {
    return Intl.message(
      'Max Registration Hours',
      name: 'maxRegistrationHours',
      desc: '',
      args: [],
    );
  }

  /// `Regulation Hours`
  String get regulationHours {
    return Intl.message(
      'Regulation Hours',
      name: 'regulationHours',
      desc: '',
      args: [],
    );
  }

  /// `Required Hours`
  String get requiredHours {
    return Intl.message(
      'Required Hours',
      name: 'requiredHours',
      desc: '',
      args: [],
    );
  }

  /// `Normal Registration Hours`
  String get normalRegistrationHours {
    return Intl.message(
      'Normal Registration Hours',
      name: 'normalRegistrationHours',
      desc: '',
      args: [],
    );
  }

  /// `Min Registration Hours`
  String get minRegistrationHours {
    return Intl.message(
      'Min Registration Hours',
      name: 'minRegistrationHours',
      desc: '',
      args: [],
    );
  }

  /// `GPA for Max Hours`
  String get gpaForMaxHours {
    return Intl.message(
      'GPA for Max Hours',
      name: 'gpaForMaxHours',
      desc: '',
      args: [],
    );
  }

  /// `Summer Term Hours`
  String get summerTermHours {
    return Intl.message(
      'Summer Term Hours',
      name: 'summerTermHours',
      desc: '',
      args: [],
    );
  }

  /// `Levels Count`
  String get levelsCount {
    return Intl.message(
      'Levels Count',
      name: 'levelsCount',
      desc: '',
      args: [],
    );
  }

  /// `Semesters Without GPA Rules`
  String get semestersWithoutGpaRules {
    return Intl.message(
      'Semesters Without GPA Rules',
      name: 'semestersWithoutGpaRules',
      desc: '',
      args: [],
    );
  }

  /// `Mandatory Hours`
  String get mandatoryHours {
    return Intl.message(
      'Mandatory Hours',
      name: 'mandatoryHours',
      desc: '',
      args: [],
    );
  }

  /// `Optional Hours`
  String get optionalHours {
    return Intl.message(
      'Optional Hours',
      name: 'optionalHours',
      desc: '',
      args: [],
    );
  }

  /// `Max Retake Grade`
  String get maxRetakeGrade {
    return Intl.message(
      'Max Retake Grade',
      name: 'maxRetakeGrade',
      desc: '',
      args: [],
    );
  }

  /// `Max Retake Courses`
  String get maxRetakeCourses {
    return Intl.message(
      'Max Retake Courses',
      name: 'maxRetakeCourses',
      desc: '',
      args: [],
    );
  }

  /// `Max Consecutive Warnings`
  String get maxConsecutiveWarnings {
    return Intl.message(
      'Max Consecutive Warnings',
      name: 'maxConsecutiveWarnings',
      desc: '',
      args: [],
    );
  }

  /// `Max Years in Level 1`
  String get maxYearsLevelOne {
    return Intl.message(
      'Max Years in Level 1',
      name: 'maxYearsLevelOne',
      desc: '',
      args: [],
    );
  }

  /// `Min GPA for Graduation`
  String get minGpaForGraduation {
    return Intl.message(
      'Min GPA for Graduation',
      name: 'minGpaForGraduation',
      desc: '',
      args: [],
    );
  }

  /// `You have not completed your training hours`
  String get incompleteTrainingHours {
    return Intl.message(
      'You have not completed your training hours',
      name: 'incompleteTrainingHours',
      desc: '',
      args: [],
    );
  }

  /// `Registration is Closed`
  String get registrationClosed {
    return Intl.message(
      'Registration is Closed',
      name: 'registrationClosed',
      desc: '',
      args: [],
    );
  }

  /// `First`
  String get first {
    return Intl.message(
      'First',
      name: 'first',
      desc: '',
      args: [],
    );
  }

  /// `Second`
  String get second {
    return Intl.message(
      'Second',
      name: 'second',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email address`
  String get invalidEmail {
    return Intl.message(
      'Invalid email address',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `admin`
  String get admin {
    return Intl.message(
      'admin',
      name: 'admin',
      desc: '',
      args: [],
    );
  }

  /// `summer Term`
  String get summerTerm {
    return Intl.message(
      'summer Term',
      name: 'summerTerm',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get general {
    return Intl.message(
      'General',
      name: 'general',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Graduation Project Requirements`
  String get gradProjectRequirements {
    return Intl.message(
      'Graduation Project Requirements',
      name: 'gradProjectRequirements',
      desc: '',
      args: [],
    );
  }

  /// `Training Requirements`
  String get trainingRequirements {
    return Intl.message(
      'Training Requirements',
      name: 'trainingRequirements',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
