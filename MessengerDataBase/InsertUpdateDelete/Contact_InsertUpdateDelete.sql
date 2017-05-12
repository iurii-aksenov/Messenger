USE [MessengerDb]
GO
SET IDENTITY_INSERT [dbo].[Contact] ON
GO
INSERT INTO [dbo].[Contact]
([ContactId],[FirstName],[SecondName],[MiddleName],[Sex],[BirthDate],[Email], [Phone], [CreationDate],[ModificationDate]) VALUES
 (1, '�����',		'���������',	'����������',		'woman',	'19900507','spell@yandex.ru',		'89001805101',	'20150507', '20150507')
,(2, '�����',		'�������',		'�������������',	'man',		'19880604','curse@mail.ru',			'89001805102',	'20160209', '20160209')
,(3, '�������',		'��������',		'����������',		'man',		'19950728', 'district@hotmail.com',	'89001805103',	'20130610', '20130610')
,(4, '���������',	'�������',		'����������',		'man',		'19921209','lady@list.ru',			'89001805104',	'20110306', '20110306')
,(5, '����������',	'����',			'���������',		'man',		'19990507','treat@mail.ru',			'89001805105',	'20160212', '20160212')
,(6, '�������',		'�������',		'�����������',		'woman',	'19980507', 'silk@hotmail.com',		'89001805106',	'20140712', '20140712')
,(7, '����',		'��������',		'�����������',		'man',		'19400601','life@mail.ru',			'89001805107',	'20151028', '20151028')
,(8, '�������',		'������',		'�����������',		'man',		'19940915','sandwich@mail.ru',		'89001805108',	'20130512', '20130512')
,(9, '�������',		'�������',		'�������������',	'woman',	'19931010','glow@yandex.ru',		'89001805109',	'20130507', '20130507')
,(10,'������',		'�����',		'����������',		'man',		'19991120','respect@hotmail.com',	'89001805110',	'20160202', '20160202')
,(11,'�����',		'�������-������', '����������',		'man',		'19980707','his@yandex.ru',			'89001805111',	'20120611', '20120611')
,(12,'�����',		'����������',	'�����������',		'man',		'19910220', 'heel@yandex.ru',		'89001805112',	'20150903', '20150903')
,(13,'����',		'���������',	'����������',		'man',		'20100220','planet@gmail.com',		'89001805113',	'20150714', '20150714')
,(14,'�����',		'������',		'������������',		'man',		'20080319','hallway@list.ru',		'89001805114',	'20111208', '20111208')
,(15,'����',		'��������',		'��������',		'man',		'20010817','drill@yandex.ru',		'89001805115',	'20130107', '20130107')
,(16,'�����',		'������',		'�����������',		'woman',	'19980720','stand@gmail.com',		'89001805116',	'20101228', '20101228')
,(17,'�����',		'���������',	'������������',		'man',		'19790612','she@yandex.ru',			'89001805117',	'20101105', '20101105')
,(18,'������',		'��������',		'����������',		'woman',	'19921113','split@gmail.com',		'89001805118',	'20100506', '20100506')
,(19,'�����',		'��������',		'����������',		'man',		'20021118','guard@list.ru',			'89001805119',	'20111009', '20111009')
,(20,'�������',		'����������',	'��������',			'woman',	'20051108','pearl@mail.ru',			'89001805120',	'20110421', '20110421')
,(21,'��������',	'�������',		'�����������',		'woman',	'20061103','curl@hotmail.com',		'89001805121',	'20100814', '20100814')
,(22,'������',		'����������',	'������������',		'woman',	'20041102','rear@mail.ru',			'89001805122',	'20100818', '20100818')
,(23,'�������',		'������',		'����������',		'woman',	'20081117','spring@hotmail.com',	'89001805123',	'20160213', '20160213')
,(24,'���������',	'�������',		'�����������',		'woman',	'20091120','command@gmail.com',		'89001805124',	'20151119', '20151119')
,(25,'�����',		'������',		'���������',		'man',		'20101114','sergeant@mail.ru',		'89001805125',	'20140115', '20140115')
,(26,'�����',		'�����������',	'���������������',	'man',		'19931127','click@yandex.ru',		'89001805126',	'20140206', '20140206')
,(27,'������',		'������-�����', '����������',		'woman',	'19981128','bank@mail.ru',			'89001805127',	'20111104', '20111104')
,(28,'������',		'�����������������', '���������',	'man',		'19981128','drop@list.ru',			'89001805128',	'20160219', '20160219')
,(29,'�����',		'����',			'���������',		'woman',	'19991221','retreat@yandex.ru',		'89001805129',	'20120828', '20120828')
,(30,'���������',	'������',		'���������',		'woman',	'19991014','blank@mail.ru',			'89001805130',	'20140315', '20140315')
,(31,'�����',		'�����',		'����������',		'man',		'19950116','shot@list.ru',			'89001805131',	'20130914', '20130914')
,(32,'�������',		'��������',		'����������',		'woman',	'19960215','violet@hotmail.com',	'89001805132',	'20160104', '20160104')
,(33,'������',		'�������',		'�����������',		'woman',	'19970322','soldier@hotmail.com',	'89001805133',	'20110717', '20110717')
,(34,'�������',		'������',		'��������',			'man',		'19950421','skull@hotmail.com',		'89001805134',	'20120925', '20120925')
GO

DELETE [dbo].[Contact]
WHERE [FirstName] = '�������'
GO

INSERT INTO [dbo].[Contact]
([ContactId],[FirstName],[SecondName],[MiddleName],[Sex],[BirthDate],[Email], [Phone], [CreationDate],[ModificationDate]) VALUES
(34,'�������',		'������',		'��������',			'man',		'19950421','skull@hotmail.com',		'89001805134',	'20120925', '20120925')
GO

UPDATE [dbo].[Contact]
SET [FirstName] = '���������'
WHERE [FirstName] = '������'
GO

SET IDENTITY_INSERT [dbo].[Contact] OFF
GO
