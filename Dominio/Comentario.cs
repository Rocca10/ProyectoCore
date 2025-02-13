using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Dominio
{
    public class Comentario
    {
        public Guid ComentarioId {get;set;} //En C# Guid se usa para cargar las claves primarias
        public string Alumno {get;set;}
        public int Puntaje {get;set;}
        public string ComentarioTexto {get;set;}
        public int CursoId {get;set;}
        public Curso Curso {get;set;}
    }
}