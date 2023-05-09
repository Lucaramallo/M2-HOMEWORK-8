
-- DROP DATABASE test;
 -- ARRANQUE:
/*
CREATE DATABASE test;

use test;



CREATE TABLE oferta_gastronomica(
	id_local INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    barrio VARCHAR(50) NOT NULL,
    comuna INT NOT NULL,
    PRIMARY KEY (id_local)
);

*/ 

SELECT * 
FROM oferta_gastronomica; 
    
-- verifico la carga
select count(*)
FROM oferta_gastronomica;


-- a) cual es el barrio con mayor cantidad de PUBs.
-- debo agrupar por categoria.


SELECT barrio, count(*) as cantidad_Registros
	FROM oferta_gastronomica
	WHERE categoria = 'PUB'
	GROUP BY barrio
	ORDER BY cantidad_registros DESC;

 -- Extra, si quisiese sacar un coeficiente o mejor dicho un indicador catidad de pubs/cant registros; 
 -- tengo que hacer una consulta anidada
 
/* 
Se está seleccionando la columna "barrio" y 
contando el número de filas que coinciden con el valor de la columna "barrio",
el resultado se almacena en la columna "cantidad_Pubs_x_barrio".

En la siguiente subconsulta se cuenta la cantidad de filas de la tabla "oferta_gastronomica"
que tienen el mismo valor en la columna "barrio" que la fila actual.

Luego, se divide el resultado de la primera consulta (cantidad_Pubs_x_barrio)
por el resultado de la subconsulta anterior (cantidad_Registros)
y se almacena en la columna "coeficiente".

Finalmente, se agrupan los resultados por barrio y se ordenan por cantidad_Pubs_x_barrio
en orden descendente, luego por cantidad_Registros en orden descendente,
y por último por coeficiente en orden descendente.

*/

SELECT barrio, COUNT(*) as cantidad_Pubs_x_barrio,
(SELECT COUNT(*) FROM oferta_gastronomica WHERE barrio = o.barrio) as cantidad_Registros,
ROUND(COUNT(*)/(SELECT COUNT(*) FROM oferta_gastronomica WHERE barrio = o.barrio), 4) as coeficiente
FROM oferta_gastronomica o
WHERE categoria = 'PUB'
GROUP BY barrio
ORDER BY cantidad_Pubs_x_barrio DESC,cantidad_Registros DESC,coeficiente DESC;




-- b) Obtener la cantidad de locales por categoria:
-- observar primer item de tabla, valores nulos... que se hace?...
-- INTERESANTE COMO LIMPIO LA TABLA DE NULOS

SELECT categoria, 
count(*)
From oferta_gastronomica
group by categoria
ORDER BY 2 DESC;



-- Calculando el indice extra para categoria mas popular en los registros.. "RESTAURANTE"

SELECT barrio, COUNT(*) as cantidad_Pubs_x_barrio,
(SELECT COUNT(*) FROM oferta_gastronomica WHERE barrio = o.barrio) as cantidad_Registros,
ROUND(COUNT(*)/(SELECT COUNT(*) FROM oferta_gastronomica WHERE barrio = o.barrio), 4) as coeficiente
FROM oferta_gastronomica o
WHERE categoria = 'RESTAURANTE'
GROUP BY barrio
ORDER BY cantidad_Pubs_x_barrio DESC,cantidad_Registros DESC,coeficiente DESC;

-- jujuuu! CH#2 VOY POR TI!





-- C) obtener cant restaurantes x comuna

SELECT comuna, count(*) as cantidad
FROM oferta_gastronomica
WHERE categoria = 'RESTAURANTE'
GROUP BY comuna
ORDER BY 2 desc, comuna asc;


/*
-- a) cual es el barrio con mayor cantidad de PUBs.
-- debo agrupar por categoria.

SELECT barrio, count(*) as cantidad
FROM oferta_gastronomica
WHERE categoria = 'PUB'
GROUP BY barrio
ORDER BY cantidad DESC
LIMIT 1;

-- b) Obtener la cantidad de locales por categoria:

SELECT categoria, count(*) as cantidad
FROM oferta_gastronomica
GROUP BY categoria
ORDER BY categoria;

-- observar primer item de tabla, valores nulos... que se hace?...
-- INTERESANTE COMO LIMPIO LA TABLA DE NULOS

UPDATE oferta_gastronomica
SET categoria = 'SIN DATO'
WHERE '';
SELECT categoria, count(*) as cantidad
FROM oferta_gastronomica
GROUP BY categoria
ORDER BY categoria DESC;


-- C) obtener cant restaurantes x comuna

SELECT comuna, count(*) as cantidad
FROM oferta_gastronomica
WHERE categoria = 'RESTAURANTE'
GROUP BY comuna
ORDER BY cantidad DESC;
    
    */
    
    