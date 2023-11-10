CREATE Database Phim
GO
USE Phim
GO

CREATE TABLE UsersGroup(
	GroupID INT IDENTITY(1,1) Primary key ,
	Name nvarchar(50)
)
GO
INSERT INTO UsersGroup(Name) VALUES 
(N'Quản trị'),
(N'Thành viên')

GO

CREATE TABLE Users(
	UserID INT IDENTITY(1,1) Primary key,
	UserName varchar(50) not null,
	UserPass varchar(50) not null,
	GroupID int foreign key references UsersGroup(GroupID),

)
GO

INSERT INTO Users(UserName,UserPass,GroupID) VALUES 
('admin','admin',1),
('thanhtn','123',1),
('thanhvien','123',2)

GO


CREATE TABLE Category(
	CategoryID INT IDENTITY(100,1) primary key,
	NameCategory nvarchar(50) NULL,
)
GO

insert into Category(NameCategory) 
	values(N'KINH DỊ'),
	(N'HÀI HƯỚC')
	,(N'ANIME')
	,(N'TÌNH CẢM')
	,(N'HÀNH ĐỘNG')
	,(N'CHIẾN TRANH')
	,(N'VIỄN TƯỞNG')
	,(N'GIA ĐÌNH')
GO

CREATE TABLE Country(
	CountryID INT IDENTITY(100,1) primary key,
	NameCountry nvarchar(50) NULL,
)
GO

insert into Country (NameCountry)
values(N'MỸ'),
	(N'HÀN QUỐC'),
	(N'NHẬT BẢN'),
	(N'TRUNG QUỐC'),
	(N'VIỆT NAM'),
	(N'ẤN ĐỘ'),
	(N'THÁI LAN')
GO

CREATE TABLE Movie(
	MovieID INT IDENTITY(1,1) Primary key,
	Name nvarchar(100) ,
	Image nvarchar(max) NULL,
	Description nvarchar(max) NULL,
	Time text NULL,
	Year int NULL,
	MovieLink nvarchar(max) NULL,
	CategoryID int foreign key references Category(CategoryID),
	Rate int NULL,
	Viewed int NOT NULL,
	Status bit NOT NULL,
	CountryID int foreign key references Country(CountryID)
)
GO

INSERT INTO Movie(Name,Image,Description,Time,Year,MovieLink,CategoryID,Viewed,Rate,Status,CountryID)
VALUES
	(N'KỲ NGHỈ CỦA MR.BEAN',N'ky-nghi-cua-mr-bean.jpg',N'Một ngày đẹp trời ở nước Anh, Mr. Bean may mắn trúng giải Nhất trong cuộc quay xổ số từ thiện ở nhà thờ: một chiếc camera, 200 euro và chuyến du lịch một tuần đến bãi biển xinh đẹp phía Nam nước Pháp bắt đầu.','90',2007,N'https://cdn.phim18.online/phimhay/ky-nghi-cua-mr-bean.mp4',100,500,5,1,103),

	(N'NGƯỜI NHỆN XA NHÀ',N'Người_Nhện–Xa_nhà–poster.jpeg',N'Trở lại sau sự ra đi của Tony Stark, có vẻ như Peter đã không còn đủ động lực, niềm tin để tiếp tục theo đuổi giấc mơ làm siêu anh hùng. Nhưng trong chuyến du lịch đến Châu Âu, Peter và những người bạn rơi vào rắc rối mới. Không những vậy, cậu còn được diện kiến Nick Fury. Liệu thử thách mới của Người Nhện sẽ khó khăn thế nào?','125',2019,N'https://cdn.phim18.online/phimhay/no-way-home.mp4',100,1800,9,1,103),
	(N'VENOM ĐỐI MẶT TỬ THÙ',N'venom-doi-mat-tu-thu.jpg',N'Khi Eddie Brock và Venom cố gắng xoay xở với mối quan hệ chông gai của họ, mối đe dọa mới xuất hiện từ sát nhân hàng loạt Cletus Kasady và symbiote ngoài hành tinh mới.','97',2021,N'https://cdn.phim18.online/phimhay/venom-doi-mat-tu-thu.mp4',100,6000,10,1,106),
	(N'ĐỘT PHÁ VÒNG VÂY HỎA TUYẾN',N'dot-pha-vong-vay-hoa-tuyen.jpg',N'Darong từng là vệ sĩ hàng đầu Đông Nam Á. Trong một cuộc hành quân, anh đã xúc phạm tên trùm ma túy địa phương và tay súng bắn tỉa Chalong của hắn. Anh ta đã bị Chalong trả thù một cách điên cuồng, gây ra cái chết của vợ chồng anh trai mình. Anh nản lòng nên từ nay Darong sẽ rút lui. Năm năm sau, Qiqi, con gái của Darong lớn lên và vô tình dính vào một vụ buôn bán ma túy và bị bắt cóc bởi những kẻ ngoài vòng pháp luật. Để cứu con gái của mình, Darong đã tìm ra kẻ đứng sau hậu trường, đó chính là trùm ma túy tình địch và là thuộc hạ của hắn! Hai bên gặp lại nhau như định mệnh, và chiến tranh sắp xảy ra!','90',2016,N'https://cdn.phim18.online/phimhay/dot-pha-vong-vay-hoa-tuyen.mp4',103,1000,6,1,105),
	(N'NGƯỜI SẮT PHẦN 2',N'Iron_Man_2_poster_Viet.jpg',N'Trong mùa thứ hai của loạt phim trực tuyến này, Iron Man Stark bắt đầu cuộc chiến chống trả thù chống lại kẻ thù Nga, Whiplash và đối thủ cạnh tranh của anh ta là Justin Hammer. Từ việc được công chúng biết đến như một siêu anh hùng, anh phải đối mặt với nhiều áp lực từ chính phủ quốc gia, buộc anh phải chia sẻ công nghệ nghiên cứu của mình để phục vụ cho quân đội quốc gia, bất kể tình huống nào. Chấp nhận điều đó, anh cùng với Pepper Potts và James thành lập một đội chiến đấu với kẻ thù.','124',2009,N'https://cdn.phim18.online/phimhay/nguoi-sat-phan2.mp4',100,1350,5,1,106),
	(N'QUÁ NHANH QUÁ NGUY HIỂM 9',N'qua-nhanh-qua-nguy-hiem-9.jpg',
	N'Huyền Thoại Tốc Độ là câu chuyện sau khi thoát chết ở cuối phần 8, hacker Cipher sẽ quay trở lại với nhiều chiêu trò nguy hiểm, nhằm hạ gục Dominic và gia đình anh.','115',2019
	,N'https://cdn.phim18.online/phimhay/fast-9.mp4',100,1350,5,1,104)
	GO
	INSERT INTO Movie(Name,Image,Description,Time,Year,MovieLink,CountryID,Viewed,Rate,Status,CategoryID)
