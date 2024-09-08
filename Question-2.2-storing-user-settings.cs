using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Zapper
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string filePath = "settings.txt";

            int numOfSettings = 0;

            Console.WriteLine("Please enter the number of settings to be added:.");

            numOfSettings = Convert.ToInt32(Console.ReadLine());

            List<string> strings = new List<string>();

            for (int i = 0; i <= numOfSettings - 1; i++)
            {
                Console.WriteLine("Please enter user settings.");
                string userSettings = Console.ReadLine();
                //strings.Add(userSettings);
                Settings.WriteSettingsToFile(userSettings, filePath);
            }

            string loadedSettings = Settings.ReadSettingsFromFile(filePath);
            Console.WriteLine(loadedSettings);
            Console.ReadLine();
        }
    }

    public class Settings
    {

        public static void WriteSettingsToFile(string settings, string filePath)
        {
            using (StreamWriter streamwriter = File.AppendText(filePath))
            {
               streamwriter.WriteLine(settings);
            }
        }

        public static string ReadSettingsFromFile(string filePath)
        {
            var sb = new StringBuilder();

            using (FileStream fs = File.Open(filePath, FileMode.Open, FileAccess.Read, FileShare.ReadWrite))
            using (BufferedStream bs = new BufferedStream(fs))
            using (StreamReader sr = new StreamReader(bs))
            {
                string line;
                while ((line = sr.ReadLine()) != null)
                {
                    sb.AppendLine(line);
                }
            }

            return sb.ToString();
        }
    }



}
