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
    public partial class JugadorTvRoyale : Form
    {
        public JugadorTvRoyale()
        {
            InitializeComponent();
        }
        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM JugadorTvroyale ORDER BY idJugadorTvroyale");

        }
        private void JugadorTvRoyale_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idJugador = textBox1.Text;
            string idTvroyale = textBox2.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO JugadorTvroyale (idJugador, idTvroyale,  estatus) " +
                "values('" + idJugador + "', '" + idTvroyale + "', '" + estatus + "')";
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox4.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int identificador = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string idJugador = textBox1.Text;
            string idTvroyale = textBox2.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE JugadorTvroyale SET idJugador = '" + idJugador + "',idTvroyale = '" + idTvroyale +
                "',estatus = '" + estatus + "' WHERE idJugadorTvroyale = " + identificador.ToString();
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
            consulta = "UPDATE JugadorTvroyale SET Estatus = 0 WHERE idJugadorTvroyale = " + identificador.ToString(); ;
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
