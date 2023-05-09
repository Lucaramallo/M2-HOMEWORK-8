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

SELECT count(*)
FROM oferta_gastronomica;

-- a) ¿Cuál es el barrio con mayor cantidad de Pubs?
SELECT barrio, count(*) as cantidad
FROM oferta_gastronomica
WHERE categoria = 'PUB'
GROUP BY barrio
ORDER BY cantidad DESC
LIMIT 1;

-- b) Obtener la cantidad de locales por categoría
UPDATE oferta_gastronomica
SET categoria = 'SIN DATO'
WHERE categoria = '';

SELECT categoria, count(*) as cantidad
FROM oferta_gastronomica
GROUP BY categoria
ORDER BY cantidad DESC;

-- c) Obtener la cantidad de restaurantes por comuna
SELECT comuna, count(*) as cantidad
FROM oferta_gastronomica
WHERE categoria = 'RESTAURANTE'
GROUP BY comuna
ORDER BY cantidad DESC;