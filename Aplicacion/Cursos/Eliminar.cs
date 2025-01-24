using System;
using System.Net;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MediatR;
using Persistencia;
using System.Threading; // Para CancellationToken
using Aplicacion.ManejadorError;

namespace Aplicacion.Cursos
{
    public class Eliminar
    {
        public class Ejecuta : IRequest {
            public int Id {get;set;}
        }

        public class Manejador : IRequestHandler<Ejecuta>{

            private readonly CursosOnlineContext _context;
            public Manejador(CursosOnlineContext context){
                _context = context;
            }

            public async Task<Unit> Handle(Ejecuta request, CancellationToken cancellationToken)
            {
                var curso = await _context.Curso.FindAsync(request.Id);
                if(curso ==null ){
                    //throw new Exception("No se encotró el curso"); Error generico
                    throw new ManejadorExcepcion(HttpStatusCode.NotFound, new {mensaje = "No se encontró el Curso"});
                }
                _context.Remove(curso);

                var resultado = await _context.SaveChangesAsync();

                if(resultado > 0){
                    return Unit.Value;
                }

                throw new Exception("No se pudieron guardar los cambios");
            }
        }
    }
}