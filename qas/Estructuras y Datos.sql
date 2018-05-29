select * from HRM10001;
insert into HRM10001 values ('ES','Español');
insert into HRM10001 values ('EN','English');

select * from HRM10003 order by Mdl_Secuencia;

insert into HRM10003 values ('FavUsr',50,'fa fa-star');
insert into HRM10003 values ('CnfGrl',100,'fa fa-wrench');
insert into HRM10003 values ('DisOrg',200,'fa fa-sitemap');
insert into HRM10003 values ('RecSel',300,'fa fa-search');
insert into HRM10003 values ('InvRH',400,'fa fa-archive');
insert into HRM10003 values ('CapDes',500,'fa fa-graduation-cap');
insert into HRM10003 values ('CliLab',600,'fa fa-sliders');
insert into HRM10003 values ('Evl360',700,'fa fa-street-view');
insert into HRM10003 values ('EvPADE',800,'fa fa-bullseye');
insert into HRM10003 values ('CapHum',900,'fa fa-diamond');
insert into HRM10003 values ('GesVac',1000,'fa fa-calendar');
insert into HRM10003 values ('PrtEmp',1100,'fa fa-feed');
insert into HRM10003 values ('IndDes',1200,'fa fa fa-pie-chart');
insert into HRM10003 values ('GesCnt',1300,'fa fa-newspaper-o');



insert into HRM10002 values('MenMdl','ES','FavUsr','Favoritos');
insert into HRM10002 values('MenMdl','ES','CnfGrl','Ajustes');
insert into HRM10002 values('MenMdl','ES','DisOrg','Organización');
insert into HRM10002 values('MenMdl','ES','RecSel','Reclutamiento');
insert into HRM10002 values('MenMdl','ES','InvRH','Inventario RH');
insert into HRM10002 values('MenMdl','ES','CapDes','Capacitación');
insert into HRM10002 values('MenMdl','ES','CliLab','Clima Laboral');
insert into HRM10002 values('MenMdl','ES','Evl360','Evaluación 360°');
insert into HRM10002 values('MenMdl','ES','EvPADE','PADE');
insert into HRM10002 values('MenMdl','ES','CapHum','Capital Humano');
insert into HRM10002 values('MenMdl','ES','GesVac','Vacaciones');
insert into HRM10002 values('MenMdl','ES','PrtEmp','Portal Empleados');
insert into HRM10002 values('MenMdl','ES','IndDes','Indicadores');
insert into HRM10002 values('MenMdl','ES','GesCnt','Contenido');

insert into HRM10002 values('MenMdl','EN','FavUsr','Favorites');
insert into HRM10002 values('MenMdl','EN','CnfGrl','Settings');
insert into HRM10002 values('MenMdl','EN','DisOrg','Organization');
insert into HRM10002 values('MenMdl','EN','RecSel','Recruitment');
insert into HRM10002 values('MenMdl','EN','InvRH','HR Inventory');
insert into HRM10002 values('MenMdl','EN','CapDes','Training');
insert into HRM10002 values('MenMdl','EN','CliLab','Working Environment');
insert into HRM10002 values('MenMdl','EN','Evl360','360° Evaluation');
insert into HRM10002 values('MenMdl','EN','EvPADE','PADE');
insert into HRM10002 values('MenMdl','EN','CapHum','Human Capital');
insert into HRM10002 values('MenMdl','EN','GesVac','Leaves');
insert into HRM10002 values('MenMdl','EN','PrtEmp','Employee Portal');
insert into HRM10002 values('MenMdl','EN','IndDes','KPIs');
insert into HRM10002 values('MenMdl','EN','GesCnt','Content');


select * from HRM10002 order by Trd_ElementoID, Trd_IdiomaID;

insert into HRM10002 values('MenSup','EN','NavRMenu0010','Profile');
insert into HRM10002 values('MenSup','ES','NavRMenu0010','Perfil');
insert into HRM10002 values('MenSup','EN','NavRMenu0020','Log Out');
insert into HRM10002 values('MenSup','ES','NavRMenu0020','Salir');

insert into HRM10002 values('MenTrn','EN','CnfGrl0100','Users');
insert into HRM10002 values('MenTrn','ES','CnfGrl0100','Usuarios');


select * from HRM10004;

insert into HRM10004 values('CnfGrl','CnfGrl0100',100,'Hrm_Usuarios.asp');


