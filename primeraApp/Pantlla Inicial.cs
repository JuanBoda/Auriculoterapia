using dominio;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace primeraApp
{
    public partial class Pantalla_Inicial : Form
    {
        //Conexión y comando a la Base de Datos
        private SqlConnection conexion = new SqlConnection("server=.\\SQLEXPRESS; database=Fichero; integrated security=true");
        SqlCommand comando = new SqlCommand();

        //Metodo para buscar un paciente en la Base de Datos
        private SqlCommand PrepareSqlCommand()
        {
            string sql = "select * from Paciente where DNI = @dni";
            SqlCommand comando = new SqlCommand(sql, conexion);
            comando.Parameters.AddWithValue("@dni", txtDniInicio.Text);

            return comando;
        }

        //Método para validar el Dni ingresado por el usuario
        public bool ValidarDatos()
        {
            try
            {
                if(string.IsNullOrEmpty(txtDniInicio.Text))
                {
                    MessageBox.Show("No igresó datos en el DNI");
                    return false;
                }
                if(!int.TryParse(txtDniInicio.Text, out int dni))
                {
                    MessageBox.Show("El DNI debe ser un número");
                    return false;
                }
                if(dni.ToString().Length != 8)
                {
                    MessageBox.Show("El DNI debe de tener 8 dígitos");
                    return false;
                }
                return true;

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }
        }

        //Metodo para cerrar conexion
        public void CerrarConexion()
        {
            if (conexion.State == ConnectionState.Open)
            {
                conexion.Close();
            }
        }

        public Pantalla_Inicial()
        {
            InitializeComponent();
            comando = PrepareSqlCommand();
        }

        //Te lleva a una nueva ventana para crear la ficha de un nuevo Paciente
        private void btnNuevoPaciente_Click(object sender, EventArgs e)
        {
            Nueva_Ficha ventanaNuevaFicha = new Nueva_Ficha();
            ventanaNuevaFicha.Show();
            this.Hide();
        }

        private void btnCerraPantaInicio_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        // Busca el paciente con el DNI ingresado y lo muestra en la ventana Ficha_Paciente.
        private void btnBuscarInicio_Click(object sender, EventArgs e)
        {
            try
            {
                if (ValidarDatos())
                {
                    conexion.Open();
                    string dni = txtDniInicio.Text;
                    using (SqlCommand comando = new SqlCommand("select * from Paciente where (DNI = @dni)", conexion))
                    {
                        comando.Parameters.AddWithValue("@dni", dni);
                        using (SqlDataReader reader = comando.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                Ficha_Paciente ficha_Paciente = new Ficha_Paciente();
                                ficha_Paciente.txtApellido.Text = reader["Apellido"].ToString();
                                ficha_Paciente.txtNombre.Text = reader["Nombre"].ToString();
                                ficha_Paciente.txtDomicilio.Text = reader["Domicilio"].ToString();
                                ficha_Paciente.txtTelefono.Text = reader["Telefono"].ToString();
                                ficha_Paciente.txtDni.Text = reader["Dni"].ToString();
                                ficha_Paciente.rtbAnotaciones.Text = reader["InfoAdicional"].ToString();

                                ficha_Paciente.Show();
                                this.Hide();
                            }
                            else
                            {
                                MessageBox.Show("No se encontró ningún paciente con el DNI ingresado");
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Se produjo un error: " + ex.Message);
            }
            finally
            {
                CerrarConexion();
            }
        }
    }
}
