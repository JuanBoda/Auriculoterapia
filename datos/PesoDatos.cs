using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace datos
{
    public class PesoDatos
    {
        public List<Pesos> listar()
        {
            List<Pesos> lista = new List<Pesos>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("select Peso, Fecha_Turno, Fecha_Proximo_Turno from Pesos_Turnos");
                datos.ejecutarLectura();

                while(datos.Lector.Read())
                {
                    Pesos aux = new Pesos();
                    aux.Peso = (char)datos.Lector["Peso"];
                    aux.Fecha_Turno = (char)datos.Lector["Fecha_Turno"];
                    aux.Fecha_Proximo_Turno = (char)datos.Lector["Fecha_Proximo_Turno"];

                    lista.Add(aux);
                }

                return lista;

            }

                catch (Exception ex)

            {

                throw ex;
            }
        }
    }
}
