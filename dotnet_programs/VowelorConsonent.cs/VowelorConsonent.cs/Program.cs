using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VowelorConsonent.cs
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("enter a letter:");
            char c = Convert.ToChar(Console.ReadLine());
            switch(c)
            {
                case 'a': Console.WriteLine("Given letter is an vowel");
                break;
                case 'e':
                    Console.WriteLine("Given letter is an vowel");
                    break;
                case 'i':
                    Console.WriteLine("Given letter is an vowel");
                    break;
                case 'o':
                    Console.WriteLine("Given letter is an vowel");
                    break;
                case 'u':
                    Console.WriteLine("Given letter is an vowel");
                    break;

                default: Console.WriteLine("Given letter is a consonent");
                    break;

            }
            Console.ReadLine();
     

        }
    }
}
