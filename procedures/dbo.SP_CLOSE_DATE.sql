use dtb_prj
go

CREATE OR ALTER PROC dbo.SP_CLOSE_DATE(
	@DATE date
)
AS
BEGIN

	DECLARE
		@WLG_SISABER VARCHAR(1),
		@WLG_SISFECH VARCHAR(1),
		@WLG_ABERINI VARCHAR(1),
		@WLG_FECHINI VARCHAR(1),
		@COUNT INT,
		@COUNTERROR INT


	SELECT @WLG_SISABER = LG_SISABER,
		   @WLG_SISFECH = LG_SISFECH,
		   @WLG_ABERINI = LG_ABERINI,
		   @WLG_FECHINI = LG_FECHINI
	FROM CG_DATAS WHERE DT_SISTEMA = @DATE

	/*FAZ AS VERIFICA��ES PARA INICIAR O FECHAMENTO DE SISTEMA DI�RIO*/
	IF @WLG_SISABER <> 'T'
		SET @COUNT = 1

	IF @WLG_SISFECH <> 'F'
		SET @COUNT = 1

	IF @WLG_ABERINI <> 'F'
		SET @COUNT = 1

	IF @WLG_FECHINI <> 'F'
		SET @COUNT = 1


	IF @COUNT = 0
	BEGIN

		DELETE FROM TS_PROCE

		UPDATE CG_DATAS 
		SET LG_FECHINI = 'T' 
		WHERE DT_SISTEMA = @DATE

		SET @COUNTERROR = (SELECT COUNT(1) FROM TS_PROCE WHERE DT_ERROPRO IS NOT NULL AND DS_ERROPRO IS NOT NULL)
		
		IF @COUNTERROR = 0
			EXEC dbo.SP_OCV1_GENERATE_MOCON @DATE


		UPDATE CG_DATAS 
		SET LG_FECHINI = 'F',
		    LG_SISFECH = 'T'
		WHERE DT_SISTEMA = @DATE

		EXEC SP_CHANGE_DATE_SYSTEM @DATE

	END

END