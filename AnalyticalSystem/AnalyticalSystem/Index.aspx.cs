using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AnalyticalSystem
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(DBUtil.ConnectionString))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("SELECT  [examid] ,[mid] ,[sid] ,[noq] ,[nocans] ,[stdate] ,[enddate] FROM [oe_exams]", con);

                
                IDataReader reader = cmd.ExecuteReader();
                Exams = new List<Exam>();

                while (reader.Read())
                {
                    Exams.Add(new Exam
                    {
                        Id = (int) reader["examid"],
                        MId = (int) reader["mid"],
                        SId = (int) reader["sid"],
                        NoQ = (int) reader["noq"],
                        NoCAns = (int) reader["nocans"],
                        Start = (DateTime) reader["stdate"],
                        End = (DateTime) reader["enddate"],
                    });
                }
            }


            using (SqlConnection con = new SqlConnection(DBUtil.ConnectionString))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("SELECT [sid], [sname], [noq] FROM [oe_subjects] ", con);


                IDataReader reader = cmd.ExecuteReader();
                Subjects = new List<Subject>();
                

                while (reader.Read())
                {
                    Subjects.Add(new Subject
                    {
                        Id = (int)reader["sid"],
                        Title = (string)reader["sname"]
                    });
                }

                foreach (Subject subject in Subjects)
                {
                    subject.Sum = Exams.Where(s => s.SId == subject.Id).Sum(s => s.NoCAns);
                }
            }

        }

        public List<Exam> Exams = new List<Exam>();
       public List<Subject> Subjects = new List<Subject>();

        public class Subject
        {
            public string Title { get; set; }
            public int Id { get; set; }
            public int Sum { get; set; }
        }

        public class Exam
        {
            public int Id { get; set; }
            public int MId { get; set; }
            public int SId { get; set; }
            public int NoQ { get; set; }
            public int NoCAns { get; set; }
            public DateTime Start { get; set; }
            public DateTime End { get; set; }
        }
    }
}