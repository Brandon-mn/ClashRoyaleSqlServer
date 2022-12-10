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
    public partial class Tropa : Form
    {
        public Tropa()
        {
            InitializeComponent();
        }
        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM Tropa ORDER BY idTropa");

        }
        private void Tropa_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {

            string nombre = textBox1.Text;
            string vida = textBox2.Text;
            string velocidad = textBox3.Text;
            string daño = textBox5.Text;//me quiero morir alv AHHHHHH OJALA ME DE CANCER 
            string alcance = textBox6.Text;
            string objetivo = textBox9.Text;
            string coste = textBox8.Text;
            string idCarta = textBox7.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO Tropa (nombre, vida, velocidad, daño, alcance, objetivo, coste, idCarta, estatus) " +
                "values('" + nombre + "', '" + vida + "', '" + velocidad + "', '" + daño + "', '" + alcance + "', '" + objetivo + "', '"
                + coste + "', '" + idCarta + "', '" + estatus + "')";
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
            string daño = textBox5.Text;//me quiero morir alv AHHHHHH OJALA ME DE CANCER 
            string alcance = textBox6.Text;
            string objetivo = textBox9.Text;
            string coste = textBox8.Text;
            string idCarta = textBox7.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE Tropa SET nombre = '" + nombre + "',vida = '" + vida + "',velocidad = '" + velocidad + "',daño = '" + daño + "',alcance = '" + alcance +
                "',objetivo = '" + objetivo + "',coste = '" + coste + "',idCarta = '" + idCarta + "',estatus = '" + estatus + "' WHERE idTropa = " + identificador.ToString();
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
            consulta = "UPDATE Tropa SET Estatus = 0 WHERE idTropa = " + identificador.ToString(); ;
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
