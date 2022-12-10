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
    public partial class ModoJuego : Form
    {
        public ModoJuego()
        {
            InitializeComponent();
        }
        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM ModoJuego ORDER BY idModoJuego");

        }
        private void ModoJuego_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string nombre = textBox1.Text;
            string dificultad = textBox2.Text;
            string descripcion = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO ModoJuego (nombre, dificultad, descripcion, estatus) " +
                "values('" + nombre + "', '" + dificultad + "', '" + descripcion + "', '" + estatus + "')";
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
            string nombre = textBox1.Text;
            string dificultad = textBox2.Text;
            string descripcion = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE ModoJuego SET nombre = '" + nombre + "',dificultad = '" + dificultad + "',descripcion = '" + descripcion +
                "',estatus = '" + estatus + "' WHERE idModoJuego = " + identificador.ToString();
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
            consulta = "UPDATE ModoJuego SET Estatus = 0 WHERE idModoJuego = " + identificador.ToString(); ;
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
