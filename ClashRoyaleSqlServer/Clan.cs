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
    public partial class Clan : Form
    {
        public Clan()
        {
            InitializeComponent();
        }
        string consulta;

        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM Clan ORDER BY idClan");

        }
        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string nombre = textBox1.Text;
            string tipo = textBox2.Text;
            string trofeos = textBox3.Text;
            string estatus = textBox4.Text;
            string miembros = textBox5.Text;
            string codigo = textBox6.Text;
            string idModoJuego = textBox7.Text;
            string idMercader = textBox8.Text;
            string idLigClan = textBox9.Text;
            string idPedido = textBox10.Text;
            string idIntercambio = textBox11.Text;
            consulta = "INSERT INTO Clan (nombre, tipo, trofeos, estatus, miembros, codigo, idModoJuego, idMercader, idLigClan, idPedido, idIntercambio) " +
                "values('" + nombre + "', '" + tipo + "', '" + trofeos + "', '" + estatus + "', '" + miembros + "', '" + codigo + "', '" + idModoJuego +
                "', '" + idMercader + "', '" + idLigClan + "', '" + idPedido + "', '" + idIntercambio+ "')";
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();


            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
            textBox6.Clear();
            textBox7.Clear();
            textBox8.Clear();
            textBox9.Clear();
            textBox10.Clear();
            textBox11.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {

            int identificador = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string nombre = textBox1.Text;
            string tipo = textBox2.Text;
            string trofeos = textBox3.Text;
            string estatus = textBox4.Text;
            string miembros = textBox5.Text;
            string codigo = textBox6.Text;
            string idModoJuego = textBox7.Text;
            string idMercader = textBox8.Text;
            string idLigClan = textBox9.Text;
            string idPedido = textBox10.Text;
            string idIntercambio = textBox11.Text;
            consulta = "UPDATE Clan SET nombre = '" + nombre + "',tipo = '" + tipo + "',tipo = '" + tipo +
                "',estatus = '" + estatus + "',trofeos = '" + trofeos + "'" + ",miembros = '" + miembros +
                "',codigo = '" + codigo + "',idModoJuego = '" + idModoJuego + "',idMercader = '" + idMercader + "'" +
                ",idLigClan = '" + idLigClan + "',idPedido = '" + idPedido + "',idIntercambio = '" + idIntercambio + "' WHERE idClan = " + identificador.ToString();
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();


            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
            textBox6.Clear();
            textBox7.Clear();
            textBox8.Clear();
            textBox9.Clear();
            textBox10.Clear();
            textBox11.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int identificador = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE  Clan SET Estatus = 0 WHERE idClan = " + identificador.ToString(); ;
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form1 abrir = new Form1();
            abrir.Show();
            this.Hide();
        }

        private void Clan_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }
    }
}
