using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using dominio;

namespace datos 
{
    public class FichaDatos
    {
        public List<Ficha> Fichar()
        {
            List<Ficha> lista = new List<Ficha>();
            SqlConnection conexion = new SqlConnection();
            SqlCommand comando = new SqlCommand();
            SqlDataReader lector;

            try
            {
                conexion.ConnectionString = "server=.\\SQLEXPRESS; database=Fichero; integrated security=true";
                comando.CommandType = System.Data.CommandType.Text;
                comando.CommandText = "Select Apellido, Nombre, Domicilio, DNI, Telefono from Paciente";
                comando.Connection = conexion;

                conexion.Open();
                lector = comando.ExecuteReader();

                while (lector.Read())
                {
                    Ficha aux = new Ficha();
                    aux.Apellido = (string)lector["Apellido"];
                    aux.Nombre = (string)lector["Nombre"];
                    aux.Domicilio = (string)lector["Domicilio"];
                    aux.Dni = (string)lector["DNI"];
                    aux.Telefono = (string)lector["Telefono"];

                    lista.Add(aux);
                }

                conexion.Close();
                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public void agregar(Ficha nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            
            try
            {
                datos.setearConsulta("insert into Paciente (Apellido, Nombre, Domicilio, DNI, Telefono) values ('" + nuevo.Apellido + "', '" + nuevo.Nombre + "', '" + nuevo.Domicilio + "', '" + nuevo.Dni + "', '" + nuevo.Telefono + "')");
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConecxion();
            }
        }

        public void buscar(Ficha paciente)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("select from Paciente where Nombre = @nombre and Apellido = @apellido and DNI = @dni");
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConecxion();
            }
        }
    }
}
