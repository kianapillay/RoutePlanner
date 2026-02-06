class StopValidation
{
  static bool isValidName(String name)
  {
    return name.trim().isNotEmpty;
  }

  static bool isValidLatitude(double lat)
  {
    return lat >= -90 && lat <= 90;
  }

  static bool isValidLongitude(double lng)
  {
    return lng >= -180 && lng <= 180;
  }
}