using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Polymorphism
{
    /// <summary>
    /// ************************************************************************
    /// What is polymorphism?
    /// ************************************************************************
    /// Polymorphism is an oops concept. It has two types, 
    /// 1. Compile time polymorphism
    /// 2. Runtime time polymorphism
    /// 
    /// 1. Compile time - Method overloading
    ///     Same method name and different arguments within the class called method overloading.
    /// 2. Run time - Overriding
    ///   Base class and Child class having same method name and argument.
    ///   Child class method can be overrided by using the override keyword
    /// </summary>
    class Program
    {
        static void Main(string[] args)
        {
            
            Abc abc = new Abc();
            Console.WriteLine(abc.Display());
            Console.WriteLine(abc.Display("C#"));

            ChildClass childClass = new ChildClass();
            Console.WriteLine(childClass.Display());
            Console.Read();
        }
    }

    /// <summary>
    /// Method overloading
    /// </summary>
    public class Abc
    {
        /// <summary>
        /// Same method name as second method having no arguments
        /// </summary>
        /// <returns></returns>
        public string Display()
        {
            return "Without parameter";
        }

        /// <summary>
        ///  Same method as first method having one argument
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public string Display(string name)
        {
            return "With parameter";
        }
    }

    /// <summary>
    /// Method overriding
    /// </summary>
    public class BaseClass
    {
        /// <summary>
        /// Base class Display() method
        /// </summary>
        /// <returns></returns>
        public virtual string Display()
        {
            return "Base class method";
        }
    }

    public class ChildClass : BaseClass
    {
        /// <summary>
        /// Child class overriding parent class Display() method
        /// </summary>
        /// <returns></returns>
        public override string Display()
        {            
            return "Child class method";           
        }
    }
}
