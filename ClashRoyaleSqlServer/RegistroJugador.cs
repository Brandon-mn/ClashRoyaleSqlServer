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
    public partial class RegistroJugador : Form
    {
        public RegistroJugador()
        {
            InitializeComponent();
        }
        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM RegistroJugador ORDER BY idRegistroJugador");

        }
        private void RegistroJugador_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string ganador = textBox1.Text;
            string fecha = textBox2.Text;
            string idRegistro = textBox3.Text;
            string idJugador = textBox5.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO RegistroJugador (ganador, fecha, idRegistro, idJugador, estatus) " +
                "values('" + ganador + "', '" + fecha + "', '" + idRegistro + "', '" + idJugador + "', '" + estatus + "')";
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
            string ganador = textBox1.Text;
            string fecha = textBox2.Text;
            string idRegistro = textBox3.Text;
            string idJugador = textBox5.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE RegistroJugador SET ganador = '" + ganador + "',fecha = '" + fecha + "',idRegistro = '" + idRegistro + "',idJugador = '" + idJugador +
                "',estatus = '" + estatus + "' WHERE idRegistroJugador = " + identificador.ToString();
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
            consulta = "UPDATE RegistroJugador SET Estatus = 0 WHERE idRegistroJugador = " + identificador.ToString(); ;
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
