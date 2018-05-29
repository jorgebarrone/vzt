insert into HRM10004 values('DisOrg','DisOrg0800',800,'Hrm_DescPuestos.asp');
insert into HRM10006 values('DisOrg','DisOrg0800','54548')

insert into HRM10002 values('MenTrn','ES','DisOrg0800','Descripciones de Puestos');
insert into HRM10002 values('MenTrn','EN','DisOrg0800','Job Descriptions');

select * from HRM10002 where Trd_TransaccionID = 'DisOrg0800' and Trd_ElementoID = 'Tab001'
delete HRM10002 where Trd_TransaccionID = 'DisOrg0800' and Trd_ElementoID = 'Tab001'



insert into HRM10002 values('DisOrg0800','ES','TitPri','Descripcion de Puesto');
insert into HRM10002 values('DisOrg0800','EN','TitPri','Job Description');

insert into HRM10002 values('DisOrg0800','ES','SubTit','');
insert into HRM10002 values('DisOrg0800','EN','SubTit','');

insert into HRM10002 values('DisOrg0800','ES','Tab001','Registradas');
insert into HRM10002 values('DisOrg0800','EN','Tab001','Registered');

insert into HRM10002 values('DisOrg0800','ES','Tab002','Agregar');
insert into HRM10002 values('DisOrg0800','EN','Tab002','Add');

insert into HRM10002 values('DisOrg0800','ES','Tb1Hd1','Compania');
insert into HRM10002 values('DisOrg0800','EN','Tb1Hd1','Company ID');

insert into HRM10002 values('DisOrg0800','ES','Tb1Hd2','Razon Social');
insert into HRM10002 values('DisOrg0800','EN','Tb1Hd2','Company Name');

insert into HRM10002 values('DisOrg0800','ES','Tb1Hd3','Puesto');
insert into HRM10002 values('DisOrg0800','EN','Tb1Hd3','Job Position ID');

insert into HRM10002 values('DisOrg0800','ES','Tb1Hd4','Descripcion');
insert into HRM10002 values('DisOrg0800','EN','Tb1Hd4','Job Position Name');




insert into HRM10002 values('DisOrg0800','ES','Fr1Lb1','Compañia');
insert into HRM10002 values('DisOrg0800','EN','Fr1Lb1','Company');
insert into HRM10002 values('DisOrg0800','ES','Fr1Ph1','Seleccione la Compañía');
insert into HRM10002 values('DisOrg0800','EN','Fr1Ph1','Select Company');

insert into HRM10002 values('DisOrg0800','ES','Fr1Lb2','Puesto');
insert into HRM10002 values('DisOrg0800','EN','Fr1Lb2','Job Position');
insert into HRM10002 values('DisOrg0800','ES','Fr1Ph2','Seleccione el Puesto');
insert into HRM10002 values('DisOrg0800','EN','Fr1Ph2','Select Job Position');

insert into HRM10002 values('DisOrg0800','ES','Fr1Lb3','Formacion');
insert into HRM10002 values('DisOrg0800','EN','Fr1Lb3','Background');
insert into HRM10002 values('DisOrg0800','ES','Fr1Ph3','Formacion');
insert into HRM10002 values('DisOrg0800','EN','Fr1Ph3','Background');

insert into HRM10002 values('DisOrg0800','ES','Fr1Lb4','Educacion');
insert into HRM10002 values('DisOrg0800','EN','Fr1Lb4','Education');
insert into HRM10002 values('DisOrg0800','ES','Fr1Ph4','Educacion');
insert into HRM10002 values('DisOrg0800','EN','Fr1Ph4','Education');

insert into HRM10002 values('DisOrg0800','ES','Fr1Lb5','Experiencia');
insert into HRM10002 values('DisOrg0800','EN','Fr1Lb5','Experience');
insert into HRM10002 values('DisOrg0800','ES','Fr1Ph5','Experiencie');
insert into HRM10002 values('DisOrg0800','EN','Fr1Ph5','Experience');

insert into HRM10002 values('DisOrg0800','ES','Fr1Lb6','Habilidades');
insert into HRM10002 values('DisOrg0800','EN','Fr1Lb6','Skills');
insert into HRM10002 values('DisOrg0800','ES','Fr1Ph6','Habilidades');
insert into HRM10002 values('DisOrg0800','EN','Fr1Ph6','Skills');

insert into HRM10002 values('DisOrg0800','ES','Fr1Lb7','Nivel');
insert into HRM10002 values('DisOrg0800','EN','Fr1Lb7','Level');
insert into HRM10002 values('DisOrg0800','ES','Fr1Ph7','Seleccione el Nivel');
insert into HRM10002 values('DisOrg0800','EN','Fr1Ph7','Select Level');

insert into HRM10002 values('DisOrg0800','ES','Fr1Lb8','Descripcion');
insert into HRM10002 values('DisOrg0800','EN','Fr1Lb8','Description');
insert into HRM10002 values('DisOrg0800','ES','Fr1Ph8','Descripcion del Puesto');
insert into HRM10002 values('DisOrg0800','EN','Fr1Ph8','Job Description');

insert into HRM10002 values('DisOrg0800','ES','SmBtn1','Agregar');
insert into HRM10002 values('DisOrg0800','EN','SmBtn1','Add');

insert into HRM10002 values('DisOrg0800','ES','SmBtn2','Eliminar Lineas Seleccionadas');
insert into HRM10002 values('DisOrg0800','EN','SmBtn2','Delete Selected Records');

insert into HRM10002 values('DisOrg0800','ES','FrLgn1','* Requerido');
insert into HRM10002 values('DisOrg0800','EN','FrLgn1','* Required');


select * from HRM10002 where Trd_TransaccionID = 'DisOrg0800'
delete HRM10002 where Trd_TransaccionID = 'DisOrg0800'



select * from HRM10008







		Select  2017,	
				'5000',	
				Emp_CompaniaID,
				Emp_EmpleadoID,
				Pcy_ParametroID,
				0

		From	HRM10220, HRM105A1
		where Pcy_CompaniaID = Emp_CompaniaID
		

		Select  2017,							        -- Ejercicio
				'5000',									-- Corporativo
				Emp_CompaniaID,
				Emp_EmpleadoID,
				Psf_ParametroID,
				0

		From	HRM10220, HRM105A0
		where Psf_RegistroID = 'PADESEMAFOROS'

		select * from HRM10220 where Emp_CompaniaID = '12'









select * from HRM10002 where Trd_TransaccionID = 'EvPADE0060'