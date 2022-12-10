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
    public partial class Formulario : Form
    {
        public Formulario()
        {
            InitializeComponent();
        }
        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM Clasificacionn  ORDER BY idClasificacion");

        }
        private void Formulario_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string medallas = textBox1.Text;
            string puesto = textBox2.Text;
            string reproducciones = textBox3.Text;
            string idJugador = textBox5.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO Clasificacionn (medallas, puesto, reproducciones, idJugador, estatus) " +
                "values('" + medallas + "', '" + puesto + "', '" + reproducciones + "', '" + idJugador + "', '" + estatus + "')";
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
            string medallas = textBox1.Text;
            string puesto = textBox2.Text;
            string reproducciones = textBox3.Text;
            string idJugador = textBox5.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE Clasificacionn SET duracion = '" + medallas + "',medallas = '" + puesto + "',puesto = '" + reproducciones + "',idJugador = '" + idJugador +
                "',estatus = '" + estatus + "' WHERE idClasificacion = " + identificador.ToString();
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
            consulta = "UPDATE Clasificacionn SET Estatus = 0 WHERE idClasificacion = " + identificador.ToString(); ;
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
