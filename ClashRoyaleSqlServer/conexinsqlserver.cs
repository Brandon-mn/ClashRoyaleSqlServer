using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace ClashRoyaleSqlServer
{
    class conexinsqlserver
    {
        public static SqlConnection conexion = new SqlConnection();
        static string servidor = "localhost";
        static string bd = "ClashRoyale";
        static string ususario = "sa";
        static string password = "5770210";


        static String cadenaConexion = "server=" + servidor + ";" + "user id =" + ususario + ";" + "password=" + password + ";" + "database=" + bd + ";";

        private static void conectar()
        {
            try
            {
                conexion.ConnectionString = cadenaConexion;
                conexion.Open();
                //MessageBox.Show("Se conecto correctamente la base de datos");
            }
            catch (SqlException e)
            {
                MessageBox.Show("No se puede conectar a la base de datos de PostgreSQL, error:" + e.ToString());
            }

        }
        public static DataTable ejecutaConsultaSelect(string consulta)
        {
            conectar();
            SqlDataAdapter adaptador = new SqlDataAdapter(consulta, conexion);
            DataSet ds = new DataSet();
            adaptador.Fill(ds, "tabla");
            conexion.Close();
            return ds.Tables["tabla"];
        }
        public static void ejecutaConsulta(string consulta)
        {
            conectar();
            SqlCommand comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
        }
    }
}
