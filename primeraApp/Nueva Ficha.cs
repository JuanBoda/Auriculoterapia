using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Text;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace primeraApp
{
    public partial class Nueva_Ficha : Form
    {
        //Conexion a la Base de Datos
        public SqlConnection conexion = new SqlConnection("server=.\\SQLEXPRESS; database=Fichero; integrated security=true");
        SqlCommand comando = new SqlCommand();

        //Metodo iniciar el comando SQL
        public SqlCommand PrepareSqlCommand()
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

        public void CerrarConexion()
        {
            if (conexion.State == ConnectionState.Open)
            {
                conexion.Close();
            }
        }
        private string Normalize(string input)
        {
            return input.Normalize(NormalizationForm.FormKD).Trim();
        }

        // Validar Apellido
        private bool ValidarApellido(string apellido)
        {
            Regex regex = new Regex("^[a-zA-Z]+(\\s[a-zA-Z]+)*$");
            return regex.IsMatch(apellido.Trim());
        }
        //Validar Nombre
        private bool ValidarNombre(string nombre)
        {
            Regex regex = new Regex("^[a-zA-Z]+(\\s[a-zA-Z]+)*$");
            return regex.IsMatch(nombre.Trim());
        }

        // Validar DNI
        private bool ValidarDni(string dni)
        {
            return Regex.IsMatch(dni.Trim(), @"^\d{8}$");
        }
        //Validar Telefono
        private bool ValidarTelefono(string telefono)
        {
            Regex regex = new Regex("^[0-9-]+$");
            return regex.IsMatch(telefono.Trim());
        }

        //Recorrido de validaciòn y mensages
        private List<string> ValidarDatosPaciente()
        {
            List<string> validacionMensage = new List<string>();

            if (!ValidarApellido(txtApellidoNuevaFicha.Text))
            {
                validacionMensage.Add("El Apellido debe contener solo letras.");
            }

            if (!ValidarNombre(txtNombreNuevaFicha.Text))
            {
                validacionMensage.Add("El Nombre debe contener solo letras.");
            }

            if (!ValidarDni(txtDniNuevaFicha.Text))
            {
                validacionMensage.Add("El DNI debe tener 8 dígitos y solo números.");
            }
            if (!ValidarTelefono(txtTelNuevaFicha.Text))
            {
                validacionMensage.Add("El Teléfono ingresado no es valido.");
            }

            if (string.IsNullOrWhiteSpace(txtApellidoNuevaFicha.Text) ||
                string.IsNullOrWhiteSpace(txtNombreNuevaFicha.Text) ||
                string.IsNullOrWhiteSpace(txtDomicilioNuevaFicha.Text) ||
                string.IsNullOrWhiteSpace(txtTelNuevaFicha.Text) ||
                string.IsNullOrWhiteSpace(txtDniNuevaFicha.Text))
            {
                validacionMensage.Add("Por favos, complete todo los campos.");
            }

            return validacionMensage;
        }        

        public Nueva_Ficha()
        {
            InitializeComponent();
            comando = PrepareSqlCommand();
        }  

        private void btnGuardarNuevaFicha_Click(object sender, EventArgs e)
        {
            List<string> validacionMensage = ValidarDatosPaciente();

            if(validacionMensage.Count > 0)
            {
                MessageBox.Show(string.Join("\n", validacionMensage), "Correcciones necesarias");
                return;
            }            
            
            try
            {
                conexion.Open();

                comando.Parameters["@apellido"].Value = Normalize(txtApellidoNuevaFicha.Text);
                comando.Parameters["@nombre"].Value = Normalize(txtNombreNuevaFicha.Text);
                comando.Parameters["@domicilio"].Value = Normalize(txtDomicilioNuevaFicha.Text);
                comando.Parameters["@telefono"].Value = Normalize(txtTelNuevaFicha.Text);
                comando.Parameters["@dni"].Value = Normalize(txtDniNuevaFicha.Text);
                comando.Parameters["@infoadicional"].Value = Normalize(rtbInfoAdicionalNuevaFicha.Text);

                comando.ExecuteNonQuery();

                //Metodo de confirmaciòn
                DialogResult = MessageBox.Show("¿Desea guardar los datos?", "Confirmación", MessageBoxButtons.YesNo);
                if(DialogResult == DialogResult.Yes)
                {
                    Ficha_Paciente fichapaciente = new Ficha_Paciente();
                    fichapaciente.txtApellido.Text = txtApellidoNuevaFicha.Text;
                    fichapaciente.txtNombre.Text = txtNombreNuevaFicha.Text;
                    fichapaciente.txtDomicilio.Text = txtDomicilioNuevaFicha.Text;
                    fichapaciente.txtTelefono.Text = txtTelNuevaFicha.Text;
                    fichapaciente.txtDni.Text = txtDniNuevaFicha.Text;
                    fichapaciente.rtbAnotaciones.Text = rtbInfoAdicionalNuevaFicha.Text;
                    fichapaciente.Show();

                    txtApellidoNuevaFicha.Text = "";
                    txtNombreNuevaFicha.Text = "";
                    txtDomicilioNuevaFicha.Text = "";
                    txtTelNuevaFicha.Text = "";
                    txtDniNuevaFicha.Text = "";
                    rtbInfoAdicionalNuevaFicha.Text = "";
                
                    this.Close();
                }
            }
            catch (Exception ex)
            {
                File.WriteAllText("log.txt", ex.ToString());
                MessageBox.Show("Se produjo un error: " + ex.Message);
            }
            finally
            {
                CerrarConexion();
                //Pantalla_Inicial ventana = new Pantalla_Inicial();
                //ventana.CerrarConexion();
            }
        }
        private void btnCancelarNuevaFicha_Click(object sender, EventArgs e)
        {
            Pantalla_Inicial ventana = new Pantalla_Inicial();
            ventana.Show();
            this.Close();
        }
    }
}
