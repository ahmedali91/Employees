using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
   public class DataAccess : IDisposable
    {
        UsersEntities usersEntities;
        public DataAccess()
        {
             
        }

        public int AddUser(User user)
        {
            try
            {
                user.ID = new Guid();
                
                using (usersEntities = new UsersEntities())
                {
                    usersEntities.Users.Add(user);
                    usersEntities.SaveChanges();
                }
                return 1;
            }
            catch( Exception e)
            {
                throw e;
            }
           
        }  public int AddEmployee(Employee employee)
        {
            try
            {
                employee.CreatedDate = DateTime.Now;

                
                using (usersEntities = new UsersEntities())
                {
                    usersEntities.Employees.Add(employee);
                    usersEntities.SaveChanges();
                }
                return 1;
            }
            catch( Exception e)
            {
                throw e;
            }
           
        }
        public User GetUser(string userName,string password)
        {
          
            try
            {
                User retUser;


                using (usersEntities = new UsersEntities())
                {
                     retUser = usersEntities.Users.FirstOrDefault(e=>e.UserName.ToLower().Equals(userName.ToLower()) && e.Password.Equals(password));
                    
                }
                return retUser;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public List<Job> GetJobs()
        {
            List<Job> jobs;
            using (usersEntities = new UsersEntities())
            {
                //   usersEntities.Configuration.ProxyCreationEnabled = false;
                jobs = usersEntities.Jobs.ToList();
            }
            return jobs;
        }
        public List<Employee> GetEmployees()
        {
            List<Employee> employees;
            using (usersEntities = new UsersEntities())
            {
                             employees=usersEntities.Employees.Include("Job").ToList();
            }
            return employees;
        }     
        public Employee GetEmployeeBySocialID(string socialId)
        {
           Employee employee;
            using (usersEntities = new UsersEntities())
            {
             
                employee=usersEntities.Employees.FirstOrDefault(e=>e.SocialID.Equals(socialId));
            }
            return employee;
        }
        public Employee DeleteEmployee(int id) {
            Employee employee;
            using (usersEntities = new UsersEntities())
            {

                employee = usersEntities.Employees.Remove(usersEntities.Employees.FirstOrDefault(e => e.EmployeeID == id));
                usersEntities.SaveChanges();
            }
            return employee;
                
        }
        public bool CheckUser(User user)
        {
            try
            {
                bool result = false;
                using (usersEntities = new UsersEntities())
                {
                    var retUser = usersEntities.Users.Find(user);
                    if (retUser != null) result = true;
                }
                return result;
            }
            catch(Exception e)
            {
                throw e;
            }
        }
        public void Dispose()
        {
            usersEntities.Dispose();
        }
    }
}
