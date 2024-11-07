
-- ilk kodumuzu yazalim.

-- ilk database olusturuldu

create database FirstDatabase

-- kullanilacak database secildi

use FirstDatabase
 
create table Personel(

	Id int,

	Ad nvarchar(20),

	Soyad nvarchar(20),

	TC nvarchar(11),

	Eposta nvarchar(30),

	DogumTarihi DATETIME
)
 
-- olusturdugumuz tabloya veri girme islemi

insert into Personel(Id,Ad,Soyad,TC,Eposta) values(1,'Kerem', 'Ayaz', '12345678901', 'test@kerem.com')

-- bir veri daha girelim

insert into Personel(Id,Ad,Soyad,TC,Eposta) values(2,'Selcuk', 'Dinc','10987654321', 'test@selcuk.com')

-- ekledigimiz verilere bakalim

select Id,Ad,Soyad,TC,Eposta from Personel

-- sadece add ve eposta kolonlarini alalim

select Ad,Eposta from Personel

-- bir veri yiginini sorgulamak icin select keywordu kullanilir,

-- from keywordu verilerin hangi tablodan getirilecegini belirler.

 -- Oluşturduğum tabloyu silmek için !! 
 --drop table Personel
 -- bu komut ile oluşturduğunuz tablonun tüm kolonları ve tüm verileri silinir!!

 -- Oluşturmuş olduğunuz database'i silmek için
 --drop DATABASE FirstDatabase


-- Where komutu 
-- Bir sorguya koşul ekler
-- Örnek : 
-- 1 nolu idli personeli getirelim 
select Id,Ad from Personel where Id=1
-- where komutunu konuşalım : where komutu bir veri yığını içerisindeki veriler arasında belirli şartı sağlayan verilerin getirilmesini sağlar.

-- Adı Kerem olan personeller gelsin 

select Ad,Eposta from Personel where Ad='Selcuk'
-- where komutu ile Ad alanına göre arama yaptık, ad alanı metinsel bir kolon olduğu için, o alana verilen Selcuk değeri de, metinsel olacaktır
-- MSSQl'de metinsel veriler tek tırnak '' içerisinde yazılır

-- İki şarta göre veri getirmek 
-- EPosta alanı ve Ad Alanına göre veri getirmek  
select Id,Ad,Eposta from Personel where Ad='Kerem' or Eposta='test@selcuk.com' 
-- c# da gördüğümüz & ve || veya operatörü sql tarafında and ve or operatörü olarak kullanılır!!
-- Yukarıdaki sorguda, Ad alanı Kerem veya EPosta alanı test@selcuk.com olan personelleri listeledik!!

-- Personel tablomuza daha fazla veri girelim 

insert into Personel (Id,Ad,Soyad,EPosta) values (3,'Faruk','Uygur','faruk@faruk.com')

insert into Personel (Id,Ad,Soyad,EPosta) values (4,'Elif','Ergenç','elif.com')

insert into Personel (Id,Ad,Soyad,EPosta) values (5,'Ahmet','Demir','ahmetk@xxx.com')

insert into Personel (Id,Ad,Soyad,EPosta) values (6,'Nur','Erdoğan','nur@xx.com')

insert into Personel (Id,Ad,Soyad,EPosta) values (7,'Ferdi','Şahin','ferdi@xx.com')

insert into Personel (Id,Ad,Soyad,EPosta) values (8,'Banu','Avcı','banu@xxx.com')

insert into Personel (Id,Ad,Soyad,EPosta) values (9,'Melek','Turan','melekk@xxx.com')

insert into Personel (Id,Ad,Soyad,EPosta) values (10,'Dilek','Dinç','dilek@xxx.com')

insert into Personel (Id,Ad,Soyad,EPosta) values (11,'Derya','Bilgiç','derya@xxx.com')

insert into Personel (Id,Ad,Soyad,EPosta) values (12,'Hasan','İpekten','hasan@xxx.com')

-- listelemize bakalım 

select Id,Ad,EPosta,Maas from Personel
-- Tablodan veri silmek 
delete from Personel where Id=12

-- adı dilek olan personeli silelinm 
delete from Personel where Ad='Dilek'

-- Tablodaki bir veriyi güncellemek 
-- Id değeri 6 olan personelin eposta alanını güncelleyelim 
update  Personel set Eposta='yenieposta@x.com' where Id=6

