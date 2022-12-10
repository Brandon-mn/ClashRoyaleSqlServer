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
    public partial class Aspecto : Form
    {
        public Aspecto()
        {
            InitializeComponent();
        }
        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM Aspecto ORDER BY idAspecto");

        }
        private void btnAgregar_Click(object sender, EventArgs e)
        {

            string nombre = textBox1.Text;
            string ruta = textBox2.Text;
            string temporada = textBox3.Text;
            string calidad = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO Aspecto (nombre, ruta, temporada, calidad,  estatus) " +
                "values('" + nombre + "', '" + ruta + "', '" + temporada + "', '" + calidad + "', '" + estatus + "')";
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
            string nombre = textBox1.Text;
            string ruta = textBox2.Text;
            string temporada = textBox3.Text;
            string calidad = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE Aspecto SET nombre = '" + nombre + "',ruta = '" + ruta + "',temporada = '" + temporada + "',calidad = '" + calidad +
                "',estatus = '" + estatus + "' WHERE idAspecto = " + identificador.ToString();
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();


            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int identificador = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE Aspecto SET Estatus = 0 WHERE idAspecto = " + identificador.ToString(); ;
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {

            Form1 abrir = new Form1();
            abrir.Show();
            this.Hide();
        }

        private void Aspecto_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }
    }
}
