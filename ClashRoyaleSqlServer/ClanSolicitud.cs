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
    public partial class ClanSolicitud : Form
    {
        public ClanSolicitud()
        {
            InitializeComponent();
        }
        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM ClanSolicitud ORDER BY idClanSolicitud");

        }
        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string duracion = textBox1.Text;
            string idClan = textBox2.Text;
            string idSolicitud = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO ClanSolicitud (fecha, idClan, idSolicitud, estatus) " +
                "values('" + duracion + "', '" + idClan + "', '" + idSolicitud + "', '" + estatus + "')";
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
            string duracion = textBox1.Text;
            string idClan = textBox2.Text;
            string idSolicitud = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE ClanSolicitud SET duracion = '" + duracion + "',idClan = '" + idClan + "',idSolicitud = '" + idSolicitud +
                "',estatus = '" + estatus + "' WHERE idClanSolicitud = " + identificador.ToString();
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
            consulta = "UPDATE ClanSolicitud SET Estatus = 0 WHERE idClanSolicitud = " + identificador.ToString(); ;
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form1 abrir = new Form1();
            abrir.Show();
            this.Hide();
        }

        private void ClanSolicitud_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }
    }
}
