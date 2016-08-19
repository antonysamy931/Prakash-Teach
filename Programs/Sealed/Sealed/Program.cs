using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sealed
{
    /// <summary>
    /// **********************************************************************
    /// What is sealed class?
    /// **********************************************************************
    /// Sealed classes are used to restrict the inheritance feature of object 
    /// oriented programming. Once a class is defined as a sealed class, the 
    /// class cannot be inherited. 
    /// </summary>
    class Program
    {
        static void Main(string[] args)
        {
            Abc abcobj = new Abc();
            abcobj.Display();
            Console.Read();
        }
    }

    /// <summary>
    /// Create sealed class using sealed keywork before class keyword
    /// </summary>
    public sealed class Abc
    {
        public void Display()
        {
            Console.WriteLine("Sealed class method invoked");
        }
    }

    /// <summary>
    /// Not possible to inherit sealed class.
    /// </summary>
    //public class Aef : Abc
    //{

    //}
}
