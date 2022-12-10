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
    public partial class Donacion : Form
    {
        public Donacion()
        {
            InitializeComponent();
        }
        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM Donacion ORDER BY idDonacion");

        }
        private void Donacion_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string cantidad = textBox1.Text;
            string calidad = textBox2.Text;
            string codigo = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO Donacion (cantidad, calidad, codigo, estatus) " +
                "values('" + cantidad + "', '" + calidad + "', '" + codigo + "', '" + estatus + "')";
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
            string cantidad = textBox1.Text;
            string calidad = textBox2.Text;
            string codigo = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE Donacion SET cantidad = '" + cantidad + "',calidad = '" + calidad + "',codigo = '" + codigo +
                "',estatus = '" + estatus + "' WHERE idDonacion = " + identificador.ToString();
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
            consulta = "UPDATE Donacion SET Estatus = 0 WHERE idDonacion = " + identificador.ToString(); ;
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
