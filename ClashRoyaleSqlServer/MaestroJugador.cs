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
    public partial class MaestroJugador : Form
    {
        public MaestroJugador()
        {
            InitializeComponent();
        }
        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM MaestroJugador ORDER BY idMaestroJugador");

        }
        private void MaestroJugador_Load(object sender, EventArgs e)
        {
            MostrarDatos();

        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idMaestro = textBox1.Text;
            string idJugador = textBox2.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO MaestroJugador (idMaestro, idJugador,  estatus) " +
                "values('" + idMaestro + "', '" + idJugador + "', '" + estatus + "')";
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox4.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {

            int identificador = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string idMaestro = textBox1.Text;
            string idJugador = textBox2.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE MaestroJugador SET idMaestro = '" + idMaestro + "',idJugador = '" + idJugador +
                "',estatus = '" + estatus + "' WHERE idMaestroJugador = " + identificador.ToString();
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox4.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int identificador = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE MaestroJugador SET Estatus = 0 WHERE idMaestroJugador = " + identificador.ToString(); ;
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
