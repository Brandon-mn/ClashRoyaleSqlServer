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
    public partial class Nivel : Form
    {
        public Nivel()
        {
            InitializeComponent();
        }
        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM Nivel ORDER BY idNivel");

        }
        private void Nivel_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string numero = textBox1.Text;
            string recompensaRoyale = textBox2.Text;
            string recompensaGratis = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO Nivel (numero, recompensaRoyale, recompensaGratis, estatus) " +
                "values('" + numero + "', '" + recompensaRoyale + "', '" + recompensaGratis + "', '" + estatus + "')";
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
            string numero = textBox1.Text;
            string recompensaRoyale = textBox2.Text;
            string recompensaGratis = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE Nivel SET numero = '" + numero + "',recompensaRoyale = '" + recompensaRoyale + "',recompensaGratis = '" + recompensaGratis +
                "',estatus = '" + estatus + "' WHERE idNivel = " + identificador.ToString();
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
            consulta = "UPDATE Nivel SET Estatus = 0 WHERE idNivel = " + identificador.ToString(); ;
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
