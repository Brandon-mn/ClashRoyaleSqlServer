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
    public partial class CaminoLeyenda : Form
    {
        public CaminoLeyenda()
        {
            InitializeComponent();
        }
        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM CaminoLeyenda ORDER BY idCaminoLeyenda");

        }
        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string trofeos = textBox1.Text;
            string nombre = textBox2.Text;
            string recompensa = textBox3.Text;
            string idArena = textBox5.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO CaminoLeyenda (trofeos, nombre, recompensa, idArena,  estatus) " +
                "values('" + trofeos + "', '" + nombre + "', '" + recompensa + "', '" + idArena + "', '" + estatus + "')";
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
            string trofeos = textBox1.Text;
            string nombre = textBox2.Text;
            string recompensa = textBox3.Text;
            string idArena = textBox5.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE CaminoLeyenda SET trofeos = '" + trofeos + "',nombre = '" + nombre + "',recompensa = '" + recompensa + "',idArena = '" + idArena +
                "',estatus = '" + estatus + "' WHERE idCaminoLeyenda = " + identificador.ToString();
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
            consulta = "UPDATE CaminoLeyenda SET Estatus = 0 WHERE idCaminoLeyenda = " + identificador.ToString(); ;
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form1 abrir = new Form1();
            abrir.Show();
            this.Hide();
        }

        private void CaminoLeyenda_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }
    }
}
