using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Dominio;

namespace Persistencia
{
    public class DataPrueba
    {
        public static async Task InsertarData(CursosOnlineContext context, UserManager<Usuario> usuarioManager){
            if(!usuarioManager.Users.Any()){
                var usuario = new Usuario{NombreCompleto = "Nicolas Rocca", UserName="Rocca10",Email="Nicolas.Rocca10@gmail.com"};
                await usuarioManager.CreateAsync(usuario, "Password123456#");
            }
        }
    }
}