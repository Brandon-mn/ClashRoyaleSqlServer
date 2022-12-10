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
    public partial class Echizo : Form
    {
        public Echizo()
        {
            InitializeComponent();
        }
        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM Echizo ORDER BY idEchizo");

        }
        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string nombre = textBox1.Text;
            string dañoTorres = textBox2.Text;
            string ancho= textBox3.Text;
            string alcance = textBox5.Text;//me quiero morir alv AHHHHHH OJALA ME DE CANCER 
            string coste = textBox6.Text;
            string idCarta = textBox7.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO Echizo (nombre, dañoTorres, ancho, alcance, coste,  idCarta, estatus) " +
                "values('" + nombre + "', '" + dañoTorres + "', '" + ancho + "', '" + alcance + "', '" + coste + "', '" +  idCarta +"', '" +estatus + "')";
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();


            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox6.Clear();
            textBox7.Clear();

        }

        private void Echizo_Load(object sender, EventArgs e)
        {
            MostrarDatos();

        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int identificador = (int)dataGridView1.SelectedRows[0].Cells[0].Value;

            string nombre = textBox1.Text;
            string dañoTorres = textBox2.Text;
            string ancho = textBox3.Text;
            string alcance = textBox5.Text;//me quiero morir alv AHHHHHH OJALA ME DE CANCER 
            string coste = textBox6.Text;
            string idCarta = textBox7.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE Echizo SET nombre = '" + nombre + "',dañoTorres = '" + dañoTorres + "',ancho = '" + ancho + "',alcance = '" + alcance + "',coste = '" + coste 
             + "',idCarta = '" + idCarta  + "',estatus = '" + estatus + "' WHERE idEchizo = " + identificador.ToString();
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
            consulta = "UPDATE Echizo SET Estatus = 0 WHERE idEchizo = " + identificador.ToString(); ;
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
