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
    public partial class Maestria : Form
    {
        public Maestria()
        {
            InitializeComponent();
        }
        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM Maestria ORDER BY idMaestria");

        }
        private void Maestria_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string nombre = textBox1.Text;
            string dificultad = textBox2.Text;
            string calidad = textBox3.Text;
            string experiencia = textBox5.Text;//me quiero morir alv AHHHHHH OJALA ME DE CANCER 
            string definicion = textBox6.Text;
            string recompensa = textBox7.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO Maestria (nombre, dificultad, calidad, experiencia, definicion,  recompensa, estatus) " +
                "values('" + nombre + "', '" + dificultad + "', '" + calidad + "', '" + experiencia + "', '" + definicion + "', '" + recompensa + "', '" + estatus + "')";
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();


            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox6.Clear();
            textBox7.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int identificador = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string nombre = textBox1.Text;
            string dificultad = textBox2.Text;
            string calidad = textBox3.Text;
            string experiencia = textBox5.Text;//me quiero morir alv AHHHHHH OJALA ME DE CANCER 
            string definicion = textBox6.Text;
            string recompensa = textBox7.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE Maestria SET nombre = '" + nombre + "',dificultad = '" + dificultad + "',calidad = '" + calidad + "',experiencia = '" + experiencia +
                "',definicion = '" + definicion +"',recompensa = '" + recompensa + "',estatus = '" + estatus + "' WHERE idMaestria = " + identificador.ToString();
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();

            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox6.Clear();
            textBox7.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int identificador = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE Maestria SET Estatus = 0 WHERE idMaestria = " + identificador.ToString(); ;
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
