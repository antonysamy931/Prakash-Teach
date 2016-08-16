using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Encapsulation
{
    /// <summary>
    /// *********************************************************************
    /// What is Encapsulation?
    /// *********************************************************************
    /// Encapsulation is a process of binding the data members and member functions
    /// into a single unit.
    /// </summary>
    
    class Program
    {
        static void Main(string[] args)
        {
            ///while create an object all method and properties are grouped into single unit(abc object).
            ///We can access only public property and methods
            ///We can't access private property and methods
            Abc abc = new Abc();
            
            var cSharp = abc.DisplayCSharp();

            //var fSharp = abc.DisplayFSharp(); ///Not able to access this method, because it has private access modifier

            Console.WriteLine(cSharp);
            Console.Read();
        }
    }

    public class Abc
    {
        /// <summary>
        /// Public properties we can access it an outside of the class
        /// </summary>
        public string CSharp = "C#";
        public string DotNet = ".Net";

        /// <summary>
        /// Private properties we can access it within the class
        /// </summary>
        private string FSharp = "F#";

        /// <summary>
        /// public method we can access it an outside of the class
        /// </summary>
        /// <returns>string value</returns>
        public string DisplayCSharp()
        {
            return CSharp + " " + DotNet;
        }

        /// <summary>
        /// Private method we can access it within the class
        /// </summary>
        /// <returns>string value</returns>
        private string DisplayFSharp()
        {
            return FSharp + " " + DotNet;
        }
    }
}
