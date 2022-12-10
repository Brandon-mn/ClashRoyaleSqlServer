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
    public partial class Tvroyale : Form
    {
        public Tvroyale()
        {
            InitializeComponent();
        }
        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM Tvroyale ORDER BY idTvroyale");

        }
        private void Tvroyale_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string jugador1 = textBox1.Text;
            string jugador2 = textBox2.Text;
            string reproducciones = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO Tvroyale (jugador1, jugador2, reproducciones, estatus) " +
                "values('" + jugador1 + "', '" + jugador2 + "', '" + reproducciones + "', '" + estatus + "')";
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
            string jugador1 = textBox1.Text;
            string jugador2 = textBox2.Text;
            string reproducciones = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE Tvroyale SET jugador1 = '" + jugador1 + "',jugador2 = '" + jugador2 + "',reproducciones = '" + reproducciones +
                "',estatus = '" + estatus + "' WHERE idTvroyale = " + identificador.ToString();
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
            consulta = "UPDATE Tvroyale SET Estatus = 0 WHERE idTvroyale = " + identificador.ToString(); ;
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
