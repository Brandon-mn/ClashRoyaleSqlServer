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
    public partial class Habiliadad : Form
    {
        public Habiliadad()
        {
            InitializeComponent();
        }
        //aquiq0
        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM Habilidad ORDER BY idHabilidad");

        }
        private void Habiliadad_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string nombre = textBox1.Text;
            string duracion = textBox2.Text;
            string coste = textBox3.Text;
            string recarga = textBox5.Text;
            string descripcion = textBox6.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO Habilidad (nombre, duracion, coste, recarga, descripcion, estatus) " +
                "values('" + nombre + "', '" + duracion + "', '" + coste + "', '" + recarga + "', '" + descripcion + "', '" + estatus + "')";
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
            textBox6.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int identificador = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string nombre = textBox1.Text;
            string duracion = textBox2.Text;
            string coste = textBox3.Text;
            string recarga = textBox5.Text;
            string descripcion = textBox6.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE Habilidad SET nombre = '" + nombre + "',duracion = '" + duracion + "',coste = '" + coste +
                 "',recarga = '" + recarga + "',descripcion = '" + descripcion + "',estatus = '" + estatus + "' WHERE idHabilidad = " + identificador.ToString();
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
            consulta = "UPDATE Habilidad SET Estatus = 0 WHERE idHabilidad = " + identificador.ToString(); ;
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
