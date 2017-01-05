using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TrackingChanges
{
    class Program
    {
        static void Main(string[] args)
        {
            using (var context = new AEPEntities())
            {
                var obj = context.Accents.FirstOrDefault();
                obj.American = "aaa";
                ChangeTracker(context.ChangeTracker, "American", true);
                ChangeTracker(context.ChangeTracker, "American");
                ChangeTracker(context.ChangeTracker);
            }
        }

        private static void ChangeTracker(DbChangeTracker changeTracker)
        {
            foreach (var entry in changeTracker.Entries().Where(x => x.State == EntityState.Modified || x.State == EntityState.Added || x.State == EntityState.Deleted))
            {
                foreach (var property in entry.OriginalValues.PropertyNames)
                {
                    var original = entry.OriginalValues.GetValue<object>(property);
                    var current = entry.CurrentValues.GetValue<object>(property);
                }
            }
        }

        private static void ChangeTracker(DbChangeTracker changeTracker, string propertyName)
        {
            foreach (var entry in changeTracker.Entries().Where(x => x.State == EntityState.Modified || x.State == EntityState.Added || x.State == EntityState.Deleted))
            {
                var original = entry.OriginalValues.GetValue<object>(propertyName);
                var current = entry.CurrentValues.GetValue<object>(propertyName);
            }
        }

        private static void ChangeTracker(DbChangeTracker changeTracker, string propertyName, bool v = false)
        {
            var original = changeTracker.Entries().Select(x => x.OriginalValues.GetValue<object>(propertyName)).FirstOrDefault();
        }

    }
}