select * from HRM10008;

insert into HRM10005 values('54548','Fernando Ladron de Guevara Perez','fernando.ladron@stabilit.com','M1712#2304','images/emp/54548.jpg');


insert into HRM10006 values('CnfGrl','CnfGrl0100','54548');


select * from HRM10005 where Usr_UserID = '54548' and Usr_Password = 'M1712#2304'

insert into HRM10001 values('ES','Español','images/Spain.png')
insert into HRM10001 values('EN','English','images/United-Kingdom.png')

select * from HRM10002;
insert into HRM10002 values('MenSup','EN','NavRMenu0030','Home');
insert into HRM10002 values('MenSup','ES','NavRMenu0030','Inicio');


select * from HRM10002;

select * from HRM10003;
select * from HRM10004;
select * from HRM10005;
select * from HRM10006;

insert into HRM10004 values('DisOrg','DisOrg0100',100,'Hrm_Companias.asp');
insert into HRM10006 values('DisOrg','DisOrg0100','54548');

insert into HRM10002 values('MenTrn','ES','DisOrg0100','Compañias');
insert into HRM10002 values('MenTrn','EN','DisOrg0100','Companies');

insert into HRM10002 values('DisOrg0100','ES','TitPri','Compañias');
insert into HRM10002 values('DisOrg0100','EN','TitPri','Companies');
insert into HRM10002 values('DisOrg0100','ES','SubTit','');
insert into HRM10002 values('DisOrg0100','EN','SubTit','');
insert into HRM10002 values('DisOrg0100','ES','Tab001','Registradas');
insert into HRM10002 values('DisOrg0100','EN','Tab001','Registered');
insert into HRM10002 values('DisOrg0100','ES','Tab002','Agregar');
insert into HRM10002 values('DisOrg0100','EN','Tab002','Add');

insert into HRM10002 values('DisOrg0100','ES','Tb1Hd1','Nivel');
insert into HRM10002 values('DisOrg0100','EN','Tb1Hd1','Level');
insert into HRM10002 values('DisOrg0100','ES','Tb1Hd2','Razon Social');
insert into HRM10002 values('DisOrg0100','EN','Tb1Hd2','Business Name');
insert into HRM10002 values('DisOrg0100','ES','Tb1Hd3','Ciudad');
insert into HRM10002 values('DisOrg0100','EN','Tb1Hd3','City');
insert into HRM10002 values('DisOrg0100','ES','Tb1Hd4','Estado');
insert into HRM10002 values('DisOrg0100','EN','Tb1Hd4','State');
insert into HRM10002 values('DisOrg0100','ES','Tb1Hd5','Pais');
insert into HRM10002 values('DisOrg0100','EN','Tb1Hd5','Country');

insert into HRM10002 values('DisOrg0100','ES','Fr1Lb1','Clave');
insert into HRM10002 values('DisOrg0100','EN','Fr1Lb1','Id');
insert into HRM10002 values('DisOrg0100','ES','Fr1Ph1','Clave de Compañia');
insert into HRM10002 values('DisOrg0100','EN','Fr1Ph1','Company Id');

insert into HRM10002 values('DisOrg0100','ES','Fr1Lb2','Pertenece a');
insert into HRM10002 values('DisOrg0100','EN','Fr1Lb2','Parent ID');
insert into HRM10002 values('DisOrg0100','ES','Fr1Ph2','0 - Principal');
insert into HRM10002 values('DisOrg0100','EN','Fr1Ph2','0 - Main');

insert into HRM10002 values('DisOrg0100','ES','Fr1Lb3','Razon Social');
insert into HRM10002 values('DisOrg0100','EN','Fr1Lb3','Business Name');
insert into HRM10002 values('DisOrg0100','ES','Fr1Ph3','Nombre de la Empresa');
insert into HRM10002 values('DisOrg0100','EN','Fr1Ph3','Business Name');

insert into HRM10002 values('DisOrg0100','ES','Fr1Lb4','RFC');
insert into HRM10002 values('DisOrg0100','EN','Fr1Lb4','Tax Id');
insert into HRM10002 values('DisOrg0100','ES','Fr1Ph4','Registro Federal de Contribuyentes');
insert into HRM10002 values('DisOrg0100','EN','Fr1Ph4','Tax Id');

