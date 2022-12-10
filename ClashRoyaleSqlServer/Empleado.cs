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
    public partial class Empleado : Form
    {
        public Empleado()
        {
            InitializeComponent();
        }
        string consulta;
        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM Empleado ORDER BY idEmpleado");

        }
        private void Empleado_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {

            string nombre = textBox1.Text;
            string apellidoPaterno = textBox2.Text;
            string apellidoMaterno = textBox3.Text;
            string pais = textBox5.Text;//me quiero morir alv AHHHHHH OJALA ME DE CANCER 
            string calle = textBox6.Text;
            string colonia = textBox9.Text;
            string municipio = textBox8.Text;
            string idPuesto = textBox7.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO Empleado (nombre, apellidoPaterno, apellidoMaterno, pais, calle, colonia, municipo, idPuesto, estatus) " +
                "values('" + nombre + "', '" + apellidoPaterno + "', '" + apellidoMaterno + "', '" + pais + "', '" + calle + "', '" + colonia + "', '"
                + municipio + "', '" + idPuesto + "', '" + estatus + "')";
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();


            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox6.Clear();
            textBox7.Clear();
            textBox8.Clear();
            textBox8.Clear();
            textBox9.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {

            int identificador = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string nombre = textBox1.Text;
            string apellidoPaterno = textBox2.Text;
            string apellidoMaterno = textBox3.Text;
            string pais = textBox5.Text;//me quiero morir alv AHHHHHH OJALA ME DE CANCER 
            string calle = textBox6.Text;
            string colonia = textBox9.Text;
            string municipio = textBox8.Text;
            string idPuesto = textBox7.Text;
            string estatus = textBox4.Text;
            consulta = "UPDATE Empleado SET nombre = '" + nombre + "',viapellidoPaternoda = '" + apellidoPaterno + "',apellidoMaterno = '" + apellidoMaterno + "',pais = '" + pais + "',calle = '" + calle +
                "',colonia = '" + colonia + "',municipo = '" + municipio + "',idPuesto = '" + idPuesto + "',estatus = '" + estatus + "' WHERE idEmpleado = " + identificador.ToString();
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox6.Clear();
            textBox7.Clear();
            textBox8.Clear();
            textBox8.Clear();
            textBox9.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int identificador = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE Empleado SET Estatus = 0 WHERE idEmpleado = " + identificador.ToString(); ;
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
