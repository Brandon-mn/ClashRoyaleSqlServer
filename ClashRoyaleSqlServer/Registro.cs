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
    public partial class Registro : Form
    {
        public Registro()
        {
            InitializeComponent();
        }
        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM Registro ORDER BY idRegistro");

        }
        private void btnAgregar_Click(object sender, EventArgs e)
        {

            string modalidad = textBox1.Text;
            string duracion = textBox2.Text;
            string idArena = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO Registro (modalidad, duracion, idArena, estatus) " +
                "values('" + modalidad + "', '" + duracion + "', '" + idArena + "', '" + estatus + "')";
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
        }

        private void Registro_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int identificador = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string modalidad = textBox1.Text;
            string duracion = textBox2.Text;
            string idArena = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE Registro SET modalidad = '" + modalidad + "',duracion = '" + duracion + "',idArena = '" + idArena +
                "',estatus = '" + estatus + "' WHERE idRegistro = " + identificador.ToString();
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
            consulta = "UPDATE Registro SET Estatus = 0 WHERE idRegistro = " + identificador.ToString(); ;
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
