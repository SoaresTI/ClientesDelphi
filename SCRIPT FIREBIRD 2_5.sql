
/******************************************************************************/
/****                               Domains                                ****/
/******************************************************************************/

CREATE DOMAIN NEW_DOMAIN AS
VARCHAR(12);



/******************************************************************************/
/****                              Generators                              ****/
/******************************************************************************/

CREATE GENERATOR GEN_TB_CLIENTES_ID;
SET GENERATOR GEN_TB_CLIENTES_ID TO 0;

CREATE GENERATOR GEN_TB_TELEFONES_ID;
SET GENERATOR GEN_TB_TELEFONES_ID TO 0;



/******************************************************************************/
/****                                Tables                                ****/
/******************************************************************************/



CREATE TABLE TB_CLIENTES (
    CLI_ID             INTEGER NOT NULL,
    CLI_TIPO           VARCHAR(8) DEFAULT 'FISICA',
    CLI_DOCUMENTO      CHAR(14) NOT NULL,
    CLI_DATA_CADASTRO  DATE,
    CLI_ATIVO          CHAR(3) DEFAULT 'SIM',
    CLI_LAGRADOURO     VARCHAR(200),
    CLI_NUMERO         VARCHAR(10),
    CLI_CEP            CHAR(8),
    CLI_BAIRRO         VARCHAR(100),
    CLI_CIDADE         VARCHAR(50),
    CLI_ESTADO         CHAR(2),
    CLI_PAIS           VARCHAR(20),
    CLI_NOME           VARCHAR(50) NOT NULL,
    CLI_RG_IE          NEW_DOMAIN
);

CREATE TABLE TB_TELEFONES (
    TEL_ID        INTEGER NOT NULL,
    TEL_CLI_ID    INTEGER,
    TEL_TELEFONE  VARCHAR(16)
);



/******************************************************************************/
/****                             Primary keys                             ****/
/******************************************************************************/

ALTER TABLE TB_CLIENTES ADD CONSTRAINT PK_TB_CLIENTES PRIMARY KEY (CLI_ID)
USING INDEX PK_CLI_ID;
ALTER TABLE TB_TELEFONES ADD CONSTRAINT PK_TB_TELEFONES PRIMARY KEY (TEL_ID)
USING INDEX PK_TEL_ID;


/******************************************************************************/
/****                               Indices                                ****/
/******************************************************************************/

CREATE INDEX TB_TELEFONES_IDX1 ON TB_TELEFONES (TEL_CLI_ID);


/******************************************************************************/
/****                               Triggers                               ****/
/******************************************************************************/



SET TERM ^ ;



/******************************************************************************/
/****                         Triggers for tables                          ****/
/******************************************************************************/



/* Trigger: TB_CLIENTES_BI */
CREATE TRIGGER TB_CLIENTES_BI FOR TB_CLIENTES
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW.CLI_ID IS NULL) THEN
    NEW.CLI_ID = GEN_ID(GEN_TB_CLIENTES_ID,1);
END
^

/* Trigger: TG_ID_TELEFONES */
CREATE TRIGGER TG_ID_TELEFONES FOR TB_TELEFONES
ACTIVE BEFORE INSERT POSITION 0
AS
begin
  new.tel_id = gen_id(gen_tb_telefones_id,1);
end
^
SET TERM ; ^

