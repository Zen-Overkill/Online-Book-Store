USE [BooksManagement]
GO
/****** Object:  Table [dbo].[tblBooks]    Script Date: 12/9/2021 10:18:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBooks](
	[bookID] [nvarchar](50) NOT NULL,
	[bookName] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[categoryID] [nvarchar](50) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[statusID] [int] NOT NULL,
	[createDate] [datetime] NULL,
	[image] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblBooks] PRIMARY KEY CLUSTERED 
(
	[bookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 12/9/2021 10:18:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [nvarchar](50) NOT NULL,
	[categoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK__tblCateg__23CAF1F8B2B1E4A9] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 12/9/2021 10:18:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[orderDetailID] [nvarchar](30) NOT NULL,
	[orderID] [nvarchar](30) NOT NULL,
	[bookID] [nvarchar](50) NOT NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[statusID] [int] NOT NULL,
 CONSTRAINT [PK__tblOrder__E4FEDE2A8037A1A5] PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 12/9/2021 10:18:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[orderID] [nvarchar](30) NOT NULL,
	[email] [nvarchar](50) NULL,
	[userID] [nvarchar](30) NOT NULL,
	[address] [nvarchar](50) NULL,
	[phone] [nvarchar](11) NULL,
	[totalMoney] [float] NULL,
	[orderDate] [date] NULL,
	[statusID] [int] NOT NULL,
	[paymentStatus] [nvarchar](30) NULL,
 CONSTRAINT [PK__tblOrder__0809337D3F9FAF18] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 12/9/2021 10:18:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [nvarchar](30) NOT NULL,
	[roleName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStatus]    Script Date: 12/9/2021 10:18:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatus](
	[statusID] [int] NOT NULL,
	[statusName] [nvarchar](50) NULL,
 CONSTRAINT [PK__tblStatu__36257A38E6A419A9] PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 12/9/2021 10:18:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](30) NOT NULL,
	[name] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[phone] [nvarchar](11) NULL,
	[address] [nvarchar](100) NULL,
	[createDate] [datetime] NULL,
	[roleID] [nvarchar](30) NULL,
	[statusID] [int] NOT NULL,
 CONSTRAINT [PK__tblUsers__CB9A1CDF5A5F995D] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblBooks] ([bookID], [bookName], [description], [categoryID], [price], [quantity], [statusID], [createDate], [image]) VALUES (N'1', N'Overlord', N'After announcing it will be discontinuing all service, the internet game ‘Yggdrasil’ shut down… That was the plan, but for some reason, the player character did not log out some time after the server was closed. NPCs start to become sentient. A normal youth who loves gaming in the real world seemed to have been transported into an alternate world along with his guild, becoming the strongest mage with the appearance of a skeleton, Momonga. He leads his guild ‘Ainz Ooal Gown’ towards an unprecedented legendary fantasy adventure!', N'5', 20, 100, 1, CAST(N'2021-03-09T00:00:00.000' AS DateTime), N'https://avatar.novelonlinefree.com/avatar_novels/34402-1608940028.jpg')
INSERT [dbo].[tblBooks] ([bookID], [bookName], [description], [categoryID], [price], [quantity], [statusID], [createDate], [image]) VALUES (N'2', N'My Youth Romantic Comedy Is Wrong', N'Yahari Ore no Seishun Rabukome wa Machigatte Iru is a romantic comedy which revolves around antisocial high school student, Hachiman Hikigaya, who has no friends, no girlfriend, and a severely distorted view on life.
When he sees his cla.s.smates talking excitedly about living their adolescent lives, he mutters, “They’re a bunch of liars.” When he is asked about his future dreams, he responds, “Not working.” In an attempt to fix Hachiman’s twisted personality, his teacher forces him to join the volunteer ‘service club’, where the only other member happens to be one of the school’s most beautiful and smartest girls, Yukino Yukinos.h.i.ta.', N'5', 30, 120, 1, CAST(N'2021-09-10T00:00:00.000' AS DateTime), N'https://avatar.novelonlinefree.com/avatar_novels/2368-yahari_ore_no_seishun_love_come_wa_machigatte_iru.jpg')
INSERT [dbo].[tblBooks] ([bookID], [bookName], [description], [categoryID], [price], [quantity], [statusID], [createDate], [image]) VALUES (N'3', N'Konosuba', N'Game loving shut-in Kazuma Sato''s life as a young schoolboy in Japan abruptly comes to an early end...or at least it was supposed to. When he opens his eyes, though, he sees a beautiful goddess that offers him a once in an after-lifetime chance to be reborn in a parallel world. The catch is that the world is violent and threatened by a growing evil! Fortunately, he can choose any one thing to bring with him. So he chooses the goddess, Aqua! And so his adventure with his gorgeous companion begins--if he could just get enough money and food to survive, keep his goddess out of trouble, and avoid grabbing the attention of the Demon King''s army!', N'5', 20, 110, 1, CAST(N'2021-09-15T00:00:00.000' AS DateTime), N'https://images-na.ssl-images-amazon.com/images/I/51JimmQ5+YL._SX329_BO1,204,203,200_.jpg')
INSERT [dbo].[tblBooks] ([bookID], [bookName], [description], [categoryID], [price], [quantity], [statusID], [createDate], [image]) VALUES (N'4', N'Rascal Does Not Dream of Bunny Girl Senpai', N'Bunny girls do not live in libraries. This is simply common sense. And yet, that''s exactly where Sakuta finds one in the wild. More bewildering is who the bunny girl is: Mai Sakurajima, a girl one year older than Sakuta, famous at their school for her acting career even though she''s currently on break. To top it all off, it seems like no one else in the library can see Mai at all, no matter what she does or...wears. Wanting to find out more about this mystery and maybe get a little closer to this beautiful upperclassman in the process, Sakuta launches an investigation to discover why an unforgettable bunny girl keeps becoming totally invisible.', N'5', 25, 50, 1, CAST(N'2021-09-15T00:00:00.000' AS DateTime), N'https://images-na.ssl-images-amazon.com/images/I/5108G7+0pnL._SX331_BO1,204,203,200_.jpg')
INSERT [dbo].[tblBooks] ([bookID], [bookName], [description], [categoryID], [price], [quantity], [statusID], [createDate], [image]) VALUES (N'5', N'Isekai Apocalypse Mynoghra', N'I reincarnated as an evil god.Ira Takuto succumbed to illness at a young age and ended up reincarnating in a world that resembled the strategy simulation game, 『Eternal Nations』, of which he loved playing when alive. What appeared in front of him was Atou, a girl belonging to the evil civilization that he used to play as, 「Mynoghra」. The two of them decided to create a new country in this world once again.', N'4', 32, 60, 1, CAST(N'2021-09-20T00:00:00.000' AS DateTime), N'https://ww.mangakakalot.tv/mangaimage/manga-iv985956.jpg')
GO
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'1', N'Code')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'2', N'Comedy')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'3', N'Action')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'4', N'Slice of life')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'5', N'Light Novel')
GO
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'AD', N'Admin')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'US', N'User')
GO
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (0, N'Disabled')
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (1, N'Enabled')
GO
INSERT [dbo].[tblUsers] ([userID], [name], [password], [phone], [address], [createDate], [roleID], [statusID]) VALUES (N'admin', N'admin', N'1', N'0123456789', N'Ho Chi Minh', CAST(N'2021-07-11T00:00:00.000' AS DateTime), N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [name], [password], [phone], [address], [createDate], [roleID], [statusID]) VALUES (N'khanh', N'khanhvo', N'1', N'1673514127', N'Ca Mau', CAST(N'2021-07-11T00:00:00.000' AS DateTime), N'AD', 0)
INSERT [dbo].[tblUsers] ([userID], [name], [password], [phone], [address], [createDate], [roleID], [statusID]) VALUES (N'tester', N'tester', N'1', N'0000000000', N'', CAST(N'2021-07-11T00:00:00.000' AS DateTime), N'US', 0)
INSERT [dbo].[tblUsers] ([userID], [name], [password], [phone], [address], [createDate], [roleID], [statusID]) VALUES (N'user', N'user', N'1', N'1234567890', N'', CAST(N'2021-07-11T00:00:00.000' AS DateTime), N'US', 1)
GO
ALTER TABLE [dbo].[tblBooks]  WITH CHECK ADD  CONSTRAINT [FK_tblBooks_tblCategory] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblBooks] CHECK CONSTRAINT [FK_tblBooks_tblCategory]
GO
ALTER TABLE [dbo].[tblBooks]  WITH CHECK ADD  CONSTRAINT [FK_tblBooks_tblStatus] FOREIGN KEY([statusID])
REFERENCES [dbo].[tblStatus] ([statusID])
GO
ALTER TABLE [dbo].[tblBooks] CHECK CONSTRAINT [FK_tblBooks_tblStatus]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__tblOrderD__order__32E0915F] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK__tblOrderD__order__32E0915F]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblBooks] FOREIGN KEY([bookID])
REFERENCES [dbo].[tblBooks] ([bookID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblBooks]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblStatus] FOREIGN KEY([statusID])
REFERENCES [dbo].[tblStatus] ([statusID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblStatus]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK__tblOrders__statu__31EC6D26] FOREIGN KEY([statusID])
REFERENCES [dbo].[tblStatus] ([statusID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK__tblOrders__statu__31EC6D26]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK__tblOrders__userI__30F848ED] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK__tblOrders__userI__30F848ED]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK__tblUsers__status__300424B4] FOREIGN KEY([statusID])
REFERENCES [dbo].[tblStatus] ([statusID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK__tblUsers__status__300424B4]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRoles] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRoles]
GO
