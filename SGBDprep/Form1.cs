using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SGBDprep
{
    public partial class Form1 : Form
    {
        public DataSet data;
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            String connString = "Server=localhost;Database=sgbd;user=sa;password=6YECntP6GX7J$!";
            SqlConnection conn = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand("SELECT * FROM test.brokerages", conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            data = new DataSet();
            conn.Open();
            da.Fill(data, "Brokerages");
            conn.Close();
            dgvBrokerages.DataSource = data;
            dgvBrokerages.DataMember = "Brokerages";
        }

        private void button1_Click(object sender, EventArgs e)
        {
            throw new System.NotImplementedException();
        }

    }
}
