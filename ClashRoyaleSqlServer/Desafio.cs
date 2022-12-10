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
    public partial class Desafio : Form
    {
        public Desafio()
        {
            InitializeComponent();
        }
        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM Desafio ORDER BY idDesafio");

        }
        private void Desafio_Load(object sender, EventArgs e)
        {
            MostrarDatos();

        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string duracion = textBox1.Text;
            string victorias = textBox2.Text;
            string nombre = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO Desafio (duracion, victorias, nombre, estatus) " +
                "values('" + duracion + "', '" + victorias + "', '" + nombre + "', '" + estatus + "')";
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
            string duracion = textBox1.Text;
            string victorias = textBox2.Text;
            string nombre = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE Desafio SET duracion = '" + duracion + "',victorias = '" + victorias + "',nombre = '" + nombre +
                "',estatus = '" + estatus + "' WHERE idDesafio = " + identificador.ToString();
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
            consulta = "UPDATE Desafio SET Estatus = 0 WHERE idDesafio = " + identificador.ToString(); ;
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