insert into HRM10002 values('DisOrg0100','ES','Fr1Lb5','Direccion 1');
insert into HRM10002 values('DisOrg0100','EN','Fr1Lb5','Address 1');
insert into HRM10002 values('DisOrg0100','ES','Fr1Ph5','Calle No Exterior / Interior');
insert into HRM10002 values('DisOrg0100','EN','Fr1Ph5','Address 1');

insert into HRM10002 values('DisOrg0100','ES','Fr1Lb6','Direccion 2');
insert into HRM10002 values('DisOrg0100','EN','Fr1Lb6','Address 2');
insert into HRM10002 values('DisOrg0100','ES','Fr1Ph6','Colonia, Entre Calles');
insert into HRM10002 values('DisOrg0100','EN','Fr1Ph6','Address 2');

insert into HRM10002 values('DisOrg0100','ES','Fr1Lb7','Codigo Postal');
insert into HRM10002 values('DisOrg0100','EN','Fr1Lb7','Zip Code');
insert into HRM10002 values('DisOrg0100','ES','Fr1Ph7','Codigo Postal');
insert into HRM10002 values('DisOrg0100','EN','Fr1Ph7','Zip Code');

insert into HRM10002 values('DisOrg0100','ES','Fr1Lb8','Municipio');
insert into HRM10002 values('DisOrg0100','EN','Fr1Lb8','Municipality');
insert into HRM10002 values('DisOrg0100','ES','Fr1Ph8','Delegación / Municipio');
insert into HRM10002 values('DisOrg0100','EN','Fr1Ph8','Municipality');

insert into HRM10002 values('DisOrg0100','ES','Fr1Lb9','Ciudad');
insert into HRM10002 values('DisOrg0100','EN','Fr1Lb9','City');
insert into HRM10002 values('DisOrg0100','ES','Fr1Ph9','Ciudad');
insert into HRM10002 values('DisOrg0100','EN','Fr1Ph9','City');

insert into HRM10002 values('DisOrg0100','ES','Fr1Lb10','Estado');
insert into HRM10002 values('DisOrg0100','EN','Fr1Lb10','State');
insert into HRM10002 values('DisOrg0100','ES','Fr1Ph10','Estado');
insert into HRM10002 values('DisOrg0100','EN','Fr1Ph10','State');

insert into HRM10002 values('DisOrg0100','ES','Fr1Lb11','Pais');
insert into HRM10002 values('DisOrg0100','EN','Fr1Lb11','Country');
insert into HRM10002 values('DisOrg0100','ES','Fr1Ph11','Pais');
insert into HRM10002 values('DisOrg0100','EN','Fr1Ph11','Country');

insert into HRM10002 values('DisOrg0100','ES','SmBtn1','Guardar');
insert into HRM10002 values('DisOrg0100','EN','SmBtn1','Submit');

insert into HRM10002 values('DisOrg0100','ES','FrLgn1','* Requerido');
insert into HRM10002 values('DisOrg0100','EN','FrLgn1','* Required');

insert into HRM10002 values('DisOrg0100','ES','MsgAl1','La Compañia que ingresó ya Existe');
insert into HRM10002 values('DisOrg0100','EN','MsgAl1','The Company ID is already used');

insert into HRM10002 values('DisOrg0100','ES','MsgAl2','No fué posible Actualizar la información, por favor notifique al Admistrador');
insert into HRM10002 values('DisOrg0100','EN','MsgAl2','Unable to update the information');

select * from HRM10002 where Trd_TransaccionID = 'DisOrg0100' and Trd_ElementoID = 'Fr1Lb6'
delete HRM10002 where Trd_TransaccionID = 'DisOrg0100' and Trd_ElementoID = 'Fr1Ph5'

select Cpy_CompaniaID from HRM10201 where Cpy_CompaniaID = 'a'














insert into HRM10201 values ('a', '0', 'a', 'a', '', 'a', 'a', 'a', 'a', 'a', 'a', 'a')


update HRM10005 set Usr_Password = '54548' where Usr_UserID = '54548'



update HRM10201 set Cpy_Nivel = '0', Cpy_RazonSocial = 'b', Cpy_RFC = 'a', Cpy_Direccion1 = 'a', Cpy_Direccion2 = 'a', Cpy_CodigoPostal = 'a', Cpy_Municipio = 'a', Cpy_Ciudad = 'a', Cpy_Estado = 'a', Cpy_Pais = 'a' where Cpy_CompaniaID = 'a'


select * from HRM10008