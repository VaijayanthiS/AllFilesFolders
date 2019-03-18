using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReverseNumber.cs
{
    class Program
    {
        static void Main(string[] args)
        {
            int rev = 0;
            int rem;
            Console.WriteLine("enter a number to reverse it");
            int num = int.Parse(Console.ReadLine());
            while(num>0)
            {
                rem = num % 10;
                rev = (rev*10) + rem;
                num = num / 10;
            }
            Console.WriteLine(rev);
            Console.ReadLine();
              
        }
    }
}
