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
    public partial class Bonus : Form
    {
        public Bonus()
        {
            InitializeComponent();
        }
        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM Bonus ORDER BY idBonus");

        }
        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string diario = textBox1.Text;
            string semanal = textBox2.Text;
            string experiencia = textBox3.Text;
            string recompensa = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO Bonus (diario, semanal, experiencia, recompensa,  estatus) " +
                "values('" + diario + "', '" + semanal + "', '" + experiencia + "', '" + recompensa + "', '" + estatus + "')";
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
            string diario = textBox1.Text;
            string semanal = textBox2.Text;
            string experiencia = textBox3.Text;
            string recompensa = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE Bonus SET diario = '" + diario + "',semanal = '" + semanal + "',experiencia = '" + experiencia + "',recompensa = '" + recompensa +
                "',estatus = '" + estatus + "' WHERE idBonus = " + identificador.ToString();
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
            consulta = "UPDATE Bonus SET Estatus = 0 WHERE idBonus = " + identificador.ToString(); ;
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form1 abrir = new Form1();
            abrir.Show();
            this.Hide();
        }

        private void Bonus_Load(object sender, EventArgs e)
        {
            MostrarDatos();

        }
    }
}
