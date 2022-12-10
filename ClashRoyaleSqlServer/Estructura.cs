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
    public partial class Estructura : Form
    {
        public Estructura()
        {
            InitializeComponent();
        }
        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM Estructura ORDER BY idEstructura");

        }
        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string nombre = textBox1.Text;
            string vida = textBox2.Text;
            string velocidad = textBox3.Text;
            string alcance = textBox5.Text;//me quiero morir alv AHHHHHH OJALA ME DE CANCER 
            string objetivo = textBox6.Text;
            string coste = textBox6.Text;
            string idCarta = textBox7.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO Estructura (nombre, vida, velocidad, alcance, objetivo,  coste, idCarta, estatus) " +
                "values('" + nombre + "', '" + vida + "', '" + velocidad + "', '" + alcance + "', '" + objetivo + "', '" + coste + "', '" + idCarta + "', '" + estatus + "')";
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
            string vida = textBox2.Text;
            string velocidad = textBox3.Text;
            string alcance = textBox5.Text;//me quiero morir alv AHHHHHH OJALA ME DE CANCER 
            string objetivo = textBox6.Text;
            string coste = textBox6.Text;
            string idCarta = textBox7.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE Estructura SET nombre = '" + nombre + "',vida = '" + vida + "',velocidad = '" + velocidad + "',alcance = '" + alcance + "',objetivo = '" + objetivo 
              + "',coste = '" + coste + "',idCarta = '"+ idCarta +"',estatus = '" + estatus + "' WHERE idEstructura = " + identificador.ToString();
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
            consulta = "UPDATE Estructura SET Estatus = 0 WHERE idEstructura = " + identificador.ToString(); ;
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form1 abrir = new Form1();
            abrir.Show();
            this.Hide();
        }

        private void Estructura_Load(object sender, EventArgs e)
        {
            MostrarDatos();

        }
    }
}
