using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ClashRoyaleSqlServer
{
    public partial class Guerra : Form
    {
        public Guerra()
        {
            InitializeComponent();
        }
        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM Guerra ORDER BY idGuerra");

        }
        private void Guerra_Load(object sender, EventArgs e)
        {
            MostrarDatos();

        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string trofeos = textBox1.Text;
            string puesto = textBox2.Text;
            string ataques = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO Guerra (trofeos, puesto, ataques, estatus) " +
                "values('" + trofeos + "', '" + puesto + "', '" + ataques + "', '" + estatus + "')";
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int identificador = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string trofeos = textBox1.Text;
            string puesto = textBox2.Text;
            string ataques = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE Guerra SET trofeos = '" + trofeos + "',puesto = '" + puesto + "',ataques = '" + ataques +
                "',estatus = '" + estatus + "' WHERE idGuerra = " + identificador.ToString();
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();


            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int identificador = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE Guerra SET Estatus = 0 WHERE idGuerra = " + identificador.ToString(); ;
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form1 abrir = new Form1();
            abrir.Show();
            this.Hide();
        }
    }
}
