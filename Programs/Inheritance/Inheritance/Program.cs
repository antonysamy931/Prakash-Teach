using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Inheritance
{
    /// <summary>
    /// ******************************************************************************
    /// What is Inheritance?
    /// ******************************************************************************
    /// Inheritance is a process of deriving the new class from already existing class    
    /// It allows you to re-use the existing code.
    /// </summary>
   
    class Program
    {
        static void Main(string[] args)
        {
            ///By Creating object for child class, it will be created for parent class also.
            ///So we can access parent class methods using child class object
            ChildClass obj = new ChildClass();
            obj.DisplayMessage();

            Console.Read();
        }
    }

    public class BaseClass
    {
        /// <summary>
        /// Base class contructor
        /// </summary>
        public BaseClass()
        {
            Console.WriteLine("Base class constructor called");
        }

        /// <summary>
        /// Base class function or method
        /// </summary>
        public void DisplayMessage()
        {
            Console.WriteLine("Base class method called");
        }
    }

    /// <summary>
    /// child class inherited from base class using colon(:)
    /// </summary>
    public class ChildClass : BaseClass
    {
        public ChildClass()
        {
            Console.WriteLine("Child class constructor called");
        }
    }
}