VALUES
	(N'JOHN WICK 3',N'john-wick-3.jpg',N'John Wick 3 là phần tiếp theo về siêu sát thủ John Wick. Sau khi trở thành mục tiêu của giới sát thủ trên toàn cầu với món tiền thưởng kỷ lục 14','97',2017,N'https://cdn.phim18.online/phimhay/john-wick3.mp4',100,970,7,1,104),
	(N'NGƯỜI SẮT 3',N'nguoi-sat-3.jpg',N' Nhân vật chính của phim là anh chàng giàu có Tony Stark. Sau khi cùng nhóm Avengers tiêu diệt kẻ thù, vợ chồng Stark trở về sống trong một căn biệt thự gần biển. Nhưng sau đó anh gặp phải một kẻ thù rất mạnh là Mandarin. Kẻ thù của anh đã phá hủy dinh thự, đánh cắp tài liệu bí mật về người sắt của anh và phá hủy bộ giáp sắt. Stark đến Trung Quốc và sử dụng trí óc siêu phàm của mình để chống lại kẻ thù nguy hiểm này.','131',2013,N'https://cdn.phim18.online/phimhay/nguoi-sat-phan3.mp4',100,720,8,1,106),
	(N'NGƯỜI SẮT 1',N'nguoi-sat-1.jpg',N'Bộ phim xoay quanh nhân vật người sắt Tony Stark do tài tử Robert Downey Jr thủ vai, anh là một kỹ sư thiên tài, sau khi trải qua một tai nạn nguy hiểm đến tính mạng, anh đã dày công chế tạo nên một bộ giáp sắt với nhiều năng lực tuyệt vời và trở thành Người Sắt, một siêu anh hùng với những cỗ máy hiện đại gắn lên người.','120',2008,N'https://cdn.phim18.online/phimhay/nguoi-sat-phan1.mp4',100,720,8,1,106),
	(N'THE POWER OF THE DOG',N'the-power-of-the-dog.jpg',N'Chủ trang trại có sức lôi cuốn Phil Burbank truyền cảm hứng cho những người xung quanh sợ hãi và nể phục. Khi anh trai mang về nhà một người vợ mới và con trai của cô ấy, Phil dằn vặt họ cho đến khi anh thấy mình có khả năng được yêu.','102',2009,N'https://cdn.phim18.online/phimhay/the-power-of-the-dog.mp4',106,500,4,1,103),
	
	(N'BIỆT ĐỘI SIÊU ANH HÙNG',N'biet-doi-sieu-anh-hung.jpg',N'Biệt đội siêu anh hùng, bộ phim đánh dấu kết thúc giai đoạn 1 trong đại dự án về vụ trụ điện ảnh Marvel. Biệt đội siêu anh hùng lần đầu tiên tập hợp lại dưới sự chỉ huy của Đại tá Nick Fury, giám đốc cơ quan gìn giữ hoà bình quốc tế S.H.I.E.L.D bao gồm Captain America, Iron Man, Thần Sấm Thor, Người khổng lồ xanh Hulk, cung thủ Hawkeye và nữ điệp viên Black Widow. Những anh hùng vốn mang trong mình sức mạnh và trách nhiệm bảo vệ Trái Đất giờ sát cánh bên nhau để chống lại kẻ thù tàn bạo còn đang ẩn giấu...','142',2012,N'https://cdn.phim18.online/phimhay/avenger-endgame.mp4',100,1720,9,1,106),
	(N'NHÍM SONIC',N'nhim-sonic.jpg',N'Vị cảnh sát trưởng ở thị trấn nhỏ giúp chú nhím ngoài hành tinh có tốc độ siêu thanh thoát khỏi tay tiến sĩ điên muốn có năng lực đặc biệt của chú để thống trị thế giới.','99',2020,N'https://cdn.phim18.online/phimhay/nhim-sonic.mp4',100,478,8,1,102),
	(N'TIÊN HẮC ÁM',N'tien-hac-am.jpg',N'Đây là bộ phim hiếm hoi của Walt Disney có khắc họa một nhân vật phản diện điển hình trong một bộ phim nổi tiếng, mụ phù thủy Maleficent trong tác phẩm hoạt hình kinh điển "Sleeping Beauty". Bộ phim sẽ lần đầu tiết lộ sự thật đằng sau số phận bi kịch của người phụ nữ vốn có trái tim thuần khiết này cũng như chân tướng của sự phản bội đã khiến trái tim của bà hóa đá.','118',2019,N'',101,527,7,1,105),
	(N'CHÚ HỀ MA QUÁI',N'chu-he-ma-quai.jpg',N'Mở màn với một trận mưa lớn, cậu bé Georgie mang con thuyền anh trai đã xếp cho mình chạy dọc con phố mà đột nhiên mất tích, từ sau phân cảnh ấy, các phân đoạn còn lại đều diễn ra dưới bầu trời nắng trong xanh. Nhưng bầu trời trong lành không thể ẩn dấu đi bầu không khí ẩm mốc, tràn ngập mùi tanh của máu với những vụ mất tích ở khắp nơi trong thành phố.','128',2019,N'',102,1023,6,1,100),
	(N'ĐỨA CON CỦA THỜI TIẾT',N'dua-con-cua-thoi-tiet.jpg',
	N'Đứa Con Của Thời Tiết xoay quanh hai nhân vật: Hodaka và Hina. Hodaka là cậu thiếu niên sống trên một hòn đảo nhỏ, đã rời khỏi quê hương để đến Tokyo sầm uất. Tại đây, cậu quen biết với Hina - một cô gái kì lạ có năng lực thanh lọc bầu trời mỗi khi "cầu nguyện". Cô có khả năng chặn đứng cơn mưa và xua tan mây đen theo ý muốn.'
	,'114',2019
	,N'https://video-ams4-1.xx.fbcdn.net/v/t39.25447-2/10000000_541774613994812_5362892363011573118_n.mp4?_nc_cat=107&vs=376d6eaa71519943&_nc_vs=HBksFQAYJEdJQ1dtQUE4WFdxN3Zld0JBSDdGOWJrdzBteEtibWRqQUFBRhUAAsgBABUAGCRHSUNXbUFCX21kNW5CbmdFQUxrQ241VnRPbkVHYnJGcUFBQUYVAgLIAQBLBogScHJvZ3Jlc3NpdmVfcmVjaXBlATENc3Vic2FtcGxlX2ZwcwAQdm1hZl9lbmFibGVfbnN1YgAgbWVhc3VyZV9vcmlnaW5hbF9yZXNvbHV0aW9uX3NzaW0AKGNvbXB1dGVfc3NpbV9vbmx5X2F0X29yaWdpbmFsX3Jlc29sdXRpb24AEWRpc2FibGVfcG9zdF9wdnFzABUAJQAcAAAmhtmrwO33kAEVkE4oAkMzGAt2dHNfcHJldmlldxwXQLk1CTdLxqgYKWRhc2hfaTRsaXRlYmFzaWNfNXNlY2dvcF9ocTJfZnJhZ18yX3ZpZGVvEgAYGHZpZGVvcy52dHMuY2FsbGJhY2sucHJvZDgSVklERU9fVklFV19SRVFVRVNUGw%2BIFW9lbV90YXJnZXRfZW5jb2RlX3RhZwZvZXBfaGQTb2VtX3JlcXVlc3RfdGltZV9tcwEwDG9lbV9jZmdfcnVsZQd1bm11dGVkE29lbV9yb2lfcmVhY2hfY291bnQBMBFvZW1faXNfZXhwZXJpbWVudAAMb2VtX3JvaV9ub3RlC3Byb2dyZXNzaXZlEW9lbV9yb2lfdXNlcl90aWVyAB5vZW1fcm9pX3ByZWRpY3RlZF93YXRjaF90aW1lX3MBMBZvZW1fcm9pX3JlY2lwZV9iZW5lZml0BTAuMDAwJW9lbV9yb2lfc3RhdGljX2JlbmVmaXRfY29zdF9ldmFsdWF0b3ILcHJvZ3Jlc3NpdmUMb2VtX3ZpZGVvX2lkDzU3MTMzMTE5NDQxMTA0NhJvZW1fdmlkZW9fYXNzZXRfaWQPOTg2OTcwMDI1MzEyNTAxFW9lbV92aWRlb19yZXNvdXJjZV9pZA8zMTg3MTg0NTA0MzE1NTUcb2VtX3NvdXJjZV92aWRlb19lbmNvZGluZ19pZA80MjkzODcyNzkwMjg5NTgOdnRzX3JlcXVlc3RfaWQPMWZmNDE0ZGY1ODAxNDI4JQIcHBwV8OYXGwFVAAIbAVUAAhwVAgAAABaAurcDACWOAhsHiAFzBDM5NDICY2QKMjAyMi0wNS0yNwNyY2IBMAJjdBlDT05UQUlORURfUE9TVF9BVFRBQ0hNRU5UE29yaWdpbmFsX2R1cmF0aW9uX3MLNjQ1My4yOTgzMzMBZgJhZAJ0cxVwcm9ncmVzc2l2ZV9lbmNvZGluZ3MA&ccb=1-7&_nc_sid=41a7d5&_nc_ohc=pAn-jSkGTvcAX9m2DAW&_nc_ht=video-ams4-1.xx&edm=APRAPSkEAAAA&oh=00_AT-nj5bvnLySPWT-UFh2xMLKBKB59K1swiJMWo_ipsrLIw&oe=62ACB789&_nc_rid=348419381900098'
	,102,10000,9,1,102)
	GO
	INSERT INTO Movie(Name,Image,Description,Time,Year,MovieLink,CategoryID,Viewed,Rate,Status,CountryID)
