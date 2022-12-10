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
    public partial class Liga : Form
    {
        public Liga()
        {
            InitializeComponent();
        }
        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM Liga  ORDER BY idLiga");

        }
        private void Liga_Load(object sender, EventArgs e)
        {
            MostrarDatos();

        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string coronas = textBox1.Text;
            string recompensa = textBox2.Text;
            string nombre = textBox3.Text;
            string idArena = textBox5.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO Liga (coronas, recompensa, nombre, idArena, estatus) " +
                "values('" + coronas + "', '" + recompensa + "', '" + nombre + "', '" + idArena + "', '" + estatus + "')";
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
            string coronas = textBox1.Text;
            string recompensa = textBox2.Text;
            string nombre = textBox3.Text;
            string idArena = textBox5.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE Liga SET coronas = '" + coronas + "',recompensa = '" + recompensa + "',nombre = '" + nombre + "',idArena = '" + idArena +
                "',estatus = '" + estatus + "' WHERE idLiga = " + identificador.ToString();
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int identificador = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE Liga SET Estatus = 0 WHERE idLiga = " + identificador.ToString(); ;
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
