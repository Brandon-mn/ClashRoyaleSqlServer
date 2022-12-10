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
    public partial class Intercambio : Form
    {
        public Intercambio()
        {
            InitializeComponent();
        }
        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM Intrercambio ORDER BY idIntercambio"); 

        }
        private void Intercambio_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string calidad = textBox1.Text;
            string fecha = textBox2.Text;
            string cantidad = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO Intrercambio (calidad, fecha, cantidad, estatus) " +
                "values('" + calidad + "', '" + fecha + "', '" + cantidad + "', '" + estatus + "')";
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
            string calidad = textBox1.Text;
            string fecha = textBox2.Text;
            string cantidad = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE Intrercambio SET calidad = '" + calidad + "',fecha = '" + fecha + "',cantidad = '" + cantidad +
                "',estatus = '" + estatus + "' WHERE idIntercambio = " + identificador.ToString();
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
            consulta = "UPDATE Intrercambio SET Estatus = 0 WHERE idIntercambio = " + identificador.ToString(); ;
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
