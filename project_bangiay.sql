
USE [project_shopbangiay]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 25/6/2023 5:52:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[uID] [int] IDENTITY(1,1) NOT NULL,
	[user] [varchar](255) NULL,
	[pass] [varchar](255) NULL,
	[isSell] [int] NULL,
	[isAdmin] [int] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 25/6/2023 5:52:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NULL,
	[ProductID] [int] NULL,
	[quantity] [int] NULL,
	[price] [money] NULL
  CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 25/6/2023 5:52:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] NOT NULL,
	[cname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 25/6/2023 5:52:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NULL,
	[title] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[cateID] [int] NULL,
	[sell_ID] [int] NULL,
	[quantity] [int] NULL
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] ,
	[aid] [int] ,
	[comment] [nvarchar](max) NULL,
	[date] date null,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Reply](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[commentid] [int] ,
	[reply] [nvarchar](max) NULL,
	[date] date null,
 CONSTRAINT [PK_Reply] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (1, N'Adam', N'12345', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (2, N'userA', N'123', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (3, N'userB', N'123', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (4, N'userC', N'123', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (5, N'mrA', N'123', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (6, N'mrB', N'123', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (7, N'mrC', N'123', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (8, N'mrD', N'123', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (9, N'adminA', N'123', 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (10, N'adminB', N'123', 0, 1)

SET IDENTITY_INSERT [dbo].[Account] OFF
INSERT [dbo].[Category] ([cid], [cname]) VALUES (1, N'GIÀY ADIDAS')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (2, N'GIÀY NIKE')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (3, N'GIÀY MLB')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (4, N'GIÀY CONVERSE')
SET IDENTITY_INSERT [dbo].[product] ON 
INSERT [dbo].[product] ( [name], [image], [price], [title], [description], [cateID], [sell_ID],[quantity])
VALUES ( N'Low White Swoosh Panda', N'image/nike1.jpg', 100.0000, N'Giày Nike Air Force 1 Low White Swoosh Panda', N'Giày Nike Air Force 1 Low White Swoosh Panda là một đôi giày thời trang và linh hoạt, kết hợp thiết kế cổ điển với các tính năng hiện đại. Đôi giày có phần trên bằng da trắng với các chi tiết màu đen và hình ảnh gấu trúc ở phần gót. Biểu tượng Nike Swoosh cũng được thể hiện bằng màu đen ở hai bên', 2, 1,20)
INSERT [dbo].[product] ( [name], [image], [price], [title], [description], [cateID], [sell_ID],[quantity])
VALUES ( N'High Đen Trắng Black White', N'image/nike2.jpg', 120.0000, N'Giày Nike Air Jordan 1 High Đen Trắng Black White Rep 1:1', N'Giày Nike Air Jordan 1 High Đen Trắng Black White Rep 1:1 sở hữu chất liệu da cao cấp, tạo cho đôi giày vẻ ngoài chắc chắn, bóng bẩy. Đôi giày này vẫn mang những chi tiết đặc trưng của dòng Air Jordan 1', 2, 5,20)
INSERT [dbo].[product] ( [name], [image], [price], [title], [description], [cateID], [sell_ID],[quantity])
VALUES ( N'Chuck Taylor All Star 1970s Colors Vintage Canvas', N'image/converse3.jpg', 100.0000, N'Giày Converse Chuck Taylor All Star 1970s Colors Vintage Canvas', N'Giày Converse Chuck Taylor All Star 1970s Colors Vintage Canvas là một đôi giày thể thao cao cấp với kiểu dáng độc đáo, đậm phong cách high-fashion và độ hack chiều cao cực ảo. Được nhiều người săn đón bởi màu sắc basic dễ phối quần áo cùng vẻ ngoài cá tính', 4, 6,20)
INSERT [dbo].[product] ( [name], [image], [price], [title], [description], [cateID], [sell_ID],[quantity])
VALUES ( N'Dark Mocha Black Brown', N'image/nike3.jpg', 100.0000, N'Giày Nike Air Jordan 1 Retro High Dark Mocha Black Brown', N'Giày Nike Air Jordan 1 Retro High Dark Mocha Black Brown có màu sắc tối, sử dụng chất liệu da cao cấp. Đôi giày này có logo Swoosh màu đen, logo Jordan Wings ở mắt cá chân và thương hiệu Nike Air trên lưỡi giày', 2, 6,20)
INSERT [dbo].[product] ( [name], [image], [price], [title], [description], [cateID], [sell_ID],[quantity])
VALUES ( N'Low White', N'image/nike4.jpg', 100.0000, N'Giày Nike Air Force 1 Low White', N'Giày Nike Air Force 1 Low White là một đôi giày thời trang và linh hoạt, kết hợp thiết kế cổ điển với các tính năng hiện đại. Đôi giày có phần trên bằng da trắng với các chi tiết màu đen và hình ảnh gấu trúc ở phần gót. Biểu tượng Nike Swoosh cũng được thể hiện bằng màu đen ở hai bên', 2, 7,20)
INSERT [dbo].[product] ( [name], [image], [price], [title], [description], [cateID], [sell_ID],[quantity])
VALUES ( N'MLB Chunky Liner Mid Basic New York Yankees', N'image/mlb1.jpg', 120.0000, N'Giày Thể Thao MLB Chunky Liner Mid Basic New York Yankees', N'Giày Thể Thao MLB Chunky Liner Mid Basic New York Yankees có thiết kế chunky (dày, to) rất đặc trưng với đế giày phía sau được thiết kế lớn hơn so với phần trước, tạo nên sự khác biệt và phong cách riêng. Được làm từ chất liệu da cao cấp, mềm mại, dễ vệ sinh.', 3, 9, 20)
INSERT [dbo].[product] ( [name], [image], [price], [title], [description], [cateID], [sell_ID],[quantity])
VALUES ( N'Nike Dior', N'image/nike5.jpg', 105.0000, N'Giày Nike Air Force 1 Dior', N'Giày Nike Air Force 1 Dior là một đôi giày thời trang và linh hoạt, kết hợp thiết kế cổ điển với các tính năng hiện đại. Đôi giày có phần trên bằng da trắng với các chi tiết màu đen và hình ảnh gấu trúc ở phần gót. Biểu tượng Nike Swoosh cũng được thể hiện bằng màu đen ở hai bên', 2, 8,20)
INSERT [dbo].[product] ( [name], [image], [price], [title], [description], [cateID], [sell_ID],[quantity])
VALUES ( N'Adidas Superstar Diamond', N'image/adidas2.jpg', 100.0000, N'Giày Thể Thao Adidas Superstar Diamond', N'Giày Thể Thao Adidas Superstar Diamond được làm từ chất liệu da tổng hợp cao cấp, mang nét thể thao khỏe khoắn và năng động. Đôi giày này có độ ôm chân vừa vặn, mềm mại cho người sử dụng thoải mái khi thử sức với các loại hình thể thao khác nhau', 1, 5,20)
INSERT [dbo].[product] ( [name], [image], [price], [title], [description], [cateID], [sell_ID],[quantity])
VALUES ( N'Giày Adidas Ultra Boost', N'image/adidas5.jpg', 100.0000, N'Giày Adidas Ultra Boost', N'Giày Adidas Ultra Boost là một trong những mẫu giày chạy bộ được yêu thích và bán chạy nhất của Adidas. Được ra mắt lần đầu tiên vào năm 2015, Ultraboost đã trở thành một siêu phẩm giày chạy bộ với nhiều cải tiến đáng kể về đường nét và thiết kế là một trong những mẫu giày chạy bộ được yêu thích và bán chạy nhất của Adidas. Được ra mắt lần đầu tiên vào năm 2015, Ultraboost đã trở thành một siêu phẩm giày chạy bộ với nhiều cải tiến đáng kể về đường nét và thiết kế', 1, 8,20)
INSERT [dbo].[product] ( [name], [image], [price], [title], [description], [cateID], [sell_ID],[quantity])
VALUES ( N'BIG BALL CHUNKY MASK NEW YORK YANKEES', N'image/mlb2.jpg', 100.0000, N'GIÀY SỤC MLB BIG BALL CHUNKY MASK NEW YORK YANKEES', N'GIÀY SỤC MLB BIG BALL CHUNKY MASK NEW YORK YANKEES có thiết kế chunky (dày, to) rất đặc trưng với đế giày phía sau được thiết kế lớn hơn so với phần trước, tạo nên sự khác biệt và phong cách riêng. Được làm từ chất liệu da cao cấp, mềm mại, dễ vệ sinh.', 3, 5, 20)
INSERT [dbo].[product] ( [name], [image], [price], [title], [description], [cateID], [sell_ID],[quantity])
VALUES ( N'Run Star Hi ‘Black’', N'image/converse1.jpg', 100.0000, N'Giày Converse Run Star Hi ‘Black’', N'Giày Converse Run Star Hi ‘Black’ là một đôi giày thể thao cao cấp với kiểu dáng độc đáo, đậm phong cách high-fashion và độ hack chiều cao cực ảo. Được nhiều người săn đón bởi màu sắc basic dễ phối quần áo cùng vẻ ngoài cá tính', 4, 5,20)
INSERT [dbo].[product] ( [name], [image], [price], [title], [description], [cateID], [sell_ID],[quantity])
VALUES ( N'Nike Low Cream Blue', N'image/nike6.jpg', 100.0000, N'Giày Nike Air Force 1 Low Cream Blue', N'Giày Nike Air Force 1 Low Cream Blue là một đôi giày thời trang và linh hoạt, kết hợp thiết kế cổ điển với các tính năng hiện đại. Đôi giày có phần trên bằng da trắng với các chi tiết màu đen và hình ảnh gấu trúc ở phần gót. Biểu tượng Nike Swoosh cũng được thể hiện bằng màu đen ở hai bên', 2, 9,20)
INSERT [dbo].[product] ( [name], [image], [price], [title], [description], [cateID], [sell_ID],[quantity])
VALUES ( N'Adidas Superstar', N'image/adidas3.jpg', 110.0000, N'Giày Thể Thao Adidas Superstar', N'Giày Thể Thao Adidas Superstar được làm từ chất liệu da tổng hợp cao cấp, mang nét thể thao khỏe khoắn và năng động. Đôi giày này có độ ôm chân vừa vặn, mềm mại cho người sử dụng thoải mái khi thử sức với các loại hình thể thao khác nhau', 1, 6,20)
INSERT [dbo].[product] ( [name], [image], [price], [title], [description], [cateID], [sell_ID],[quantity])
VALUES ( N'New York Yankees White Grey', N'image/mlb4.jpg', 120.0000, N'Giày MLB Chunky Liner Low New York Yankees White Grey', N'Giày MLB Chunky Liner Low New York Yankees White Grey có thiết kế chunky (dày, to) rất đặc trưng với đế giày phía sau được thiết kế lớn hơn so với phần trước, tạo nên sự khác biệt và phong cách riêng. Được làm từ chất liệu da cao cấp, mềm mại, dễ vệ sinh.', 3, 7, 20)
INSERT [dbo].[product] ( [name], [image], [price], [title], [description], [cateID], [sell_ID],[quantity])
VALUES ( N'Giày Converse Chuck Taylor All Star Classic', N'image/converse4.jpg', 100.0000, N'Giày Converse Chuck Taylor All Star Classic', N'Giày Converse Chuck Taylor All Star Classic là một đôi giày thể thao cao cấp với kiểu dáng độc đáo, đậm phong cách high-fashion và độ hack chiều cao cực ảo. Được nhiều người săn đón bởi màu sắc basic dễ phối quần áo cùng vẻ ngoài cá tính', 1,7,20)
INSERT [dbo].[product] ( [name], [image], [price], [title], [description], [cateID], [sell_ID],[quantity])
VALUES ( N'Nike Shadow', N'image/nike7.jpg', 100.0000, N'Giày Nike Air Force 1 Shadow', N'Giày Nike Air Force 1 Shadow là một đôi giày thời trang và linh hoạt, kết hợp thiết kế cổ điển với các tính năng hiện đại. Đôi giày có phần trên bằng da trắng với các chi tiết màu đen và hình ảnh gấu trúc ở phần gót. Biểu tượng Nike Swoosh cũng được thể hiện bằng màu đen ở hai bên', 2, 1,20)
INSERT [dbo].[product] ( [name], [image], [price], [title], [description], [cateID], [sell_ID],[quantity])
VALUES ( N'Low Denim Blue White', N'image/nike8.jpg', 102.0000, N'Giày Nike Air Force 1 07 Low Denim Blue White', N'Giày Nike Air Force 1 07 Low Denim Blue White là một đôi giày thời trang và linh hoạt, kết hợp thiết kế cổ điển với các tính năng hiện đại. Đôi giày có phần trên bằng da trắng với các chi tiết màu đen và hình ảnh gấu trúc ở phần gót. Biểu tượng Nike Swoosh cũng được thể hiện bằng màu đen ở hai bên', 2, 5,20)
INSERT [dbo].[product] ( [name], [image], [price], [title], [description], [cateID], [sell_ID],[quantity])
VALUES ( N'Tie Dye Pk God Factory', N'image/nike9.jpg', 130.0000, N'Giày Nike Air Jordan 1 Retro High Tie Dye Pk God Factory', N'Giày Nike Air Jordan 1 Retro High Tie Dye Pk God Factory có màu sắc tối, sử dụng chất liệu da cao cấp. Đôi giày này có logo Swoosh màu đen, logo Jordan Wings ở mắt cá chân và thương hiệu Nike Air trên lưỡi giày', 2, 5,20)
INSERT [dbo].[product] ( [name], [image], [price], [title], [description], [cateID], [sell_ID],[quantity])
VALUES ( N'Nike Air Jordan 1 High', N'image/nike10.jpg', 110.0000, N'Giày Nike Air Jordan 1 High', N'Giày Nike Air Jordan 1 High có màu sắc tối, sử dụng chất liệu da cao cấp. Đôi giày này có logo Swoosh màu đen, logo Jordan Wings ở mắt cá chân và thương hiệu Nike Air trên lưỡi giày', 2, 6,20)
INSERT [dbo].[product] ( [name], [image], [price], [title], [description], [cateID], [sell_ID],[quantity])
VALUES ( N'Pink Black', N'image/nike11.jpg', 140.0000, N'Giày Nike Air Jordan 1 Low Pink Black', N'Giày Nike Air Jordan 1 Low Pink Black có màu sắc tối, sử dụng chất liệu da cao cấp. Đôi giày này có logo Swoosh màu đen, logo Jordan Wings ở mắt cá chân và thương hiệu Nike Air trên lưỡi giày', 2, 7,20)
INSERT [dbo].[product] ( [name], [image], [price], [title], [description], [cateID], [sell_ID],[quantity])
VALUES ( N'Mid Se Union Black Toe', N'image/nike12.jpg', 135.0000, N'Giày Nike Air Jordan 1 Mid Se Union Black Toe', N'Giày Nike Air Jordan 1 Mid Se Union Black Toe có màu sắc tối, sử dụng chất liệu da cao cấp. Đôi giày này có logo Swoosh màu đen, logo Jordan Wings ở mắt cá chân và thương hiệu Nike Air trên lưỡi giày', 2, 8,20)
INSERT [dbo].[product] ( [name], [image], [price], [title], [description], [cateID], [sell_ID],[quantity])
VALUES ( N'Hyper Royal', N'image/nike13.jpg', 100.0000, N'Giày Nike Air Jordan 1 Retro High OG Hyper Royal', N'Giày Nike Air Jordan 1 Retro High OG Hyper Royal có màu sắc tối, sử dụng chất liệu da cao cấp. Đôi giày này có logo Swoosh màu đen, logo Jordan Wings ở mắt cá chân và thương hiệu Nike Air trên lưỡi giày', 2, 9,20)
INSERT [dbo].[product] ( [name], [image], [price], [title], [description], [cateID], [sell_ID],[quantity])
VALUES ( N'UNC To Chicago', N'image/nike14.jpg', 100.0000, N'Giày Nike Air Jordan 1 UNC To Chicago', N'Giày Nike Air Jordan 1 UNC To Chicago có màu sắc tối, sử dụng chất liệu da cao cấp. Đôi giày này có logo Swoosh màu đen, logo Jordan Wings ở mắt cá chân và thương hiệu Nike Air trên lưỡi giày', 2, 1,20)
INSERT [dbo].[product] ( [name], [image], [price], [title], [description], [cateID], [sell_ID],[quantity])
VALUES ( N'University Blue Pk God Factory', N'image/nike15.jpg', 100.0000, N'Giày Nike Air Jordan 1 High University Blue Pk God Factory', N'Giày Nike Air Jordan 1 High University Blue Pk God Factory có màu sắc tối, sử dụng chất liệu da cao cấp. Đôi giày này có logo Swoosh màu đen, logo Jordan Wings ở mắt cá chân và thương hiệu Nike Air trên lưỡi giày', 2, 5,20)
INSERT [dbo].[product] ( [name], [image], [price], [title], [description], [cateID], [sell_ID],[quantity])
VALUES ( N'adidas x LEGO', N'image/adidas1.jpg', 100.0000, N'Giày thể thao adidas x LEGO', N'Giày thể thao adidas x LEGO là một sản phẩm hợp tác giữa hai thương hiệu nổi tiếng. Đôi giày này có nhiều màu sắc và kiểu dáng khác nhau, phù hợp với nhiều lứa tuổi', 1, 1,20)
INSERT [dbo].[product] ( [name], [image], [price], [title], [description], [cateID], [sell_ID],[quantity])
VALUES ( N'Adidas Superstar HOLOGRAM', N'image/adidas4.jpg', 120.0000, N'Giày Thể Thao Adidas Superstar HOLOGRAM', N'Giày Thể Thao Adidas Superstar HOLOGRAM được làm từ chất liệu da tổng hợp cao cấp, mang nét thể thao khỏe khoắn và năng động. Đôi giày này có độ ôm chân vừa vặn, mềm mại cho người sử dụng thoải mái khi thử sức với các loại hình thể thao khác nhau', 1, 7,20)
INSERT [dbo].[product] ( [name], [image], [price], [title], [description], [cateID], [sell_ID],[quantity])
VALUES ( N'Ny New York Yankees L.Beige', N'image/mlb3.jpg', 120.0000, N'Giày MLB Ny New York Yankees L.Beige', N'Giày MLB Ny New York Yankees L.Beige có thiết kế chunky (dày, to) rất đặc trưng với đế giày phía sau được thiết kế lớn hơn so với phần trước, tạo nên sự khác biệt và phong cách riêng. Được làm từ chất liệu da cao cấp, mềm mại, dễ vệ sinh.', 3, 6, 20)
INSERT [dbo].[product] ( [name], [image], [price], [title], [description], [cateID], [sell_ID],[quantity])
VALUES ( N'Chunky High Padding', N'image/mlb5.jpg', 120.0000, N'Giày MLB Chunky High Padding', N'Giày MLB Chunky High Padding có thiết kế chunky (dày, to) rất đặc trưng với đế giày phía sau được thiết kế lớn hơn so với phần trước, tạo nên sự khác biệt và phong cách riêng. Được làm từ chất liệu da cao cấp, mềm mại, dễ vệ sinh.', 3, 1, 20)
INSERT [dbo].[product] ( [name], [image], [price], [title], [description], [cateID], [sell_ID],[quantity])
VALUES ( N'Run Star Hike', N'image/converse2.jpg', 100.0000, N'Converse Run Star Hike', N'Converse Run Star Hike là một đôi giày thể thao cao cấp với kiểu dáng độc đáo, đậm phong cách high-fashion và độ hack chiều cao cực ảo. Được nhiều người săn đón bởi màu sắc basic dễ phối quần áo cùng vẻ ngoài cá tính', 1, 8,20)
SET IDENTITY_INSERT [dbo].[product] OFF

GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Account] FOREIGN KEY([sell_ID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Account]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([cateID])
REFERENCES [dbo].[Category] ([cid])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Account]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Product]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Product]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Account] FOREIGN KEY([aid])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Account]
GO
ALTER TABLE [dbo].[Reply]  WITH CHECK ADD  CONSTRAINT [FK_Reply_Comment] FOREIGN KEY([commentid])
REFERENCES [dbo].[Comment] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Account]


