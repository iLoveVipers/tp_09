using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using Dapper;

namespace tp_09{
    public static class BD
    {
        private static string _connectionString= @"Server=A-PHZ2-CIDI-050; DataBase=AQUARIO; Trusted_Connection=True;";
        
        public static List<Exhibicion> GetExhibiciones()
        {
            List<Exhibicion> Lista = null;
            string SQL = "SELECT * FROM Exhibiciones"; 
            using(SqlConnection db = new SqlConnection(_connectionString))
            {
                Lista = db.Query<Exhibicion>(SQL).ToList(); 
            } 
            return Lista;
        }
        
        public static Reserva GetReservaById(int Id)
        {
            Reserva reserva = new Reserva();
            string SQL = "SELECT * FROM Reservas R INNER JOIN Exhibiciones E ON R.idExhibicion=E.IdExhibicion "; 
            SQL += " WHERE IdReserva=@pId"; 
            using(SqlConnection db = new SqlConnection(_connectionString))
            {
                reserva = db.QueryFirstOrDefault<Reserva>(SQL, new { pId = Id }); 
            } 
            return reserva;
        }

         public static List<Reserva> GetReserva()
        {
            List<Reserva> Lista = null;
            string SQL = "SELECT * FROM Reserva"; 
            using(SqlConnection db = new SqlConnection(_connectionString))
            {
                Lista = db.Query<Reserva>(SQL).ToList(); 
            } 
            return Lista;
        }

        public static void InsertReserva(Reserva item)
        {
            string SQL = "INSERT INTO Reservas(Email, Nombre, Apellido, DNI, idExhibicion, Cantidad, PrecioFInal)";
            SQL += $" VALUES ('{item.Email}', '{item.Nombre}', '{item.Apellido}', '{item.DNI}', {item.idExhibicion}, {item.Cantidad}, {item.PrecioFinal}) "; 
            
            using(SqlConnection db = new SqlConnection(_connectionString))
            {
                db.Execute(SQL);
            }   

    
        }


    }
}