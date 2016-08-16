using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Constructor
{
    class Program
    {
        static void Main(string[] args)
        {
            ///Create an object with empty constructor            
            Abc abc = new Abc();
            ///GetName() method return empty value
            string name = abc.GetName();

            ///Create an object with parameterized constructor
            Abc abc1 = new Abc("C#");
            ///GetName() method return "C#" string value
            string name1 = abc1.GetName();

            if (string.IsNullOrEmpty(name))
                Console.WriteLine("Empty value");
            Console.WriteLine(name1);
            Console.Read();
        }
    }

    public class Abc
    {
        /// <summary>
        /// Private variable scope inside the class
        /// </summary>
        private string Name = string.Empty;

        /// <summary>
        /// *********************************************************************************
        /// What is Constructor?
        /// *********************************************************************************
        /// Constructor is a special method, used for instantiating a class(creating an object).
        /// Constructor name will be same as class name.
        /// Constructor does not have any return type and does not return anything.
        /// </summary>
        public Abc()
        { 
        }

        /// <summary>
        /// ********************************************************************************
        /// What is Constructor overloading?
        /// ********************************************************************************
        /// Same constructor name with different argument called constructor overloading
        /// </summary>
        /// <param name="name">string parameter</param>
        public Abc(string name)
        {
            ///Assign value to private string property
            this.Name = name;
        }

        public string GetName()
        {
            return Name;
        }
    }
}