VALUES
	(N'QUÁI VẬT SƯƠNG MÙ',N'quai-vat-suong-mu.jpg',N'Ác mộng bắt đầu khi dân làng Maine mắc kẹt trong sương mù và nhận ra đó là nơi ẩn mình của những sinh vật ghê rợn. Loạt phim dựa trên tiểu thuyết ngắn của Stephen King.','131',2017,N'',103,458,5,1,103),
	(N'GIẢI MÃ MÊ CUNG',N'giai-ma-me-cung.jpg',N'Giải Mã Mê Cung kể về chuyến hành trình của Thomas khi cậu bị một thế lực bí ẩn đẩy đến mảnh đất Glade, nơi được bao quanh bởi bốn bức tường đồ sộ, kiên cố và lối thoát duy nhất lại là đường dẫn vào một mê cung kỳ lạ với cấu trúc luôn thay đổi khi đêm xuống cùng những sinh vật ghê rợn luôn sẵn sàng giết chết bất kỳ ai kẹt lại giữa mê cung.','111',2014,N'',101,759,4,1,103),
	(N'BÍ MẬT CHẾT CHÓC',N'bi-mat-chet-choc.jpg',N'Hai thành viên phi hành đoàn thức dậy trên một con tàu vũ trụ bị bỏ hoang mà không biết họ là ai, họ đã ngủ bao lâu hay nhiệm vụ của họ là gì. Cả hai sớm phát hiện ra rằng họ thực sự không đơn độc - và thực tế hoàn cảnh của họ kinh hoàng hơn những gì họ có thể tưởng tượng.','108',2009,N'',100,800,3,1,100),
	(N'TÒA THÁP CHỌC TRỜI',N'toa-thap-choc-troi.jpg',N'Dwayne Johnson sẽ vào vai cựu quân nhân và cựu trưởng nhóm đặc nhiệm giải cứu của FBI Will Ford đầy dũng cảm. Không may trong một nhiệm vụ nguy hiểm, tai nạn khủng khiếp xảy đến với Will làm anh mất đi chân trái của mình. Kể từ đó, Will Ford từ bỏ công việc tại FBI và trở thành chuyên gia đánh giá an ninh cho các tòa nhà. Trong một lần làm việc, Tòa nhà cao 240 tầng với hệ thống an ninh tối tân đột nhiên bị cháy lớn ở tầng 96. Những con người, cạm bẫy và thế lực nào đứng sau thảm họa này chắc chắn đang nhắm vào cựu quân nhân và lấy gia đình anh ra làm con tin. Với kinh nghiệm, sự gan dạ của một người lính cùng tình yêu gia đình mãnh liệt, liệu Will Ford có tìm ra được kẻ chủ mưu và cứu lấy gia đình của anh?','102',2018,N'',103,186,5,1,104),
	(N'BÍ ẨN HÀNH TINH CHẾT',N'bi-an-hanh-tinh-chet.jpg',N'Một nhóm nhà thám hiểm phát hiện ra một đầu mối về nguồn gốc của loài người trên trái đất, dẫn họ vào một cuộc hành trình đến những góc tối nhất của vũ trụ. Ở đó, họ phải chiến đấu một trận chiến đáng sợ để cứu tương lai của loài người.','124',2012,N'',103,1024,7,1,101),
	(N'TÔI LÀ HUYỀN THOẠI',N'toi-la-huyen-thoai.jpg',N'Một đại dịch gần như tiêu diệt hoàn toàn nhân loại và biến những người sống sót thành những con quái vật, ngoại trừ Robert - người duy nhất sống sót và có khả năng kháng bệnh ở thành phố New York. Robert vừa chiến đấu với những zombie khát máu vừa tìm cách chế ra loại thuốc hóa giải căn bệnh quái ác kia…','101',2007,N'',100,805,6,1,105),
	(N'GÁNH NẶNG NGÀN CÂN',N'ganh-nang-ngan-can.jpg',N'Nick Cage (do chính Nicolas Cage thủ vai) là diễn viên từng đoạt giải Oscar đang gặp khó khăn về tài chính. Để nhận được khoản thù lao kếch xù 1 triệu USD lẫn giải cứu vợ con mình, anh phải đến dự tiệc sinh nhật của fan cuồng kiêm trùm tội phạm biến thái Javi.','141',2022,N'',105,741,7,1,100),
	(N'HẸN CHẾT NGÀY KHÁC',N'hen-chet-ngay-khac.jpg',N'James Bond được cử đi điều tra mối liên hệ giữa một tên khủng bố Bắc Triều Tiên và một ông trùm kim cương, kẻ đang tài trợ cho việc phát triển một loại vũ khí không gian quốc tế.','133',2022,N'',102,927,7,1,105),
	(N'CÔ GÁI MẤT TÍCH',N'co-gai-mat-tich.jpg',
	N'Hôn nhân bị sứt mẻ, một ngày nọ Nick về nhà và phát hiện vợ mình đã biến mất. Khi cảnh sát vào cuộc, những sự thật kinh hoàng dần hé lộ trước ánh sáng.',
	'182',2014,N'',103,846,7,1,102)
	GO

	INSERT INTO Movie(Name,Image,Description,Time,Year,MovieLink,CategoryID,Viewed,Rate,Status,CountryID)