-- iki kolonu birden güncelleme (Ad alanı Faruk olan personelin, Eposta değeri ve Ad değerini güncelleyelim )
update Personel set Eposta='faruk@yyy.com',Ad='Ömer' where Ad='Faruk'

-- Listedeki tüm personellin Eposta alanlarının başına birer a harfi ekleyelim 
update Personel set Eposta='a'+Eposta
-- update işlemini herhangi bir where şartı koymadığımız için, tüm personel listesi etkilendi!!
-- + operatörü c# da olduğu gibi, MSSQl'de de birleştirme işlemi yapar
-- Yukarıda, EPosta kolonu ile a harfi birleştirilip, tekrardan Eposta kolonu güncellendi!!


-- Personel tablosuna, Maas isimli bir kolon ekleyelim tipide int olsun
alter table Personel
add Maas int

-- Tüm personellere maaş verisini ekleyelim 
update Personel set Maas=10000

-- Id değeri 5 olan personelin maaşını %30 artıralım 
update Personel set Maas=Maas*1.30 where Id=5

-- Adı kerem olan personelin maaşına %20 indirim yapalım 
update Personel set Maas=Maas*0.8 where Ad='Kerem'


-- Update yaptığımızda, direk olarak tablo etkilenir!! +,*,- operatörünü select sorgusu içerisinde de yapabiliriz
-- Tüm personellerin maaşını %50 artıralım
select Ad,Maas*1.50 from Personel
-- Select sorgusu olduğu için veriler getirilirken ilgili matematiksel işlem yapılır, Personel tablosu verisi bundan etkilenmez

-- + operatörü iki metinsel kolon arasında kullanılsın 
select Ad+Eposta from Personel
-- yukarıdaki komut ile iki kolon tek kolona düştü iki kolondaki veriler birleştirildi

select 'X'+Ad from Personel


-- Sql Server Matematik Fonksiyonlar

-- Tabloki kayıt sayısını öğrenelim 
select Count(Ad) from Personel

-- Count fonksiyonuna where şartı ekleme
-- Ad alanı Selcuk olan kaç kişi var
select Count(Maas) from Personel where Ad='Selcuk' 
-- Count fonksiyonu vermiş olduğunuz tablodaki satır sayısını sayar!!
--Count fonksiyonunun içerisine vermiş olduğunuz kolon adı farketmez


-- Sum fonksiyonu :Sum Fonksiyonu parametre olarak aldığı kolon içerisindeki verileri toplar!!
-- 1 ve 5 id li personellerin maaşlarının toplamı nedir ? 
select Sum(Maas) from Personel where Id=1 or Id=5

-- = operatörünün yanında <,>,<=,>=,<> operatörleri kullanılır
-- 3 den büyük 6 dan küçük Id değerine sahip olan personellerin maaşlarının toplamı
select Sum(Maas) from Personel where Id>3 and Id<6

-- MAX Fonksiyonu : Verilen kolon içerisindeki en büyük değeri getirecektir

-- Personel tablosundaki en fazla maaş nedir  
select MAX(Maas) from Personel


-- Mın Fonksiyonu : Verilen kolon içerisindeki en küçük değeri getirir
select MIN(Maas) from Personel



-- AVG Fonksiyonu : Parametre olarak verilen kolonun değerinin ortalamasını alır
-- Personel tablosundaki maaşların ortalaması nedir ? 
select AVG(Maas) from Personel 


-- AVG olmadan ortalama nasıl bulunur
select Sum(Maas)/Count(Maas) from Personel
-- Şahinin isteği, en düşük maaşa sahip personel
-- Order by , Order By descending
-- Order by ve Order by descending sıralama ve tersten sıralama işlemi yapar!!

-- Örnek : Personel listesini Id alanına göre tersten listeleyelim 


select Id,Ad,Soyad,Eposta,Maas from Personel
-- bir tablonun tüm kolonlarını getirmek için, kolon adı yazmanıza gerek yoktur!!
select * from Personel


-- Order by Descending işlemine devam edelim
select * from Personel order by Id desc

-- ad alanına göre düzden sıralama yapalım 
select *from Personel order by Ad

-- Sorular : 
-- 
-- 6 numaralı personelin maaşına %50 zam yapalım
-- ıd değeri 2,6,9 olan personellerin id ve eposta alanlarını ekrana getirelim 
select Ad,Eposta from Personel where Id=2 or Id=6 or Id=9
-- Birden fazla filtre ekleyecekseniz

