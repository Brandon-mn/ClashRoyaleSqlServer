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
    public partial class Campeon : Form
    {
        public Campeon()
        {
            InitializeComponent();
        }

        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM Campeon ORDER BY idCampeon");

        }
        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string nombre = textBox1.Text;
            string vida = textBox2.Text;
            string velocidad = textBox3.Text;
            string alcance = textBox5.Text;//me quiero morir alv AHHHHHH OJALA ME DE CANCER 
            string daño = textBox6.Text;
            string coste = textBox9.Text;
            string idCarta = textBox8.Text;
            string idHabilidad = textBox7.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO Campeon (nombre, vida, velocidad, alcance, daño, coste, idCarta, idHabilidad, estatus) " +
                "values('" + nombre + "', '" + vida + "', '" + velocidad + "', '" + alcance + "', '" + daño + "', '"+ coste + "', '"
                + idCarta + "', '" + idHabilidad + "', '" + estatus + "')";
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();


            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox6.Clear();
            textBox7.Clear();
            textBox8.Clear();
            textBox8.Clear();
            textBox9.Clear();

        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int identificador = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string nombre = textBox1.Text;
            string vida = textBox2.Text;
            string velocidad = textBox3.Text;
            string alcance = textBox5.Text;
            string daño = textBox6.Text;
            string coste = textBox9.Text;
            string idCarta = textBox8.Text;
            string idHabilidad = textBox7.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE Campeon SET nombre = '" + nombre + "',vida = '" + vida + "',velocidad = '" + velocidad + "',alcance = '" + alcance + "',daño = '" + daño +
                "',coste = '" + coste + "',idCarta = '" + idCarta + "',idHabilidad = '" + idHabilidad + "',estatus = '" + estatus + "' WHERE idCampeon = " + identificador.ToString();
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox6.Clear();
            textBox7.Clear();
            textBox8.Clear();
            textBox8.Clear();
            textBox9.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int identificador = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE Campeon SET Estatus = 0 WHERE idCampeon = " + identificador.ToString(); ;
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {

            Form1 abrir = new Form1();
            abrir.Show();
            this.Hide();
        }

        private void Campeon_Load(object sender, EventArgs e)
        {
           
                MostrarDatos();
           
        }
    }
}