VALUES
	
	(N'THAO THỨC ĐÊM HÈ',N'thao-thuc-dem-he.jpg',N'Mùa hè trước khi vào đại học, Auden mọt sách gặp Eli bí ẩn. Qua các buổi đi chơi đêm, anh giúp cô trải nghiệm cuộc sống thiếu nữ vô tư mà cô đã bỏ lỡ.','145',2022,N'',105,458,8,1,104),
	(N'KHẨN CẤP',N'khan-cap.jpg',N'Khẩn Cấp Emergency kể về ba người bạn cố gắng đưa một phụ nữ trẻ dùng thuốc quá liều đến phòng cấp cứu, không bao giờ đi theo cách bạn mong đợi. Nó bắt đầu như một bức tranh về người bạn thân trong khuôn viên trường có đầu óc chính trị. Sau đó, nó biến thành loại kinh dị hài hước,phim khẩn cấp 2022 này theo motip, kể về những người tử tế nhưng không may cố gắng thoát ra khỏi tình huống tồi tệ mà cứ lần lượt trở nên tồi tệ hơn. Có những gợi ý rằng nó có thể biến thành một bộ phim kinh dị hoặc phim kinh dị tội phạm. Nó càng đi sâu vào liên tiếp các sự cố, thì niềm đam mê của nó với tình bạn càng đi sâu vào phía trước.','106',2022,N'',106,351,4,1,106),
	(N'BẢN ÁN CỦA ALEXIE NAVALNY',N'ban-an.jpg',N'Bộ phim tài liệu về vụ lùm xùm chính trị xoay quanh trường hợp của ông Alexie Navalny - một chính trị gia Nga đối lập với hệ thống chính trị tại quốc gia mình. Ông từng bị tổng thống Vladimir Putin cáo buộc là người do CIA cài cắm vào hàng ngũ chính trị Nga để chia rẽ nội bộ, song Navalny hết mực bác bỏ. Ngược lại, nhà đối lập này cáo buộc Putin cho người sử dụng chất độc thần kinh Novichok để ám sát mình song bất thành, tất nhiên, chính quyền Nga cũng bác bỏ. Được biết, ngoài Navalny, phía Nga còn bắt giam gần 1000 người vô tội vào ngày 2-2-2021 khi họ tập trung tại khu vực xung quanh tòa án trong suốt phiên xét xử ông Navalny...','106',2011,N'',106,627,5,1,105),
	(N'CÔ GÁI MARVER',N'co-gai-marver.jpg',N'Kamala Khan lớn lên ở New Jersey biết rằng cô có sức mạnh đa hình. Một đêm nọ, hy vọng chứng minh bản thân mình, Kamala đã đi ngược lại mong muốn của bố mẹ – và của Bruno – đi đến một bữa tiệc ở bờ sông Jersey. Tuy nhiên, các bạn cùng lớp của cô, đặc biệt là Zoe Zimmer và bạn trai của cô Josh Richardson, tiếp tục trêu chọc và tẩy chay cô. Đau khổ, Kamala đang trên đường trở về nhà thì thành phố Jersey đột nhiên bao phủ bởi làn sương Terrigen Mists.Khi đang bất tỉnh trong chiếc kén Terrigen, Kamala có một giấc mơ về ba siêu anh hùng yêu thích của cô – Captain America, Iron Man, và tất nhiên, Captain Marvel.','157',2022,N'',105,487,6,1,105),
	(N'CÁ SẤU KHỔNG LỒ',N'ca-sau-khong-lo.jpg',N'Phim kinh dị hài về chú cá sấu ăn thịt người trượt ở trong hồ...','120',2022,N'',103,843,7,1,105),
	(N'SHIGATSU WA KIMI NO USO',N'thang-tu-la-loi-noi-doi.jpg',N'Trong phim, Arima Kousei là một cậu bé có khả năng đặc biệt về piano. Trong các cuộc thi piano, cậu từng đạt được rất nhiều cup kèm theo các giải thưởng có giá trị. Tai họa ập đến kể từ khi mẹ Arima qua đời. Vì quá sốc trước nỗi đau này, chàng trai trẻ không còn cảm nhận được những thanh âm trong trẻo của piano, tương lai phía trước dường như sụp đổ hoàn toàn.','120',2022,N'',101,843,7,1,102),
	(N'LOVE IS WAR',N'cuoc-chien-to-tinh.jpg',N'Shinomiya Kaguya và Shirogane Miyuki là hai nhân vật chính của bộ phim anime học đường đầy kịch tính nhưng không kém phần hài hước này. Họ được bầu làm hội phó và hội trưởng của Học viện Shuchiin. Ngôi trường này vốn dành cho con nhà giàu hoặc những học sinh có tài năng đặc biệt. Cả 2 nhân vật đã giao ước với nhau ai là người tỏ tình trước kẻ đó sẽ là người thua cuộc.','102',2019,N'',103,878,6,1,102),
	(N'MA NỮ ĐẠI CHIẾN',N'ma-nu-dai-chien.jpeg',N'Natsumi đã xem cuốn băng video bị nguyền rủa trong truyền thuyết và phát hiện ra cô chỉ có 2 ngày trước khi bị giết bởi Sadako. Cách duy nhất để phá vỡ lời nguyền chính là "lấy độc trị độc": dùng Kayako để chống lại Sadako. Kayako là linh hồn trú ngụ trong ngôi nhà ma – nơi mọi người bước vào đều bị mất tích một cách bí ẩn.','97',2016,N'',105,843,7,1,102),
	(N'TRÒ CHƠI SINH TỒN',N'tro-choi-sinh-ton.jpg',N'Quay ngược thời gian trở về với tuổi thơ bằng những trò chơi dân gian nghe có vẻ thú vị, nhưng nó là nỗi kinh hoàng đối với các học sinh trung học trong phim. Bởi vì khi thua sẽ chẳng phải bị phạt búng trán hay quỳ gối gì đâu mà phải mất mạng đấy. Không còn là trò chơi dân gian nữa, một trò chơi sinh tồn với khả năng thắng cuộc gần như không tồn tại.',N'','97',2022,102,873,5,1,106),
	(N'BÓNG ĐÊM KINH HOÀNG',N'bong-dem-kinh-hoang.jpg',N'Nội dung dựa trên tiểu thuyết và manga kinh dị bí ẩn rất ăn khách. Phim như mở ra một bầu không khí u ám đáng sợ, có ai đó luôn đeo bám phía sau. Những cái chết vô cùng man rợ khiến người xem sởn gai ốc. Năm 1998, Koichi 15 tuổi từ Tokyo chuyển đến một trường cấp hai ở thị trấn nhỏ. Tại lớp 3-3, có một lời nguyền mà mỗi năm kể từ năm 1972 luôn có học sinh và người thân của họ gặp những cái chết thảm khốc.','121',2009,N'',105,487,3,1,105),
	(N'NGỌC CỐT DAO',N'ngoc-cot-dao.jpg',N'Bộ phim Trung Quốc Ngọc Cốt Dao kể về Chu Nhan và Thời Ánh. Một người đang là quận chúa xinh đẹp, trượng nghĩa còn một người là Thế tử với vẻ ngoài tuấn tú nhưng cũng rất lạnh lùng. Tình yêu của cả hai dần chớm nở và vượt qua nhiều khó khăn, chông gai. Họ quyết bên cạnh nhau để bảo vệ vương triều và an nguy của bá tánh.','45',2021,N'',106,651,8,1,104),
	(N'EM CỦA THỜI NIÊN THIẾU',N'em-cua-thoi-nien-thieu.jpg',N'Trần Niệm vì một hành động nhỏ bảo vệ bạn học mà vô tình trở thành đối tượng tiếp theo của vấn nạn này. Từ cuộc sống gia đình cho tới sự bắt nạt tại trường gần như khiến Trần Niệm rơi vào sự tuyệt vọng. Sự sắp đặt của định mệnh đã cho cô gặp Tiểu Bắc – cậu là tên lưu manh chuyên đi đánh nhau. Chỉ một lần Trần Niệm cứu cậu, cậu đã quyết tâm sẽ bảo vệ Trần Niệm cả một đời. Chuyện tình yêu của họ khiến người xem rất cảm động trước những hy sinh âm thầm của cả hai người với nhau.','138',2019,N'',103,481,6,1,104),
	(N'CÔ BẠN GIA SƯ'
	,N'co-ban-gia-su.jpg',N'Su Wan (Kim Ha Neul) là sinh viên năm hai đại học và cô đang làm thêm gia sư để tự trang trải cho tiền học phí. Từ trước đến giờ cô không mấy có duyên với những học sinh mình dạy, mọi chuyện bắt đầu tệ hại hơn khi mẹ cô nhờ cô dạy kèm cho Ji Hoon (Kwon Sang Woo). Ji Hoon xuất thân từ một gia đình giàu có và được biết đến là người rất giỏi đánh nhau. Cậu cũng là vua gây rối, đã ở lại lớp và không được tốt nghiệp tới 3 lần. Chuyện gì sẽ xảy ra khi cặp đôi oan gia này gặp nhau, liệu Su Wan có giúp Ji Hoon được qua lớp?'
	,'127',2018,N'',101,651,8,1,102)
	GO
	INSERT INTO Movie(Name,Image,Description,Time,Year,MovieLink,CategoryID,Viewed,Rate,Status,CountryID)
