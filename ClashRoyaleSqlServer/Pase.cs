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
    public partial class Pase : Form
    {
        public Pase()
        {
            InitializeComponent();
        }
        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM Pase ORDER BY idPase");

        }
        private void Pase_Load(object sender, EventArgs e)
        {
            MostrarDatos();

        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string nombre = textBox1.Text;
            string temporada = textBox2.Text;
            string tematica = textBox3.Text;
            string idAspecto = textBox5.Text;
            string idReaccion = textBox6.Text;
            string idNivel = textBox7.Text;
            string estatus = textBox4.Text;

            consulta = "INSERT INTO Pase (nombre, temporada, tematica, idAspecto, idReaccion, idNivel, estatus) " +
                "values('" + nombre + "', '" + temporada + "', '" + tematica + "', '" + idAspecto + "', '" + idReaccion + "', '" + idNivel + "', '" + estatus + "')";
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
            string temporada = textBox2.Text;
            string tematica = textBox3.Text;
            string idAspecto = textBox5.Text;
            string idReaccion = textBox6.Text;
            string idNivel = textBox7.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE Pase SET nombre = '" + nombre + "',temporada = '" + temporada + "',tematica = '" + tematica +
                 "',idAspecto = '" + idAspecto + "',idReaccion = '" + idReaccion + "',idNivel = '" + idNivel + "',estatus = '" + estatus + "' WHERE idPase = " + identificador.ToString();
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
            consulta = "UPDATE Pase SET Estatus = 0 WHERE idPase = " + identificador.ToString(); ;
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
