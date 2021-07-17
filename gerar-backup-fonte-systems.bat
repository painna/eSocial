cd "C:\Users\Isaque\Documents\Projetos\GeraSysTI\eSocial\trunk"
@echo off
@echo Gerando backup do projeto eSocial . . .
@echo =============================================================================================================
pause
aws configure set AWS_ACCESS_KEY_ID AKIAVVLSE3C3HSITQCCO
aws configure set AWS_SECRET_ACCESS_KEY 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
aws s3 sync . s3://aws-gerasys-ti-projeto-backups-esocial --exclude "*.~*" --exclude "*.exe" --exclude "*.dcu" --exclude "*.obj" --exclude "*.ddp" --exclude "*.exe" --exclude ".bin/*" --exclude ".dcu/*" --exclude "bin/*" --exclude "dcu/*" --exclude "*/modules/*" --exclude ".github/*" --exclude "exe/upx391w/*" --exclude "exe/Win32/*"
@echo =============================================================================================================
pause