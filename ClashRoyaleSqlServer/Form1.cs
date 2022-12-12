using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace ClashRoyaleSqlServer
{
    public partial class Form1 : Form
    {
        SqlConnection conexion;
        string consulta;
        SqlCommand comando;
        public Form1()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=ClashRoyale;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
            //conexion.Open();
        }


        private void Form1_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void MostrarDatos()
        {
            dataGridView1.DataSource = conexinsqlserver.ejecutaConsultaSelect("SELECT *FROM Jugador ORDER BY idJugador");

        }



        private void adornoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Adorno abrir = new Adorno();
            abrir.Show();
            this.Hide();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {

            string nombre = textBox1.Text;
            string codigo = textBox2.Text;
            string puntosEstelares = textBox3.Text;
            string estatus = textBox4.Text;
            string experiencia = textBox5.Text;
            string idDesafio = textBox6.Text;
            string idLibro = textBox7.Text;
            string idClan = textBox8.Text;
            string idTorneo = textBox9.Text;
            string idPase = textBox10.Text;
            string idCaminoTrofeo = textBox11.Text;
            string idCaminoLeyenda = textBox12.Text;
            string idEstadistica = textBox13.Text;
            consulta = "INSERT INTO Jugador (nombre, codigo, puntosEstelares, estatus, experiencia, idDesafio, idLibro, idClan, idTorneo, idPase, idCaminoTrofeo, idCaminoLeyenda,idEstadistica) " +
                "values('" + nombre + "', '" + codigo + "', '" + puntosEstelares + "', '" + estatus + "', '" + experiencia + "', '" + idDesafio + "', '" + idLibro +
                "', '" + idClan + "', '" + idTorneo + "', '" + idPase + "', '" + idCaminoTrofeo + "', '" + idCaminoLeyenda + "', '" + idEstadistica + "')";
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
            textBox12.Clear();
        }

        private void btnModificar_Click_1(object sender, EventArgs e)
        {
            int idJugador = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string nombre = textBox1.Text;
            string codigo = textBox2.Text;
            string puntosEstelares = textBox3.Text;
            string estatus = textBox4.Text;
            string experiencia = textBox5.Text;
            string idDesafio = textBox6.Text;
            string idLibro = textBox7.Text;
            string idClan = textBox8.Text;
            string idTorneo = textBox9.Text;
            string idPase = textBox10.Text;
            string idCaminoTrofeo = textBox11.Text;
            string idCaminoLeyenda = textBox12.Text;
              string idEstadistica = textBox13.Text;
            consulta = "UPDATE Jugador SET nombre = '" + nombre + "',codigo = '" + codigo + "',puntosEstelares = '" + puntosEstelares +
                "',estatus = '" + estatus + "',experiencia = '" + experiencia + "'" + ",idDesafio = '" + idDesafio +
                "',idLibro = '" + idLibro + "',idClan = '" + idClan + "',idTorneo = '" + idTorneo + "'" +
                ",idPase = '" + idPase + "',idCaminoTrofeo = '" + idCaminoTrofeo + "',idCaminoLeyenda = '" + idEstadistica + "',idEstadistica = '" + idCaminoLeyenda + "' WHERE idJugador = " + idJugador.ToString();
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
            textBox12.Clear();

        }

        private void btnBorrar_Click_1(object sender, EventArgs e)
        {
            int idJugador = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE Jugador SET Estatus = 0 WHERE idJugador = " + idJugador.ToString(); ;
            conexinsqlserver.ejecutaConsulta(consulta);
            MostrarDatos();

        }

        private void jugadorToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Tvroyale abrir = new Tvroyale();
            abrir.Show();
            this.Hide();
        }

        private void aspectoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Arena abrir = new Arena();
            abrir.Show();
            this.Hide();

        }

        private void aspectoToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            Aspecto abrir = new Aspecto();
            abrir.Show();
            this.Hide();

        }

        private void bonusToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Bonus abrir = new Bonus();
            abrir.Show();
            this.Hide();

        }

        private void botinToolStripMenuItem_Click(object sender, EventArgs e)
        {

            Botin abrir = new Botin();
            abrir.Show();
            this.Hide();
        }

        private void caminoLeyendaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CaminoLeyenda abrir = new CaminoLeyenda();
            abrir.Show();
            this.Hide();
        }

        private void caminoTrofeoToolStripMenuItem_Click(object sender, EventArgs e)
        {

            CaminoTrofeo abrir = new CaminoTrofeo();
            abrir.Show();
            this.Hide();
        }

        private void campeonToolStripMenuItem_Click(object sender, EventArgs e)
        {

            Campeon abrir = new Campeon();
            abrir.Show();
            this.Hide();
        }

        private void cartaToolStripMenuItem_Click(object sender, EventArgs e)
        {

            Carta abrir = new Carta();
            abrir.Show();
            this.Hide();
        }

        private void clanToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Clan abrir = new Clan();
            abrir.Show();
            this.Hide();
        }

        private void clanGuerraToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ClanGuerra abrir = new ClanGuerra();
            abrir.Show();
            this.Hide();
        }

        private void clanSolicitudToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ClanSolicitud abrir = new ClanSolicitud();
            abrir.Show();
            this.Hide();
        }

        private void clasificacionToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Formulario abrir = new Formulario();
            abrir.Show();
            this.Hide();
        }

        private void codigoRegaloToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CodigoRegalo abrir = new CodigoRegalo();
            abrir.Show();
            this.Hide();
        }

        private void cofreToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Cofre abrir = new Cofre();
            abrir.Show();
            this.Hide();
        }

        private void comodinToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Comodin abrir = new Comodin();
            abrir.Show();
            this.Hide();
        }

        private void creadorContenidoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CreadorContenido abrir = new CreadorContenido();
            abrir.Show();
            this.Hide();
        }

        private void desafioToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Desafio abrir = new Desafio();
            abrir.Show();
            this.Hide();
        }

        private void donacionToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Donacion abrir = new Donacion();
            abrir.Show();
            this.Hide();
        }

        private void echizoToolStripMenuItem_Click(object sender, EventArgs e)
        {

            Echizo abrir = new Echizo();
            abrir.Show();
            this.Hide();
        }

        private void empleadoToolStripMenuItem_Click(object sender, EventArgs e)
        {

            Empleado abrir = new Empleado();
            abrir.Show();
            this.Hide();
        }

        private void estadisticaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Estadistica abrir = new Estadistica();
            abrir.Show();
            this.Hide();
        }

        private void estructuraToolStripMenuItem_Click(object sender, EventArgs e)
        {

            Estructura abrir = new Estructura();
            abrir.Show();
            this.Hide();
        }

        private void guerraToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Guerra abrir = new Guerra();
            abrir.Show();
            this.Hide();
        }

        private void habiliadadToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Habiliadad abrir = new Habiliadad();
            abrir.Show();
            this.Hide();
        }

        private void intercambioToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Intercambio abrir = new Intercambio();
            abrir.Show();
            this.Hide();
        }

        private void jugadorToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            JugadorAdorno abrir = new JugadorAdorno();
            abrir.Show();
            this.Hide();
        }

        private void jugadorCofreToolStripMenuItem_Click(object sender, EventArgs e)
        {
            JugadorCofre abrir = new JugadorCofre();
            abrir.Show();
            this.Hide();
        }

        private void dToolStripMenuItem_Click(object sender, EventArgs e)
        {
            JugadorComodin abrir = new JugadorComodin();
            abrir.Show();
            this.Hide();
        }

        private void jugadorMarcoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            JugadorComodin abrir = new JugadorComodin();
            abrir.Show();
            this.Hide();
        }

        private void jugadorMazoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            JugadorMazo abrir = new JugadorMazo();
            abrir.Show();
            this.Hide();
        }

        private void jugadorTvRoyaleToolStripMenuItem_Click(object sender, EventArgs e)
        {
            JugadorTvRoyale abrir = new JugadorTvRoyale();
            abrir.Show();
            this.Hide();
        }

        private void libroToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Libro abrir = new Libro();
            abrir.Show();
            this.Hide();
        }

        private void libroJugadorToolStripMenuItem_Click(object sender, EventArgs e)
        {
            LibroJugador abrir = new LibroJugador();
            abrir.Show();
            this.Hide();
        }

        private void ligaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Liga abrir = new Liga();
            abrir.Show();
            this.Hide();
        }

        private void libroJugadorToolStripMenuItem1_Click(object sender, EventArgs e)
        {

        }

        private void ligaClanToolStripMenuItem_Click(object sender, EventArgs e)
        {
            LigaClan abrir = new LigaClan();
            abrir.Show();
            this.Hide();
        }

        private void logroToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Logro abrir = new Logro();
            abrir.Show();
            this.Hide();
        }

        private void logroJugadorToolStripMenuItem_Click(object sender, EventArgs e)
        {
            LogroJugador abrir = new LogroJugador();
            abrir.Show();
            this.Hide();
        }

        private void maestriaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Maestria abrir = new Maestria();
            abrir.Show();
            this.Hide();
        }

        private void maestroToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Maestro abrir = new Maestro();
            abrir.Show();
            this.Hide();
        }

        private void maestroJugadorToolStripMenuItem_Click(object sender, EventArgs e)
        {
            MaestroJugador abrir = new MaestroJugador();
            abrir.Show();
            this.Hide();
        }

        private void marcoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Marco abrir = new Marco();
            abrir.Show();
            this.Hide();
        }

        private void mazoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Mazo abrir = new Mazo();
            abrir.Show();
            this.Hide();
        }

        private void mazoCartaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            MazoCarta abrir = new MazoCarta();
            abrir.Show();
            this.Hide();
        }

        private void mercaderToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Mercader abrir = new Mercader();
            abrir.Show();
            this.Hide();
        }

        private void misionToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Mision abrir = new Mision();
            abrir.Show();
            this.Hide();
        }

        private void misionJugadorToolStripMenuItem_Click(object sender, EventArgs e)
        {
            MisionJugador abrir = new MisionJugador();
            abrir.Show();
            this.Hide();
        }

        private void modoJuegoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ModoJuego abrir = new ModoJuego();
            abrir.Show();
            this.Hide();
        }

        private void nivelToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Nivel abrir = new Nivel();
            abrir.Show();
            this.Hide();
        }

        private void ofertaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Oferta abrir = new Oferta();
            abrir.Show();
            this.Hide();
        }

        private void paseToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Pase abrir = new Pase();
            abrir.Show();
            this.Hide();
        }

        private void paseTiendaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            PaseTienda abrir = new PaseTienda();
            abrir.Show();
            this.Hide();
        }

        private void pedidoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Pedido abrir = new Pedido();
            abrir.Show();
            this.Hide();
        }

        private void puestoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Puesto abrir = new Puesto();
            abrir.Show();
            this.Hide();
        }

        private void reaccionToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Reaccion abrir = new Reaccion();
            abrir.Show();
            this.Hide();
        }

        private void registroToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Registro abrir = new Registro();
            abrir.Show();
            this.Hide();
        }

        private void registroJugadorToolStripMenuItem_Click(object sender, EventArgs e)
        {
            RegistroJugador abrir = new RegistroJugador();
            abrir.Show();
            this.Hide();
        }

        private void solicitudToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Solicitud abrir = new Solicitud();
            abrir.Show();
            this.Hide();
        }

        private void superrcellToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Supercell abrir = new Supercell();
            abrir.Show();
            this.Hide();
        }

        private void superrcellCreadoContenidoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            SuperrcellCreadoContenido abrir = new SuperrcellCreadoContenido();
            abrir.Show();
            this.Hide();
        }

        private void supercellEmpleadoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            SupercellEmpleado abrir = new SupercellEmpleado();
            abrir.Show();
            this.Hide();
        }

        private void tiendaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Tienda abrir = new Tienda();
            abrir.Show();
            this.Hide();
        }

        private void tiendaPagoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            TiendaPago abrir = new TiendaPago();
            abrir.Show();
            this.Hide();
        }

        private void torneoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Torneo abrir = new Torneo();
            abrir.Show();
            this.Hide();
        }

        private void tropaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Tropa abrir = new Tropa();
            abrir.Show();
            this.Hide();
        }
    }
}
