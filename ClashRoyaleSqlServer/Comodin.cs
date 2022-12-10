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
    public partial class Comodin : Form
    {
        public Comodin()
        {
            InitializeComponent();
        }
        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM Comodin ORDER BY idComodin");

        }
        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string almacen = textBox1.Text;
            string maximo = textBox2.Text;
            string uso = textBox3.Text;
            string calidad = textBox5.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO Comodin (almacen, maximo, uso,calidad, estatus) " +
                "values('" + almacen + "', '" + maximo + "', '" + uso + "', '" + calidad + "', '" + estatus + "')";
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
            string almacen = textBox1.Text;
            string maximo = textBox2.Text;
            string uso = textBox3.Text;
            string calidad = textBox5.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE Comodin SET almacen = '" + almacen + "',maximo = '" + maximo + "',uso = '" + uso + "',calidad = '" + calidad +
                "',estatus = '" + estatus + "' WHERE idComodin = " + identificador.ToString();
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
            consulta = "UPDATE Comodin SET Estatus = 0 WHERE idComodin = " + identificador.ToString(); ;
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form1 abrir = new Form1();
            abrir.Show();
            this.Hide();
        }

        private void Comodin_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }
    }
}
