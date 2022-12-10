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
    public partial class JugadorCofre : Form
    {
        public JugadorCofre()
        {
            InitializeComponent();
        }
        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM JugadorCofre ORDER BY idJugadorCofre");

        }
        private void JugadorCofre_Load(object sender, EventArgs e)
        {
            MostrarDatos();

        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {

            string idJugador = textBox1.Text;
            string idCofre = textBox2.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO JugadorCofre (idJugador, idCofre, estatus) " +
                "values('" + idJugador + "', '" + idCofre + "', '" + estatus + "')";
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
            string idCofre = textBox2.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE JugadorCofre SET idJugador = '" + idJugador + "',idCofre = '" + idCofre +
                "',estatus = '" + estatus + "' WHERE idJugadorCofre = " + identificador.ToString();
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
            consulta = "UPDATE JugadorCofre SET Estatus = 0 WHERE idJugadorCofre = " + identificador.ToString(); ;
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
