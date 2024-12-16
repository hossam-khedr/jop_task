import 'package:dio/dio.dart';

class DioErrorHandler {

  static const String _connectionTimeout = "انتهت مهلة الاتصال";
  static const String _sendTimeout = "انتهت مهلة إرسال البيانات";
  static const String _receiveTimeout = "انتهت مهلة استلام البيانات";
  static const String _badCertificate = "شهادة SSL غير صالحة";
  static const String _badResponse = "استجابة غير صالحة من الخادم";
  static const String _cancel = "تم إلغاء الطلب";
  static const String _connectionError = "خطأ في الاتصال بالإنترنت";
  static const String _unknown = "حدث خطأ غير معروف";


  static String handleDioError(DioException error) {
    String errorMessage = "";

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        errorMessage = _connectionTimeout;
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = _sendTimeout;
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = _receiveTimeout;
        break;
      case DioExceptionType.badCertificate:
        errorMessage = _badCertificate;
        break;
      case DioExceptionType.badResponse:
        errorMessage = _handleResponse(error.response?.statusCode);
        break;
      case DioExceptionType.cancel:
        errorMessage = _cancel;
        break;
      case DioExceptionType.connectionError:
        errorMessage = _connectionError;
        break;
      case DioExceptionType.unknown:
        errorMessage = _unknown;
        break;
    }

    return errorMessage;
  }


  static String _handleResponse(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'طلب غير صالح';
      case 401:
        return 'غير مصرح له';
      case 403:
        return 'ممنوع الوصول';
      case 404:
        return 'لم يتم العثور على المورد';
      case 405:
        return 'طريقة الطلب غير مسموح بها';
      case 415:
        return 'نوع الوسائط غير مدعوم';
      case 422:
        return 'لم يمكن معالجة البيانات المرسلة';
      case 429:
        return 'طلبات كثيرة جداً';
      case 500:
        return 'خطأ داخلي في الخادم';
      case 501:
        return 'لم يتم تنفيذ الطلب';
      case 502:
        return 'بوابة غير صالحة';
      case 503:
        return 'الخدمة غير متوفرة';
      case 504:
        return 'انتهت مهلة البوابة';
      default:
        return 'خطأ في الاستجابة من الخادم';
    }
  }
}