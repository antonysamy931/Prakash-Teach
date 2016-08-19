using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Partial
{
    /// <summary>
    /// ************************************************************
    /// What is Partial Class?
    /// ************************************************************
    /// Parial class is incomplete class. Partial classes span multiple files. 
    /// How can you use the partial modifier on a C# class declaration? 
    /// With partial, you can physically separate a class into multiple files. 
    /// This is often done by code generators.
    /// </summary>
    class Program
    {
        static void Main(string[] args)
        {
            Abc abc = new Abc();
            abc.DisplayPartial1();
            abc.DisplayPartial2();
            Console.Read();
        }
    }

    public partial class Abc
    {
        public void DisplayPartial1()
        {
            Console.WriteLine("Display from partial one method");
        }
    }

    public partial class Abc
    {
        public void DisplayPartial2()
        {
            Console.WriteLine("Display from partial two method");
        }
    }
}
