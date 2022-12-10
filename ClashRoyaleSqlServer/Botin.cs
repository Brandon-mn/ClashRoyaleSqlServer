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
    public partial class Botin : Form
    {
        public Botin()
        {
            InitializeComponent();
        }
        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM Botin ORDER BY idBotin");

        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string oro = textBox1.Text;
            string cartas = textBox2.Text;
            string comodines = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO Botin (oro, cartas, comodines,  estatus) " +
                "values('" + oro + "', '" + cartas + "', '" + comodines + "', '" + estatus + "')";
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
            string oro = textBox1.Text;
            string cartas = textBox2.Text;
            string comodines = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE Botin SET oro = '" + oro + "',cartas = '" + cartas + "',comodines = '" + comodines +
                "',estatus = '" + estatus + "' WHERE idBotin = " + identificador.ToString();
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
            consulta = "UPDATE Botin SET Estatus = 0 WHERE idBotin = " + identificador.ToString(); ;
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form1 abrir = new Form1();
            abrir.Show();
            this.Hide();
        }

        private void Botin_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }
    }
}
