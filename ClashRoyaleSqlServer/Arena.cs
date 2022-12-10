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
    public partial class Arena : Form
    {
        public Arena()
        {
            InitializeComponent();
            MostrarDatos();
        }
        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM Arena ORDER BY idArena");

        }
        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string tematica = textBox1.Text;
            string numero = textBox2.Text;
            string nombre = textBox3.Text;
            string rango = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO Arena (tematica, numero, nombre, rango,  estatus) " +
                "values('" + tematica + "', '" + numero + "', '" + nombre + "', '" + rango + "', '" + estatus + "')";
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
            string tematica = textBox1.Text;
            string numero = textBox2.Text;
            string nombre = textBox3.Text;
            string rango = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE Arena SET tematica = '" + tematica + "',numero = '" + numero + "',nombre = '" + nombre + "',rango = '" + rango +
                "',estatus = '" + estatus + "' WHERE idArena = " + identificador.ToString();
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
            consulta = "UPDATE Arena SET Estatus = 0 WHERE idArena = " + identificador.ToString(); ;
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form1 abrir = new Form1();
            abrir.Show();
            this.Hide();
        }

        private void Arena_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }
    }
}
