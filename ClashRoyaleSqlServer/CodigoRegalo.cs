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
    public partial class CodigoRegalo : Form
    {
        public CodigoRegalo()
        {
            InitializeComponent();
        }
        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM CodigoRegalo ORDER BY idCodigoRegalo");

        }
        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string codigo = textBox1.Text;
            string credito = textBox2.Text;
            string fechaVencimiento = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO CodigoRegalo (codigo, credito, fechaVencimiento, estatus) " +
                "values('" + codigo + "', '" + credito + "', '" + fechaVencimiento + "', '" + estatus + "')";
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

            string codigo = textBox1.Text;
            string credito = textBox2.Text;
            string fechaVencimiento = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE CodigoRegalo SET codigo = '" + codigo + "',credito = '" + credito + "',fechaVencimiento = '" + fechaVencimiento +
                "',estatus = '" + estatus + "' WHERE idCodigoRegalo = " + identificador.ToString();
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
            consulta = "UPDATE CodigoRegalo SET Estatus = 0 WHERE idCodigoRegalo = " + identificador.ToString(); ;
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form1 abrir = new Form1();
            abrir.Show();
            this.Hide();
        }

        private void CodigoRegalo_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }
    }
}
