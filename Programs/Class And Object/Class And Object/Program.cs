using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

//Name space used to organize classes and interfaces under single name.
namespace Class_And_Object
{
    class Program
    {
        static void Main(string[] args)
        {
            ///What is Object?
            ///******************************************************************
            ///Object is an real time entity which contains property and methods.
            ///******************************************************************
            ///Create an object using new keyword.
            ///abc - is an object which contains property and methods
            Abc abc = new Abc();

            ///Assigning string value to class property
            ///abc.Name - object.PropertyName
            abc.Name = "OOPS";

            ///Accessing method from object
            ///abc.GetName() - object.methodname()
            var Name = abc.GetName();

            ///Accessing method from object
            ///Pass value to method
            ///abc.GetFullName("C#", ".Net") - object.methodname(parametervalue1, parametervalue2)
            var FullName = abc.GetFullName("C#", ".Net");

            Console.WriteLine(Name);
            Console.WriteLine(FullName);
            Console.Read();
        }
    }

    /// <summary>
    /// What is Class?
    /// **************************************************
    /// Class is a collection of objects.
    /// Blue print of an object. Template of an object.
    /// It contains attibutes and actions.
    /// **************************************************
    /// </summary>
    /// pubic - Access modifier (There are 4 type of access modifier available 1. private , 2. public, 3. protected, 4. Internal, 5. protected internal
    /// class - keyword(used to create a class)
    /// Abc - class name
    public class Abc
    {
        /// <summary>
        /// Property or attibute
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// Actions or method which perform some operation
        /// </summary>
        /// <returns>string value</returns>
        /// public - Access modifier
        /// string - Return type
        /// GetName() - Method Name
        public string GetName()
        {
            return Name;
        }

        /// <summary>
        /// Create an action method with parameter
        /// </summary>
        /// <param name="firstName">firstName is a string prameter</param>
        /// <param name="lastName">lastName is a string parameter</param>
        /// <returns>This method returns string value</returns>
        public string GetFullName(string firstName, string lastName)
        {
            //Concat two string with space
            return firstName + " " + lastName;
        }
    }
}
