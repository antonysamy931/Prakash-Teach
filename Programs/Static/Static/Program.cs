using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Static
{
    /// <summary>
    /// *************************************************************************
    /// What is static class?
    /// *************************************************************************
    /// A static class is basically the same as a non-static class, 
    /// but there is one difference: a static class cannot be instantiated. 
    /// Because there is no instance variable, you access the members of a static class by 
    /// using the class name itself. The compiler will guarantee that instances of 
    /// this class cannot be created. Static classes are sealed and therefore cannot be inherited.
    /// 
    /// Features of Static class :
    /// ************************************************************************
    /// 1. Contains only static members.
    /// 2. Cannot be instantiated.
    /// 3. Is sealed so we cannot inherited.
    /// 4. Cannot contain Instance Constructors.
    /// </summary>

    class Program
    {
        static void Main(string[] args)
        {
            ///We can access static class property using class name itself
            ///No need to create instance of the class
            ///Assign string value to static class property
            Abc.Name = "C# Static";
            ///We can access static class member function using class name itself            
            Abc.Display();
            
            ///Access non static class and non static method and property
            ///we should create instance of a class
            Aef aefObj = new Aef();
            aefObj.First = "C# Share";
            aefObj.Display();

            ///Access non static class static property and method
            Aef.Last = ".Net";
            Aef.DisplayLast();

            Console.Read();
        }
    }

    /// <summary>
    /// Create static class using static keywork before class keyword
    /// if class created static, inside all members and functions should be static otherwise throws exception.
    /// </summary>
    public static class Abc
    {
        /// <summary>
        /// Static property
        /// </summary>
        public static string Name { get; set; }

        /// <summary>
        /// Static member function
        /// </summary>
        public static void Display()
        {
            Console.WriteLine(Name);
        }
    }

    /// <summary>
    /// In not static class we can able to create static method and properties
    /// But static class contains only static method and properties alone
    /// Can we access static method or properties using class name itself, no need to create instance of class
    /// Can we access non static method or properties using instance of an object
    /// </summary>
    public class Aef
    {
        /// <summary>
        /// Non static property
        /// </summary>
        public string First { get; set; }
        /// <summary>
        /// Static property
        /// </summary>
        public static string Last { get; set; }

        /// <summary>
        /// Non static method
        /// </summary>
        public void Display()
        {
            Console.WriteLine(First);
        }

        /// <summary>
        /// static method
        /// </summary>
        public static void DisplayLast()
        {
            Console.WriteLine(Last);
        }
    }
}
