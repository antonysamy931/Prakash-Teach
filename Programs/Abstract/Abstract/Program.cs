using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Abstract
{
    /// <summary>
    /// *************************************************************************
    /// What is abstract class?
    /// *************************************************************************
    /// Abstract class is base class. An abstract class cannot be instantiated. 
    /// The purpose of an abstract class is to provide a common definition of a 
    /// base class that multiple derived classes can share.
    /// *************************************************************************
    /// Abstract method
    /// *************************************************************************
    /// Abstract methods have no implementation, so the method definition is 
    /// followed by a semicolon instead of a normal method block. 
    /// Derived classes of the abstract class must implement all abstract methods.
    /// </summary>
    class Program
    {
        static void Main(string[] args)
        {
            ///Create object for derivedclass
            DerivedClass derivedObj = new DerivedClass();

            ///method call
            derivedObj.DoSomething();
            derivedObj.WriteSomething();

            Console.Read();
        }
    }

    /// <summary>
    /// Create abstract class using abstract keyword befor class keyword
    /// </summary>
    public abstract class BaseClass
    {
        /// <summary>
        /// create abstract method using keyword abstract before return type.
        /// abstract method doesn't have implementation. 
        /// must override in derived class
        /// </summary>
        public abstract void WriteSomething();

        /// <summary>
        /// virtual method must have implementation
        /// virtual method can override in derived class
        /// </summary>
        public virtual void DoSomething()
        {
            Console.WriteLine("Virtual method in baseclass");
        }        
    }

    public class DerivedClass : BaseClass
    {
        /// <summary>
        /// base class abstract method overrided here.
        /// </summary>
        public override void WriteSomething()
        {
            Console.WriteLine("Abstract method overrided");
        }

        /// <summary>
        /// override base class virtual method
        /// override base class virtual method is optional
        /// directly using base class method using object
        /// </summary>
        public override void DoSomething()
        {
            Console.WriteLine("Virtual method overrided");
            ///this is the way of calling base class method implementation
            ///if don't want base class implementation, delete this line
            base.DoSomething();
        }
    }
}
