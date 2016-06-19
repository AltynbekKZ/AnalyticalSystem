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
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(DBUtil.ConnectionString))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("select COUNT(*) from oe_members", con);
                int membersCount = (Int32)cmd.ExecuteScalar();
                ltmembersCount.Text = membersCount.ToString();

                cmd.CommandText =
                    "select (select count(*) from oe_members where dlv > DATEADD(DAY,-3,GETDATE()))*100 /  (select COUNT(*) from oe_members)";
                int usagePersent = (int) cmd.ExecuteScalar();
                ltUsagePersent.Text = usagePersent.ToString()+ "%";

                cmd.CommandText = "select COUNT(*) from oe_subjects";
                ltSubjectCount.Text = ((int)cmd.ExecuteScalar()).ToString();

                cmd.CommandText = "select * from oe_ent_result";
                EntResults = new List<EntResult>();
                 IDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    EntResults.Add(new EntResult
                    {
                        Kaz = (int) reader["kaz"],
                        Class = (int) reader["class"],
                        History = (int) reader["History"],
                        Math = (int) reader["math"],
                        Rus = (int) reader["rus"],
                        Selected = (int) reader["selected"],
                        PassDate = (DateTime) reader["PassDate"]
                    });
                }

                EntResults = EntResults.OrderBy(s => s.PassDate).ToList();

                if (!string.IsNullOrEmpty(tbBegin.Text) && !string.IsNullOrEmpty(tbEnd.Text))
                {
                    DateTime begin = Convert.ToDateTime(tbBegin.Text);
                    DateTime end = Convert.ToDateTime(tbEnd.Text);
                    EntResults = EntResults.Where(s => begin <= s.PassDate && s.PassDate <= end).ToList();
                }
            }
        }


        public List<EntResult> EntResults = new List<EntResult>();
        public  int GetSumAll
        {
            get
            {
                var i = EntResults.Sum(s => s.Kaz) + EntResults.Sum(s => s.Rus) + EntResults.Sum(s => s.History) + EntResults.Sum(s => s.Math) + EntResults.Sum(s => s.Selected);
                return i;
            }
        }
    }

    

    public class EntResult
    {
        public int Kaz { get; set; }
        public int Rus { get; set; }
        public int Math { get; set; }
        public int History { get; set; }
        public int Selected { get; set; }
        public int Class { get; set; }

        public DateTime PassDate { get; set; }

        public int GetSum
        {
            get { return Kaz + Rus + Math + History + Selected; }
        }


        

    }
}