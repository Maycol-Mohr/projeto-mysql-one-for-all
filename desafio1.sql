DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

   CREATE TABLE SpotifyClone.plano(
      plano_id INT PRIMARY KEY AUTO_INCREMENT,
      plano_nome VARCHAR(50) NOT NULL,
      plano_valor DECIMAL(3,2) NOT NULL
  ) engine = InnoDB;
  
    CREATE TABLE SpotifyClone.usuario(
      usuario_id INT PRIMARY KEY AUTO_INCREMENT,
      usuario_nome VARCHAR(50) NOT NULL,
      usuario_idade INT NOT NULL,
      data_assinatura DATETIME NOT NULL,
      plano_id INT NOT NULL,
      CONSTRAINT FK_id_plano FOREIGN KEY(plano_id) REFERENCES plano(plano_id)
  ) engine = InnoDB;
  
   CREATE TABLE SpotifyClone.artista(
      artista_id INT PRIMARY KEY AUTO_INCREMENT,
      artista_nome VARCHAR(50) NOT NULL
  ) engine = InnoDB;
  
  CREATE TABLE SpotifyClone.usuario_seguindo_artista(
      usuario_id INT NOT NULL,
      artista_id INT NOT NULL,
      CONSTRAINT PRIMARY KEY(usuario_id, artista_id),
      CONSTRAINT FK_id_usuario_seguindo FOREIGN KEY(usuario_id) REFERENCES usuario(usuario_id),
      CONSTRAINT FK_id_artista FOREIGN KEY(artista_id) REFERENCES artista(artista_id)
  ) engine = InnoDB;
  
  CREATE TABLE SpotifyClone.album(
      album_id INT PRIMARY KEY AUTO_INCREMENT,
      album_nome VARCHAR(50) NOT NULL,
	  artista_id INT NOT NULL,
      CONSTRAINT FK_id_artista_album FOREIGN KEY(artista_id) REFERENCES artista(artista_id)
  ) engine = InnoDB;
  
    CREATE TABLE SpotifyClone.cancao(
      cancao_id INT PRIMARY KEY AUTO_INCREMENT,
      cancao_nome VARCHAR(50) NOT NULL,
      duracao_segundos INT NOT NULL,
      ano_lancamento YEAR NOT NULL,
      album_id INT NOT NULL,
      CONSTRAINT FK_id_album FOREIGN KEY(album_id) REFERENCES album(album_id)
  ) engine = InnoDB;
  
      CREATE TABLE SpotifyClone.historico_de_reproducao(
      usuario_id INT NOT NULL,
      cancao_id INT NOT NULL,
      data_reproducao DATETIME NOT NULL,
      CONSTRAINT PRIMARY KEY(usuario_id, cancao_id),
      CONSTRAINT FK_id_usuario FOREIGN KEY(usuario_id) REFERENCES usuario(usuario_id),
      CONSTRAINT FK_id_cancao FOREIGN KEY(cancao_id) REFERENCES cancao(cancao_id)
  ) engine = InnoDB;
  
  
  INSERT INTO SpotifyClone.plano(plano_nome, plano_valor) 
  VALUES('gratuito', 0.00),
        ('familiar', 7.99),
        ('universitario', 5.99),
        ('pessoal', 6.99);
        
  INSERT INTO SpotifyClone.usuario(usuario_nome, usuario_idade, data_assinatura, plano_id) 
  VALUES('Barbara Liskov', 82, '2019-10-20', 1),
        ('Robert Cecil Martin', 58, '2017-01-06', 1),
        ('Ada Lovelace', 37, '2017-12-30', 2),
		    ('Martin Fowler', 46, '2017-01-17', 2),
        ('Sandi Metz', 58, '2018-04-29', 2),
		    ('Paulo Freire', 19, '2018-02-14', 3),
        ('Bell Hooks', 26, '2018-01-05', 3),
		    ('Christopher Alexander', 85, '2019-06-05', 4),
        ('Judith Butler', 45, '2020-05-13', 4),
        ('Jorge Amado', 58, '2017-02-17', 4);
        
  INSERT INTO SpotifyClone.artista(artista_nome) 
  VALUES('Beyoncé'),
        ('Queen'),
        ('Elis Regina'),
		    ('Baco Exu do Blues'),
        ('Blind Guardian'),
        ('Nina Simone');
        
  INSERT INTO SpotifyClone.usuario_seguindo_artista(usuario_id, artista_id) 
  VALUES(1, 1),
        (1, 2),
        (1, 3),
		    (2, 1),
        (2, 3),
		    (3, 2),
        (4, 4),
		    (5, 5),
        (5, 6),
        (6, 6),
        (6, 1),
        (7, 6),
        (9, 3),
        (10, 2);
        
  INSERT INTO SpotifyClone.album(album_nome, artista_id) 
  VALUES('Renaissance', 1),
        ('Jazz', 2),
        ('Hot Space', 2),
		    ('Falso Brilhante', 3),
        ('Vento de Maio', 3),
        ('QVVJFA?', 4),
        ('Somewhere Far Beyond', 5),
		    ('I Put A Spell On You', 6);
        
  INSERT INTO SpotifyClone.cancao(cancao_nome, duracao_segundos, ano_lancamento, album_id) 
  VALUES('BREAK MY SOUL', 279, 2022, 1),
        ('VIRGO’S GROOVE', 369, 2022, 1),
        ('ALIEN SUPERSTAR', 116, 2022, 1),
		    ('Don’t Stop Me Now', 203, 1978, 2),
        ('Under Pressure', 152, 1982, 3),
		    ('Como Nossos Pais', 105, 1998, 4),
        ('O Medo de Amar é o Medo de Ser Livre', 207, 2001, 5),
		    ('Samba em Paris', 267, 2003, 6),
        ('The Bard’s Song', 244, 2007, 7),
        ('Feeling Good', 100, 2012, 8);
        
  INSERT INTO SpotifyClone.historico_de_reproducao(usuario_id, cancao_id, data_reproducao) 
  VALUES(1, 8, '2022-02-28 10:45:55'),
        (1, 2, '2020-05-02 05:30:35'),
        (1, 10, '2020-03-06 11:22:33'),
		    (2, 10, '2022-08-05 08:05:17'),
        (2, 7, '2020-01-02 07:40:33'),
		    (3, 10, '2020-11-13 16:55:13'),
        (3, 2, '2020-12-05 18:38:30'),
		    (4, 8, '2021-08-15 17:10:10'),
        (5, 8, '2022-01-09 01:44:33'),
        (5, 5, '2020-08-06 15:23:43'),
        (6, 7, '2017-01-24 00:31:17'),
		    (6, 1, '2017-10-12 12:35:20'),
        (7, 4, '2011-12-15 22:30:49'),
		    (8, 4, '2012-03-17 14:56:41'),
        (9, 9, '2022-02-24 21:14:22'),
        (10, 3, '2015-12-13 08:30:22');
