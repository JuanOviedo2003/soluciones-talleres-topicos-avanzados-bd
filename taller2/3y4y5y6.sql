-----Numero 3-----
select nombre
from Usuarios
where id_usuarios not in (
	select distinct id_usuarios
	from Prestamos
);

-----Numero 4-----
SELECT nombre,
		(SELECT COUNT(*) 
		from Prestamos p
		where p.id_usuario = u.id_usuario) as total_prestamos 
from Usuarios u;

-----Numero 5-----
select Titulo
from Libros 
where id_libro = (
	select id_libro 
	from Prestamos
	group by id_libro
	order by count (1) desc 
	limit 1
);

-----Numero 6-----
SELECT titulo, stock
from libros  
where stock >(
	select avg (stock)
	from libros
		);