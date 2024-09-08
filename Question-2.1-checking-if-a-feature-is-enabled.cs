using System;

namespace Zapper
{
    internal class Program
    {
        static void Main(string[] args)
        {

            Console.WriteLine("Please enter user settings.");

            var userSettings = Console.ReadLine();

            Console.WriteLine("Choose the following feature to check listed below:" + Environment.NewLine);
            Console.WriteLine("1 - SMS Notifications Enabled" + Environment.NewLine);
            Console.WriteLine("2 - Push Notifications Enabled" + Environment.NewLine);
            Console.WriteLine("3 - Bio-metrics Enabled" + Environment.NewLine);
            Console.WriteLine("4 - Camera Enabled" + Environment.NewLine);
            Console.WriteLine("5 - Location Enabled" + Environment.NewLine);
            Console.WriteLine("6 - NFC Enabled" + Environment.NewLine);
            Console.WriteLine("7 - Vouchers Enabled" + Environment.NewLine);
            Console.WriteLine("8 - Loyalty Enabled" + Environment.NewLine);

            int featureToCheck = Convert.ToInt32(Console.ReadLine());

            bool isEnabled = Settings.CheckFeatureEnabled(userSettings, featureToCheck);

            Console.WriteLine("Output: " + isEnabled);

            Console.ReadLine();

            Console.WriteLine("Press enter to exit!");
        }
    }


    public class Settings
    {
        public static bool CheckFeatureEnabled(string settings, int featureIndex)
        {
            if (featureIndex >= 0 && featureIndex < settings.Length)
                return settings[featureIndex] == '1';
            else
                throw new ArgumentOutOfRangeException("Feature index is out of range.");
        }
    }
}
