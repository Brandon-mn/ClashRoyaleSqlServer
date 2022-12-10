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
    public partial class Adorno : Form
    {
        public Adorno()
        {
            InitializeComponent();

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form1 abrir = new Form1();
            abrir.Show();
            this.Hide();

        }
        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM Adorno ORDER BY idAdorno");

        }
        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string nombre = textBox1.Text;
            string calidad = textBox2.Text;
            string tematica = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO Adorno (nombre, tematica, calidad, estatus) " +
                "values('" + nombre + "', '" + tematica + "', '" + calidad + "', '" + estatus  + "')";
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();


            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
   
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idAdorno = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string nombre = textBox1.Text;
            string calidad = textBox2.Text;
            string tematica = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE Adorno SET nombre = '" + nombre + "',tematica = '" + tematica + "',calidad = '" + calidad +
                "',estatus = '" + estatus + "' WHERE idAdorno = " + idAdorno.ToString();
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();


            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
        }

        private void Adorno_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idAdorno = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE Adorno SET Estatus = 0 WHERE idAdorno = " + idAdorno.ToString(); ;
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();
        }
    }
}
