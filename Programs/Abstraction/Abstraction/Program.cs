using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Abstraction
{
    /// <summary>
    /// ***************************************************************************
    /// what is Abstraction?
    /// ***************************************************************************
    /// Abstraction is the process of providing only essential information to the out
    /// side real world and hiding the background details of an object.
    /// ***************************************************************************
    /// </summary>
    class Program
    {
        static void Main(string[] args)
        {
            Abc abc = new Abc();
            string cSharp = abc.DisplayCSharp();
            string fSharp = abc.DisplayFSharp();

            Console.WriteLine(cSharp);
            Console.WriteLine(fSharp);
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
        private string FSharpPrivate()
        {
            return FSharp + " " + DotNet;
        }

        /// <summary>
        /// public method we can access it an outside of the class
        /// </summary>
        /// <returns></returns>
        public string DisplayFSharp()
        {
            ///private method we can access within the class
            return FSharpPrivate();
        }
    }
}