VALUES
	(N'THE MEDIUM',N'the-medium.jpg',N'Câu chuyện về gia đình một bà đồng, có khả năng kết nối với những âm hồn của thế giới bên kia luôn là đề tài gây nhiều hứng thú. Liệu sẽ ra sao nếu có sự xuất hiện của một linh hồn quỷ dữ đe dọa tính mạng của cả gia tộc?','115',2021,N'',101,651,8,1,105),
	(N'CẢNH SÁT TẬP SỰ',N'canh-sat-tap-su.jpg',N'Bộ phim kể về 2 nhân vật chính là Ki-joon và Hee-yeol, cả 2 có hoàn cảnh, tính cách khác biệt nhưng lại trở nên thân thiết khi cùng học tại Đại học Cảnh sát Quốc gia Hàn Quốc.Một lần nghỉ phép ra ngoài chơi, cả 2 đã chứng kiến một vụ bắt cóc, cả 2 quyết định lần theo dấu vết đó để truy tìm hung thủ. Tuy có nhiều khó khăn nhưng vì muốn đưa vụ việc ra ánh sáng mà họ đã không cần trợ giúp từ ai, tự mình tiêu trừ tổ chức tội phạm.','109',2017,N'',103,569,8,1,105),
	(N'YOUR NAME',N'yourname.jpg',N'Bộ phim là câu chuyện hoán đổi cơ thể của 2 cô cậu Mitsuha - nữ sinh trung học sống ở một thị trấn nhỏ của vùng Itomori và Taki – nam sinh tại thủ đô Tokyo đầy sôi động.Mitsuha luôn chán chường với cuộc sống tẻ nhạt của mình và mơ ước được làm anh chàng đẹp trai sống tại thủ đô. Trong khi đó, Taki hằng đêm lại nhìn thấy mình trong hình hài cô gái vùng miền quê. Ước mơ của cả 2 đã thành sự thật khi sao chổi nghìn năm xuất hiện trên trái đất và rồi cứ cách ngày lại được hoán đổi cơ thể cho nhau.','180',2019
	,N'https://video-frx5-1.xx.fbcdn.net/v/t39.25447-2/10000000_523110972823191_562827608237124888_n.mp4?_nc_cat=110&vs=e151ea16b117e7db&_nc_vs=HBksFQAYJEdJQ1dtQUNYbHJaRHhOc0JBQml0d1VxNmtNOEhibWRqQUFBRhUAAsgBABUAGCRHSUNXbUFCTjVmNzZqTG9EQU1CNDdGc0piVDhOYnJGcUFBQUYVAgLIAQBLBogScHJvZ3Jlc3NpdmVfcmVjaXBlATENc3Vic2FtcGxlX2ZwcwAQdm1hZl9lbmFibGVfbnN1YgAgbWVhc3VyZV9vcmlnaW5hbF9yZXNvbHV0aW9uX3NzaW0AKGNvbXB1dGVfc3NpbV9vbmx5X2F0X29yaWdpbmFsX3Jlc29sdXRpb24AEWRpc2FibGVfcG9zdF9wdnFzABUAJQAcAAAmkPSwuoX6%2BAEVkE4oAkMzGAt2dHNfcHJldmlldxwXQLj7mNT987YYNGRhc2hfaTRsaXRlYmFzaWNfcGFzc3Rocm91Z2hhbGlnbmVkX2hxMl9mcmFnXzJfdmlkZW8SABgYdmlkZW9zLnZ0cy5jYWxsYmFjay5wcm9kOBJWSURFT19WSUVXX1JFUVVFU1QbD4gVb2VtX3RhcmdldF9lbmNvZGVfdGFnBm9lcF9oZBNvZW1fcmVxdWVzdF90aW1lX21zATAMb2VtX2NmZ19ydWxlB3VubXV0ZWQTb2VtX3JvaV9yZWFjaF9jb3VudAEwEW9lbV9pc19leHBlcmltZW50AAxvZW1fcm9pX25vdGULcHJvZ3Jlc3NpdmURb2VtX3JvaV91c2VyX3RpZXIAHm9lbV9yb2lfcHJlZGljdGVkX3dhdGNoX3RpbWVfcwEwFm9lbV9yb2lfcmVjaXBlX2JlbmVmaXQFMC4wMDAlb2VtX3JvaV9zdGF0aWNfYmVuZWZpdF9jb3N0X2V2YWx1YXRvcgtwcm9ncmVzc2l2ZQxvZW1fdmlkZW9faWQQMTI2MjI5NTI1MTIwOTE4MxJvZW1fdmlkZW9fYXNzZXRfaWQQMzE5MDQ3OTIzNzg1ODg3ORVvZW1fdmlkZW9fcmVzb3VyY2VfaWQPNTQ3NDU0NDQzNzI0MDQwHG9lbV9zb3VyY2VfdmlkZW9fZW5jb2RpbmdfaWQQMTM1ODQyOTIzMTI5MTMzNQ52dHNfcmVxdWVzdF9pZA9jMWM2ZTllNjJhMDA0MGYlAhwcHBXw5hcbAVUAAhsBVQACHBUCAAAAFoC6twMAJY4CGweIAXMENTM3OQJjZAoyMDIyLTA1LTMxA3JjYgEwAmN0GUNPTlRBSU5FRF9QT1NUX0FUVEFDSE1FTlQTb3JpZ2luYWxfZHVyYXRpb25fcwg2Mzk1LjY1OAFmAmFkAnRzFXByb2dyZXNzaXZlX2VuY29kaW5ncwA%3D&ccb=1-7&_nc_sid=41a7d5&_nc_ohc=9-Onqwiq328AX9TpZks&_nc_ht=video-frx5-1.xx&edm=APRAPSkEAAAA&oh=00_AT_YmGzWZKHEVItlPRJyr7ClmD-go0VVGcZ3QmkNHjx-1Q&oe=62A69BE5&_nc_rid=692503184091870',102,1400,8,1,102)
	GO
