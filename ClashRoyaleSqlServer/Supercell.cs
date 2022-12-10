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
    public partial class Supercell : Form
    {
        public Supercell()
        {
            InitializeComponent();
        }
        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM Supercell  ORDER BY idSupercell");

        }
        private void Supercell_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string correo = textBox1.Text;
            string codigo = textBox2.Text;
            string juegos = textBox3.Text;
            //string idJugador = textBox5.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO Supercell (correo, codigo, juegos, idJugador, estatus) " +
                "values('" + correo + "', '" + codigo + "', '" + juegos + "', '" +  estatus + "')";
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
            string correo = textBox1.Text;
            string codigo = textBox2.Text;
            string juegos = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE Supercell SET correo = '" + correo + "',codigo = '" + codigo + "',juegos = '" + juegos + 
                "',estatus = '" + estatus + "' WHERE idSupercell= " + identificador.ToString();
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
            consulta = "UPDATE Supercell SET Estatus = 0 WHERE idSupercell= " + identificador.ToString(); ;
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
