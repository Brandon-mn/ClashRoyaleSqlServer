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
    public partial class SuperrcellCreadoContenido : Form
    {
        public SuperrcellCreadoContenido()
        {
            InitializeComponent();
        }
        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM SupercellCreadoConrtenido ORDER BY idSupercellCreadoConrtenido");

        }

        private void SuperrcellCreadoContenido_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idSupercell = textBox1.Text;
            string idCreadorContenido = textBox2.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO SupercellCreadoConrtenido (idSupercell, idCreadorContenido,  estatus) " +
                "values('" + idSupercell + "', '" + idCreadorContenido + "', '" + estatus + "')";
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox4.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int identificador = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string idSupercell = textBox1.Text;
            string idCreadorContenido = textBox2.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE SupercellCreadoConrtenido SET idSupercell = '" + idSupercell + "',idCreadorContenido = '" + idCreadorContenido +
                "',estatus = '" + estatus + "' WHERE idSupercellCreadoConrtenido = " + identificador.ToString();
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
            consulta = "UPDATE SupercellCreadoConrtenido SET Estatus = 0 WHERE idSupercellCreadoConrtenido= " + identificador.ToString(); ;
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