-- In keywordü (birden fazla filtre eklemek için kullanılır)
select Ad,EPosta from Personel where Id in(2,6,9)
-- Not In keyword'ü id değeri 2,6 ve 9 olmayan personeller
select Id,Ad,EPosta from Personel where Id not in (2,6,9)


--Id değeri 5 değerine eşit olmayan personelleri listeleyelim 
-- eşit değil operatörü <>
select Id,Ad,Soyad from Personel where Id<>5
-- bu sorguğu not in ile de yapabiliriz

--!= sql de ki <>
-- 
-- Top keyword'ü

-- Top keyword'ü çoklu satırlı bir sonuç içerisinden istenilen adet kadar almanızı sağlar
-- Maaşı 1000 olan personellerden 2 tanesini getirelim 

select Top 5 Id,Ad,Soyad from Personel where Maas=10000
-- Top ifadesi yazdıktan sonra kaç tane sonuç geleceğini girmeniz gerekmektedir!!1

-- En çok maaş alan personelin  Adı nedir ? 
select Top 1 * from Personel order by Maas desc
-- Listeyi maaş alanına göre tersten sıraladık ve enyüksek maaşlı personel listenin en üstüne çıktı
-- sonrasında listenin en üstünden sadece 1 kayıt aldık 


-- Metinsel Fonksiyonlar ---------------
--LEN fonksiyonu : 
-- Len fonksiyonu metinsel değerlerin uzunluğunu verir
select Ad,LEN(Ad) from Personel
-- Personel listesindeki en uzun isimli personelin bilgilerini ekrana yazdıralım

select Top 1 * from Personel order by Len(Ad) desc

--Len fonksiyonunu bir tabloda bağlı kalmadan da kullanabilirsiniz
select Len('bu bir yazılım dersidir')


-- SubString  : metnin belli bir parçasını almak için kullanılır
-- Örnek : Personel tablosunda Ad kolonundaki verilerin sadece baş harflerini alalım
select Ad,SUBSTRING(Ad,1,1) from Personel 

-- Personel tablosundaki, Ad kolonundaki verilerin son harflerini alalım 
select Ad,SUBSTRING(Ad,LEN(Ad),1) from Personel

-- Personel tablosundaki Ad alanlarının baş harfi ve son harfini alalım ve ortasını ** ile dolduralı m 
select Ad,SUBSTRING(Ad,1,1)+'*****'+SUBSTRING(Ad,LEN(Ad),1) from Personel

-- yıldızları personelin adının uzunluğu kadar koyalım 
select Ad,SUBSTRING(Ad,1,1)+REPLICATE('*',(LEN(Ad)-2))+SUBSTRING(Ad,LEN(Ad),1) from Personel
-- Replicate fonksiyonu, belirli bir karakteri belirli adet oluşturmak için kullanılır

-- Like komutu : 
-- where  : where komutu ile kolon bazlı bir koşul ekleme işlemi yapıyorduk
-- where komutuna ek olarak, like komutu kullandığınızda, kolon bazlı değil de, hücre bazlı bir arama yapabilirsiniz

select *from Personel where Ad='Selcuk'

-- like komutu
-- Örnek : adı m ile başlayan personeller
select * from Personel where Ad like 'm%'
-- Harf% dediğimizde, harf ile başlayan demektir!!

-- adı k ile biten personeller
select * from Personel where Ad like '%k'

-- ad alanının içerisinde a geçen personeller
select * from Personel where Ad like '%a%'

-- adı b yada m ile başlayan personeller
select * from Personel where Ad like '[BM]%'

-- adı n yada k ile bitenler
select * from Personel where Ad like '%[NK]'

-- adının baş harfi a-e arasında olanlar
select * from Personel where Ad like '[A-E]%'

-- adının baş harfi a-e arasında başlamayanlar
select * from Personel where Ad like '[^A-E]%'

-- adının 3. karakteri l olanlar
select *from Personel where Ad like '__l%'

-- 2. harfi e 4. harfi e olanlar
select * from Personel where Ad  like '_e_e%'
-- like ifadesine not keyword'ü eklenebilir!! Eklendiği durumda yazılan sorgunun tam tersi çalışır!!

-- null veriyi yada null olmayan veriyi getirmek için sorgu 
select * from Personel where TC is null -- nulları getirir

