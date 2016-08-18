using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Interface
{
    /// <summary>
    /// *************************************************************
    /// What is interface?
    /// *************************************************************
    /// Interface is fully abstraction. It contains only method
    /// declaration and properties. Doesn't have method implementation.    
    /// Interface support multiple inheritance
    /// </summary>
    class Program
    {
        static void Main(string[] args)
        {
            DoWork work = new DoWork();
            work.Display();
            Console.Read();
        }
    }

    /// <summary>
    /// Create interface using keywork interface before interface-name
    /// </summary>
    interface IDoWork
    {
        /// <summary>
        /// declare method without access modifier
        /// because interface always public
        /// </summary>
        void Display();
    }

    /// <summary>
    /// inherite interface 
    /// interface methods must be implemented in derived class otherwise throws exception
    /// </summary>
    public class DoWork : IDoWork
    {
        /// <summary>
        /// Implemented interface method
        /// </summary>
        public void Display()
        {
            Console.WriteLine("Interface method implemented in inherited class");            
        }
    }
}
