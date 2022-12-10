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
    public partial class Estadistica : Form
    {
        public Estadistica()
        {
            InitializeComponent();
        }
        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM Estadistica ORDER BY idEstadistica");

        }
        private void Estadistica_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string victorias = textBox1.Text;
            string tresCoronas = textBox2.Text;
            string donaciones = textBox3.Text;
            string coleccion = textBox5.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO Estadistica (victorias, tresCoronas, donaciones, coleccion, estatus) " +
                "values('" + victorias + "', '" + tresCoronas + "', '" + donaciones + "', '" + coleccion + "', '" + estatus + "')";
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();

        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int identificador = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string victorias = textBox1.Text;
            string tresCoronas = textBox2.Text;
            string donaciones = textBox3.Text;
            string coleccion = textBox5.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE Estadistica SET victorias = '" + victorias + "',tresCoronas = '" + tresCoronas + "',donaciones = '" + donaciones + "',coleccion = '" + coleccion +
                "',estatus = '" + estatus + "' WHERE idEstadistica = " + identificador.ToString();
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
            consulta = "UPDATE Estadistica SET Estatus = 0 WHERE idEstadistica = " + identificador.ToString(); ;
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