-- null olmayanlar gelsin
select *from Personel where TC is not null -- null olmayanları getirir
-- null : bir kolona veri girmedinde olur!!



--- Sorgu esnasında oluşan kolonlara gecici isimler vermek 
select * from Personel

-- Aggragete Function yazdığımızda, 
select Count(Ad) as 'Personel Sayısı' from Personel

-- personel sayısı, toplam maaş ve ortalama maaşı ekrana yazdırınız
select COUNT(Ad) as 'Personel Sayısı',Sum(Maas) as 'Toplam Maaş',AVG(Maas) as 'Ortalama Maaş' from Personel
-- as komutu ile geçici yani sorgulama esnasında oluşan kolonlara isim verebilirsiniz!!!


-- Tarih ve Zaman İşlemleri
-- SQL de, o anki tarih ve xzaman bilgisini ekrana yazdırmak için 
select GetDate()


-- doğum tarihi kolonu ekleyelim 
--alter table Personel
--add DogumTarihi datetime


-- Tarih zaman işleri devam : DateDIFF
-- DateDIFF : iki tarih arasındaki farklı döndürür

-- id değeri 5 olan öğrecinin yası nedir ?


-- DateDiff iki 3 parametre alır
-- 1. parametre iki tarihin arasındaki farkın cinsi
-- 2. parametre tarih alanı
-- 3. parametre tarih alanı

-- tarih alanları manuel girilebildiği gibi, bir sorgudan gelen kolonuda parametre olarak kullanabilirsiniz!!

select * from Personel
select Ad,EPosta,DogumTarihi,DATEDIFF(YEAR,DogumTarihi,GETDATE()) as 'Yas' from Personel where Id=2

-- tarih alanını manuel de girebilirsiniz

select DATEDIFF(YEAR,'1994-02-01','2050-01-01')

-- datediff fonksiyonunun ilk parametresi, iki tarih arasındaki farkın ne cinsinden verileceğidir!!
-- Year : yıl cinsinden verir
--MONTH : ay cinsinden verir
-- Day  : gün cinsinden verir
-- hour : saat cinsinden verir
-- minute : dakika cinsinden verir
-- second : saniye cinsinden

--20 yaşından büyük personeller!!

select * from Personel where DATEDIFF(YEAR,DogumTarihi,GetDate())>35

-- Tüm personellerin yaş toplamları : 

-- Şirketimizin yaş ortalaması nedir !!

select AVG(DATEDIFF(YEAR,DogumTarihi,GetDate())) as 'Ortalama Yas'  from Personel 

-- bir tablodaki tüm verileri silmek için !!
select * from Personel


-- DateADD : Metodu, bir tarih üzerine belirli bir süre ekleme işlemidir!!

select DateAdd(YEAR,18,GETDATE())

-- yukarıdaki DateDIFF örneğinde, bugüne 18 yıl ekleyerek yeni tarihi ekrana yazdırdım!!

-- Personelin emekliliği 60 olduğunu varsayarsak, personeller hangi tarihte emekli olacaklar!!

select Ad,DogumTarihi,DATEADD(YEAR,60-DATEDIFF(year,DogumTarihi,GetDate()),GETDATE()) as 'Emeklilik Tarihi' from Personel

-- DatePART : bir tarihin belirli bir bölümünü döndürür!!

-- doğum tarihi değerinden sadece yıl değerini getir!!!

select DATEPART(year,DogumTarihi) from Personel

-- sadece ay bilgisini getir
select DogumTarihi,DATEPART(MONTH,DogumTarihi) from Personel

-- sadece gün bilgisini getir

select DogumTarihi,DATEPART(DAY,DogumTarihi) from Personel


-- 30-40 yaş arasındaki personellerin ortalama yaşı nedir!!
select AVG(DATEDIFF(YEAR,DogumTarihi,GETDATE())) from Personel 
where DATEDIFF(YEAR,DogumTarihi,GETDATE())>30 and DATEDIFF(YEAR,DogumTarihi,GETDATE())<40

-- yukarıdaki query uzun oldu ise, kısaltma yöntemine bakalım 


select AVG(DATEDIFF(YEAR,DogumTarihi,GETDATE())) as 'Yas' from Personel 
where DATEDIFF(YEAR,DogumTarihi,GETDATE())>30 and DATEDIFF(YEAR,DogumTarihi,GETDATE())<40









