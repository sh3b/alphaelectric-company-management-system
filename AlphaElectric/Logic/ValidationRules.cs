using System;
using System.Globalization;
using System.Windows.Controls;

namespace AlphaElectric.Logic
{
    public class NotEmptyValidationRule : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            return string.IsNullOrWhiteSpace((value ?? "").ToString())
                ? new ValidationResult(false, "Field is required.")
                : ValidationResult.ValidResult;
        }
    }

    public class FutureDateValidationRule : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            if (!DateTime.TryParse((value ?? "").ToString(),
                CultureInfo.CurrentCulture,
                DateTimeStyles.AssumeLocal | DateTimeStyles.AllowWhiteSpaces,
                out var time))
            {
                return new ValidationResult(false, "Invalid date");
            }

            return time.Date <= DateTime.Now.Date
                ? new ValidationResult(false, "Future date required")
                : ValidationResult.ValidResult;
        }
    }

    public class PresentFutureDateValidationRule : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            if (!DateTime.TryParse((value ?? "").ToString(),
                CultureInfo.CurrentCulture,
                DateTimeStyles.AssumeLocal | DateTimeStyles.AllowWhiteSpaces,
                out var time))
            {
                return new ValidationResult(false, "Invalid date");
            }

            return time.Date <= DateTime.Now.Date.AddDays(-1)
                ? new ValidationResult(false, "Present or Future date required")
                : ValidationResult.ValidResult;
        }
    }

    public class PastDateValidationRule : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            if (!DateTime.TryParse((value ?? "").ToString(),
                CultureInfo.CurrentCulture,
                DateTimeStyles.AssumeLocal | DateTimeStyles.AllowWhiteSpaces,
                out var time))
            {
                return new ValidationResult(false, "Invalid date");
            }

            return time.Date >= DateTime.Now.Date.AddDays(1) 
                ? new ValidationResult(false, "Present or Past date required")
                : ValidationResult.ValidResult;
        }
    }
}
