using System;
using System.Net;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MediatR;
using Persistencia;
using System.Threading; // Para CancellationToken
using FluentValidation.AspNetCore;
using FluentValidation;
using Aplicacion.ManejadorError;

namespace Aplicacion.Cursos
{
    public class Editar
    {
        public class Ejecuta : IRequest
        {
            public int CursoId { get; set; }
            public string Titulo { get; set; }
            public string Descripcion { get; set; }
            public DateTime? FechaPublicacion { get; set; } //El signo de interrogacion es para permitir entrada de datos nulos. DateTime no permite datos nulos por eso se pone el signo de interrogacion.
        }

            public class EjecutaValidacion : AbstractValidator<Ejecuta>{    //Clase que ejecuta la validacion.
            public EjecutaValidacion(){
                RuleFor(x => x.Titulo).NotEmpty();
                RuleFor(x => x.Descripcion).NotEmpty();
                RuleFor(x => x.FechaPublicacion).NotEmpty();
            }
        }

        public class Manejador : IRequestHandler<Ejecuta>
        {

            private readonly CursosOnlineContext _context;
            public Manejador(CursosOnlineContext context)
            {
                _context = context;
            }
            public async Task<Unit> Handle(Ejecuta request, CancellationToken cancellationToken)
            {
                var curso = await _context.Curso.FindAsync(request.CursoId);
                if (curso == null)
                if(curso ==null ){
                    throw new ManejadorExcepcion(HttpStatusCode.NotFound, new {mensaje = "No se encontró el Curso"});
                }

                curso.Titulo = request.Titulo ?? curso.Titulo;
                curso.Descripcion = request.Descripcion ?? curso.Descripcion;
                curso.FechaPublicacion = request.FechaPublicacion ?? curso.FechaPublicacion;

                var resultado = await _context.SaveChangesAsync();

                if (resultado > 0)
                    return Unit.Value;

                throw new Exception("No se guardaron los cambios en el curso");
            }
        }
    }
}