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
    public partial class Mercader : Form
    {
        public Mercader()
        {
            InitializeComponent();
        }
        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM Mercader ORDER BY idMercader");

        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string ficha = textBox1.Text;
            string opcion = textBox2.Text;
            string tipo = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO Mercader (ficha, opcion, tipo, estatus) " +
                "values('" + ficha + "', '" + opcion + "', '" + tipo + "', '" + estatus + "')";
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
            string ficha = textBox1.Text;
            string opcion = textBox2.Text;
            string tipo = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE Mercader SET ficha = '" + ficha + "',opcion = '" + opcion + "',tipo = '" + tipo +
                "',estatus = '" + estatus + "' WHERE idMercader = " + identificador.ToString();
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
            consulta = "UPDATE Mercader SET Estatus = 0 WHERE idMercader = " + identificador.ToString(); ;
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form1 abrir = new Form1();
            abrir.Show();
            this.Hide();

        }

        private void Mercader_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }
    }
}
