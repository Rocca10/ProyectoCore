using System;
using System.Net;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MediatR;
using Dominio;
using Persistencia;
using System.Threading;
using Aplicacion.ManejadorError;

namespace Aplicacion.Cursos
{
    public class ConsultaId
    {
        public class CursoUnico : IRequest<Curso>{
            public int Id{get;set;}
        }

        public class Manejador : IRequestHandler<CursoUnico, Curso>
        {
        private readonly CursosOnlineContext _context;

        public Manejador(CursosOnlineContext context){
            _context = context;
        }
         
        public async Task<Curso> Handle(CursoUnico request, CancellationToken cancellationToken)
        {
            var curso = await _context.Curso.FindAsync(request.Id);
                if(curso ==null ){
                    //throw new Exception("No se encotró el curso"); Error generico
                    throw new ManejadorExcepcion(HttpStatusCode.NotFound, new {mensaje = "No se encontró el Curso"});
                }

            return curso;
        }


        }

    }
}