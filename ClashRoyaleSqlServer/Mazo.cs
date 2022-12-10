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
    public partial class Mazo : Form
    {
        public Mazo()
        {
            InitializeComponent();
        }
        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM Mazo ORDER BY idMazo");

        }
        private void Mazo_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string nivel = textBox1.Text;
            string tipo = textBox2.Text;
            string coste = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO Mazo (nivel, tipo, coste, estatus) " +
                "values('" + nivel + "', '" + tipo + "', '" + coste + "', '" + estatus + "')";
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
            string nivel = textBox1.Text;
            string tipo = textBox2.Text;
            string coste = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE Mazo SET nivel = '" + nivel + "',tipo = '" + tipo + "',coste = '" + coste +
                "',estatus = '" + estatus + "' WHERE idMazo = " + identificador.ToString();
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
            consulta = "UPDATE Mazo SET Estatus = 0 WHERE idMazo = " + identificador.ToString(); ;
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
