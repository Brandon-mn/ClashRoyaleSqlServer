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
    public partial class Torneo : Form
    {
        public Torneo()
        {
            InitializeComponent();
        }
        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM Torneo  ORDER BY idTorneo ");

        }
        private void Torneo_Load(object sender, EventArgs e)
        {
            MostrarDatos();

        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {

            string nombre = textBox1.Text;
            string duracion = textBox2.Text;
            string capacidad = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO Torneo  (nombre, duracion, capacidad, estatus) " +
                "values('" + nombre + "', '" + duracion + "', '" + capacidad + "', '" + estatus + "')";
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
            string duracion = textBox2.Text;
            string capacidad = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE Torneo  SET nombre = '" + nombre + "',duracion = '" + duracion + "',capacidad = '" + capacidad +
                "',estatus = '" + estatus + "' WHERE idTorneo  = " + identificador.ToString();
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
            consulta = "UPDATE Torneo  SET Estatus = 0 WHERE idTorneo  = " + identificador.ToString(); ;
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
