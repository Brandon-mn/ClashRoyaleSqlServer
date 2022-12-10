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
    public partial class Tienda : Form
    {
        public Tienda()
        {
            InitializeComponent();
        }
        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM Tienda ORDER BY idTienda");

        }
        private void Tienda_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string oro = textBox1.Text;
            string gemas = textBox2.Text;
            string cantidad = textBox3.Text;
            string idCofre = textBox5.Text;//me quiero morir alv AHHHHHH OJALA ME DE CANCER 
            string idReaccion = textBox6.Text;
            string idOferta = textBox6.Text;
            string idCodigoRegalo = textBox7.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO Tienda (oro, gemas, cantidad, idCofre, idReaccion,  idOferta, idCodigoRegalo, estatus) " +
                "values('" + oro + "', '" + gemas + "', '" + cantidad + "', '" + idCofre + "', '" + idReaccion + "', '" + idOferta + "', '" + idCodigoRegalo + "', '" + estatus + "')";
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();


            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox6.Clear();
            textBox7.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int identificador = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string oro = textBox1.Text;
            string gemas = textBox2.Text;
            string cantidad = textBox3.Text;
            string idCofre = textBox5.Text;//me quiero morir alv AHHHHHH OJALA ME DE CANCER 
            string idReaccion = textBox6.Text;
            string idOferta = textBox6.Text;
            string idCodigoRegalo = textBox7.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE Tienda SET oro = '" + oro + "',gemas = '" + gemas + "',cantidad = '" + cantidad + "',idCofre = '" + idCofre + "',idReaccion = '" + idReaccion +
                  "',idOferta = '" + idOferta + "',idCodigoRegalo = '" + idCodigoRegalo + "',estatus = '" + estatus + "' WHERE idTienda = " + identificador.ToString();
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();

            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox6.Clear();
            textBox7.Clear();

        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int identificador = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE Tienda SET Estatus = 0 WHERE idTienda = " + identificador.ToString(); ;
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
