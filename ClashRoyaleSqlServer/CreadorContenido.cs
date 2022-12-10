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
    public partial class CreadorContenido : Form
    {
        public CreadorContenido()
        {
            InitializeComponent();
        }
        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM CreadorContenido ORDER BY idCreadorContenido");

        }
        private void CreadorContenido_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string nombre = textBox1.Text;
            string suscriptores = textBox2.Text;
            string codgio = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO CreadorContenido (nombre, suscriptores, codigo, estatus) " +
                "values('" + nombre + "', '" + suscriptores + "', '" + codgio + "', '" + estatus + "')";
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
            string suscriptores = textBox2.Text;
            string codgio = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE CreadorContenido SET nombre = '" + nombre + "',suscriptores = '" + suscriptores + "',codigo = '" + codgio +
                "',estatus = '" + estatus + "' WHERE idCreadorContenido = " + identificador.ToString();
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
            consulta = "UPDATE CreadorContenido SET Estatus = 0 WHERE idCreadorContenido = " + identificador.ToString(); ;
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
