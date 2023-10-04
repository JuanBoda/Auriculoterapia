using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using datos;

namespace primeraApp
{
    public partial class Ficha_Paciente : Form
    {

        private SqlConnection conexion = new SqlConnection("server=.\\SQLEXPRESS; database=Fichero; integrated security=true");
        SqlCommand comando = new SqlCommand();

        private SqlCommand PrepareSqlCommand()
        {
            string sql = "insert into Paciente(Apellido, Nombre, Domicilio, Telefono, Dni, InfoAdicional) values (@apellido, @nombre, @domicilio, @telefono, @dni, @infoadicional)";
            SqlCommand comando = new SqlCommand(sql, conexion);
            comando.Parameters.Add("@apellido", SqlDbType.VarChar);
            comando.Parameters.Add("@nombre", SqlDbType.VarChar);
            comando.Parameters.Add("@domicilio", SqlDbType.VarChar);
            comando.Parameters.Add("@telefono", SqlDbType.VarChar);
            comando.Parameters.Add("@dni", SqlDbType.VarChar);
            comando.Parameters.Add("@infoadicional", SqlDbType.VarChar);

            return comando;
        }
        private void AbrirPantallaInicial()
        {
            Pantalla_Inicial ventanaInicial = new Pantalla_Inicial();
            ventanaInicial.Show();
            this.Close();
        }
        private void ManejarExcepcion(Exception ex)
        {
            File.WriteAllText("log.txt", ex.ToString());
            MessageBox.Show("Se produjo un error: " + ex.Message);
        }

        private string textoOriginal;
        public Ficha_Paciente()
        {
            InitializeComponent();
            comando = PrepareSqlCommand();
            textoOriginal = rtbAnotaciones.Text;
        }
        private void btnGuardarFichaPaciente_Click(object sender, EventArgs e)
        {
           AbrirPantallaInicial();
        }

        private void rtbAnotaciones_TextChanged(object sender, EventArgs e)
        {
            string anotacionesModificadas = rtbAnotaciones.Text;
            string textoActual = rtbAnotaciones.Text;
            try
            {
                if(textoActual != textoOriginal)
                {
                    conexion.Open();
                    string sql = "UPDATE Paciente SET InfoAdicional = @infoadicional WHERE Dni = @dni";
                    SqlCommand comando = new SqlCommand(sql, conexion);
                    comando.Parameters.Add("@infoadicional", SqlDbType.VarChar).Value = anotacionesModificadas;
                    comando.Parameters.Add("@dni", SqlDbType.VarChar).Value = txtDni.Text;

                    comando.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                ManejarExcepcion(ex);
            }
            finally
            {
                if(conexion.State == ConnectionState.Open)
                {
                    conexion.Close();
                }
            }
        }

        private void btnAceptar_Click(object sender, EventArgs e)
        {
            AbrirPantallaInicial();
        }

        private void busquedaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Nueva_Ficha ventana = new Nueva_Ficha();
            ventana.Show();
        }
    }
}


