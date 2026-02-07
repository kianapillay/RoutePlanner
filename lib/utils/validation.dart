class StopValidation
{
  static bool isValidName(String name)
  {
    return name.trim().isNotEmpty; //name.trim() remove space at the start and end. IsNotEmpty checks if any text is left. 
    //functions return true when the name has actual letters and is not empty.
  }

  static bool isValidLatitude(double lat)
  {
    return lat >= -90 && lat <= 90; // Latitude ranges from -90 && 90 
    //checks if number is in the given range.
  }

  static bool isValidLongitude(double lng)
  {
    return lng >= -180 && lng <= 180; // Longitude ranges from -180 && 180
    //checks if number is in the given range.
  }
}