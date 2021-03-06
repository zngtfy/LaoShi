USE [LaoShi]
GO
INSERT [System].[CodeType] ([Code], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (N'HomeBanner', N'Home Banner', 1, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[CodeType] ([Code], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (N'NewsCategory', N'Category', 6, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[CodeType] ([Code], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (N'NewsType', N'News Type', 7, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [System].[Code] ON 
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, NULL, N'NewsCategory', N'Social', N'Social', 1, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, NULL, N'NewsCategory', N'Economic', N'Economic', 2, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, NULL, N'NewsCategory', N'IT', N'Information Technology', 3, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, NULL, N'NewsCategory', N'Sport', N'Sports', 4, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, NULL, N'NewsType', N'Internal', N'Company Internal', 1, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, NULL, N'NewsType', N'External', N'Company External', 2, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, NULL, N'NewsCategory', N'Company', N'Compamy News', 0, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (8, NULL, N'HomeBanner', N'/assets/img/slide/91.png', N'<h1 class="display-5 font-weight-normal">Hao Lee laoshi</h1>
<p class="lead font-weight-normal">Chào mừng bạn đến với trang thông tin Hao Lee LaoShi, đây là trang thông tin về Hao Lee và là ứng dụng hỗ trợ học tập cho các bạn sinh viên, học viên!</p>', 1, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (9, NULL, N'HomeBanner', N'/assets/img/slide/92.png', N'<h1 class="display-5 font-weight-normal">Chào  mừng đến với Website Thầy Hiếu!</h1>
<p class="lead font-weight-normal">Chào mừng bạn đến với trang thông tin Hao Lee LaoShi, đây là trang thông tin về Hao Lee và là ứng dụng hỗ trợ học tập cho các bạn sinh viên, học viên!</p>', 2, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [System].[Code] ([Id], [ParentId], [CodeType], [Value], [DisplayAs], [Sequence], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (11, NULL, N'HomeBanner', N'/assets/img/slide/90.png', N'<h1 class="display-5 font-weight-normal">Xin chào các bạn !!</h1>
<p class="lead font-weight-normal">Chào mừng bạn đến với trang thông tin Hao Lee LaoShi, đây là trang thông tin về Hao Lee và là ứng dụng hỗ trợ học tập cho các bạn sinh viên, học viên!</p>', 3, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [System].[Code] OFF
GO
SET IDENTITY_INSERT [Business].[News] ON 
GO
INSERT [Business].[News] ([Id], [Title], [Brief], [Content], [Category], [NewsType], [Group], [ImgUrl], [Thumbnail], [NewsBy], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, N'Traveling MRT with team', N'Traveling MRT with team', N'The Singapore Tourist Pass is a special ez-link card that offers tourist unlimited travel* on Singapore’s basic bus services, MRT and LRT trains for the duration that it is valid. You can now take in the sights and sounds of Singapore in the comfort of the island’s extensive train system and public bus network. At wallet-friendly prices, you do not have to worry about having insufficient funds for your transport needs with the Singapore Tourist Pass. All you have to do is to purchase the Singapore Tourist Pass, choose the number of day passes you require, use for your unlimited rides on buses and trains, and refund the card before you leave Singapore!', N'Company', N'Internal', 2, N'assets/img/news/news11.jpg', N'assets/img/news/news11_thump.jpg', 1, 1, 1, CAST(N'2018-11-05T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[News] ([Id], [Title], [Brief], [Content], [Category], [NewsType], [Group], [ImgUrl], [Thumbnail], [NewsBy], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, N'VOST visitied Merlion', N'The Merlion (Malay: Singa-Laut, Chinese: 鱼尾狮, Tamil: மெர்லயன்) is the official mascot of Singapore, depicted as a mythical creature with a lion''s head and the body of a fish. Being of prominent symbolic nature to Singapore and Singaporeans in general, it is widely used to represent both the city state and its people in sports teams, advertising, branding, tourism and as a national personification.', N'Its name combines "mer", meaning the sea, and "lion". The fish body represents Singapore''s origin as a fishing village when it was called Temasek, which means "sea town" in Javanese. The lion head represents Singapore''s original name—Singapura—meaning "lion city" or "kota singa".

The symbol was designed by Alec Fraser-Brunner, a member of the Souvenir Committee and curator of the Van Kleef Aquarium, for the logo of the Singapore Tourism Board (STB) in use from 26 March 1964 to 1997 and has been its trademarked symbol since 20 July 1966. Although the STB changed their logo in 1997, the STB Act continues to protect the Merlion symbol.[2] Approval must be received from STB before it can be used. The Merlion appears frequently on STB-approved souvenirs. <br/> You’ve probably seen images of Singapore’s national icon, the mythical Merlion with the head of a lion and the body of a fish.

A fishy tale
A family of tourists posing in front of the Merlion
The body symbolises Singapore''s humble beginnings as a fishing village when it was called Temasek, meaning ''sea town'' in Old Javanese.
Its head represents Singapore’s original name, Singapura, or ‘lion city’ in Malay.

Today, you can glimpse this legend at Merlion Park. Spouting water from its mouth, the Merlion statue stands tall at 8.6 metres and weighs 70 tonnes.

This icon is a ‘must-see’ for tourists visiting Singapore, similar to other significant landmarks around the world.

Built by local craftsman Lim Nang Seng, it was unveiled on 15 September 1972 by then Prime Minister Lee Kuan Yew at the mouth of the Singapore River, to welcome all visitors to Singapore. ', N'Company', N'Internal', 2, N'assets/img/news/news10.jpg', N'Img/News/news10_thump.jpg', 2, 1, 1, CAST(N'2018-11-06T10:30:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[News] ([Id], [Title], [Brief], [Content], [Category], [NewsType], [Group], [ImgUrl], [Thumbnail], [NewsBy], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, N'A night in Singapore', N'Singapore is a bustling city full of entertainment, culture, and friendly people.

Known for its multiculturalism and excessive wealth, there was no shortage spent on making it a number one destination for tourists.', N'Like any big city, during the day people are rushing to and from work.

But at night, the best parts of Singapore light up.

Check out our list of the best things to do in Singapore at night.', N'Company', N'Internal', 2, N'assets/img/news/news09.jpg', N'Img/News/news9.jpg', 3, 1, 1, CAST(N'2018-11-06T22:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[News] ([Id], [Title], [Brief], [Content], [Category], [NewsType], [Group], [ImgUrl], [Thumbnail], [NewsBy], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, N'VOST enjoyed Gardens by the bay, Singapore', N'Gardens by the Bay is a nature park spanning 101 hectares (250 acres) of reclaimed land[2] in the Central Region of Singapore, adjacent to the Marina Reservoir. The park consists of three waterfront gardens: Bay South Garden (in Marina South), Bay East Garden (in Marina East) and Bay Central Garden (in Downtown Core and Kallang).[3] The largest of the gardens is Bay South Garden at 54 hectares (130 acres). Its Flower Dome is the largest glass greenhouse in the world.[4]', N'Gardens by the Bay is part of the nation''s plans to transform its "Garden City" to a "City in a Garden", with the aim of raising the quality of life by enhancing greenery and flora in the city. First announced by the Prime Minister, Lee Hsien Loong, at the National Day Rally in 2005, Gardens by the Bay was intended to be Singapore''s premier urban outdoor recreation space, and a national icon.

Being one of the popular tourist attractions in Singapore, the park received 6.4 million visitors in 2014, while topping its 20 millionth visitor mark in November 2015.[5]', N'Company', N'Internal', 2, N'assets/img/news/news08.jpg', N'Img/News/news08.jpg', 4, 1, 1, CAST(N'2018-11-05T15:30:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[News] ([Id], [Title], [Brief], [Content], [Category], [NewsType], [Group], [ImgUrl], [Thumbnail], [NewsBy], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, N'VOST are having Sweetsoups', N'The 10 Most Delightful Popular Vietnamese Desserts to Indulge In', N'Vietnam is famous for its Pho soup, Bánh Mì sandwiches, and other delicious soups and rice noodles meals.

What about Vietnamese desserts?

Well, you will find yourself in dessert heaven if you like sweets and are open to trying new flavors and textures. Indeed, Vietnam has an endless list of desserts, from sweet soups to doughy rolls and cakes.

Not only you will find a wide variety of Vietnamese sweets to choose from, the best part is that they are made with healthy ingredients and are low in sugar!

In this article, you find a selection of 10 of the most delightful popular Vietnamese desserts. Get ready for an indulgent and exotic Vietnam dessert adventure.', N'Company', N'Internal', 2, N'assets/img/news/news07.jpg', N'Img/News/news07.jpg', 1, 1, 1, CAST(N'2018-11-14T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[News] ([Id], [Title], [Brief], [Content], [Category], [NewsType], [Group], [ImgUrl], [Thumbnail], [NewsBy], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, N'VOST are having some snacks', N'We were looking for a quick and easy pizza recipe… just wanted a quick snack and Friday is always pizza night in our house!  I didn’t want to make dough, I was looking for something easier.', N'These Easy Pizza Snack Bites are what we came up with, we were shocked at how delicious these were!  The snack quickly became a second batch known as dinner!  These little guys took 8 minutes to whip up start to finish!', N'Company', N'Internal', 2, N'assets/img/news/news06.jpg', N'Img/News/news06.jpg', 3, 1, 1, CAST(N'2018-11-16T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[News] ([Id], [Title], [Brief], [Content], [Category], [NewsType], [Group], [ImgUrl], [Thumbnail], [NewsBy], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, N'The 1st break-tea in the new Office', N'New spaces can sometimes be difficult to adjust to. Even if you’re relocating to a new area where you’ll be working for a company you’ve been with for years, the new environment itself can be distracting to your day to day work.', N'One of the best ways to get to work is to first ensure your surroundings maintain the important aspects of work environment: organisation, comfort, and functionality. <br/> “Having a cup of tea is not only tasty and refreshing, it gives you a moment to stop and think without distraction. Whether it’s to have a chat with a friend, ponder a business idea, or watch an inspirational video, the simple act of enjoying a cuppa can give you the time you need. All over the world, but especially in the UK, cups of tea provide a great excuse for colleagues to join together and have a chat. There’s no end to the great ideas dreamed up by people talking around the kettle or the water cooler.”
And that’s the point; the most important benefits of a tea break are reasonably unmeasurable. At the very least, they give us a chance to have a laugh and enjoy the company of our colleagues, most of the time.”', N'Company', N'Internal', NULL, N'assets/img/news/news05.jpg', N'Img/News/news05.jpg', 4, 1, 1, CAST(N'2018-12-18T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[News] ([Id], [Title], [Brief], [Content], [Category], [NewsType], [Group], [ImgUrl], [Thumbnail], [NewsBy], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (8, N'Merry Xmas 2018', N'Wishing everyone a Merry Christmas and a Happy New year!', N'One of the best ways to get to work is to first ensure your surroundings maintain the important aspects of work environment: organisation, comfort, and functionality. <br/> “Having a cup of tea is not only tasty and refreshing, it gives you a moment to stop and think without distraction. Whether it’s to have a chat with a friend, ponder a business idea, or watch an inspirational video, the simple act of enjoying a cuppa can give you the time you need. All over the world, but especially in the UK, cups of tea provide a great excuse for colleagues to join together and have a chat. There’s no end to the great ideas dreamed up by people talking around the kettle or the water cooler.”', N'Company', N'Internal', NULL, N'assets/img/news/news05a.jpg', N'Img/News/news05a.jpg', 1, 1, 1, CAST(N'2018-12-25T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[News] ([Id], [Title], [Brief], [Content], [Category], [NewsType], [Group], [ImgUrl], [Thumbnail], [NewsBy], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (9, N'Happy new Year 2019', N'Haaaaaappppyyy New Year!!', N'The new year is here and it’s time we celebrate with tons of excitement! We survived 2018 (and what a year that was) and now we’re rolling happily into 2019. The past year was pretty amazing for the Labiotech team, filled with great success and fantastic new members. As we enter the new year, we hope you’ll continue supporting up as you have and help us grow even more! Cheeeeeers! <br/> Overall, 2018 was a lot of fun and we’re pretty proud of our achievements. Now we’re going to rock on into 2019 and continue with our goal of bringing you the best biotech news in Europe. Stay tuned for more exciting developments. Bring it on!

We would love to hear your feedback – tell us what you love, what you don’t love so much, and what you would like to see happen in the future. ', N'Company', N'Internal', NULL, N'assets/img/news/news04.jpg', N'Img/News/news04.jpg', 1, 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[News] ([Id], [Title], [Brief], [Content], [Category], [NewsType], [Group], [ImgUrl], [Thumbnail], [NewsBy], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (10, N'Annual Company Dinner 2019', N'The Annual Dinner 2019 will be held on Friday the 8th of March @ 7.30pm in the Radisson Blu Hotel, Golden Lane, Dublin 8.

Dress code is smart casual and there is a late bar extension, tickets are now on sale €65 each. All tickets must be pre-booked no walk up facility on the night.', N'Some background


The Past Pupils Annual dinner is the Union’s single biggest event. The dinner has occurred for over 80 years and is a unique gathering of past pupils of Terenure College in a relaxed and friendly setting.


The dinner occurs usually either in February or March each year. The dinner is held in a Dublin hotel and is pre booked by availing of the automated booking system on this web site. Details of the dinner (cost , location , dress code ,times etc) are all set out on this web site and are typically available at least two months before the dinner takes place. All tickets must be paid prior to the dinner and no money can be accepted on the evening of the dinner.', N'Company', N'Internal', NULL, N'assets/img/news/news03.jpg', N'Img/News/news03.jpg', 1, 1, 1, CAST(N'2019-02-22T18:30:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[News] ([Id], [Title], [Brief], [Content], [Category], [NewsType], [Group], [ImgUrl], [Thumbnail], [NewsBy], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (11, N'Happy Women day ', N'Happy Women day  2019', N'Celebrate International Women’s Day with these empowering Happy Women’s Day quotes. International Women’s Day or IWD is remembered all around the world every March 8. It’s also celebrated on August 9th each year in South Africa under the name National Women’s Day as a public holiday. It is the celebration of the achievements of women all over the planet for their achievements in all aspects of society and civilization including social, economic, cultural and political arenas.

In some countries, IWD is celebrated as a day of appreciation much like Mother’s Day. For other countries, however, International Women’s Day is a day which highlights the political and human rights struggles of women worldwide.', N'Company', N'Internal', NULL, N'assets/img/news/news02.jpg', N'Img/News/news02.jpg', 1, 1, 1, CAST(N'2019-03-08T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[News] ([Id], [Title], [Brief], [Content], [Category], [NewsType], [Group], [ImgUrl], [Thumbnail], [NewsBy], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (12, N'Thank you', N'Thank you', N'The dinner is open to all past pupils of Terenure College no matter what year you have left the College.
While any past pupil is welcome to attend the dinner any year it is the common practice that year groups attend in five year cycles with the pupils leaving this year for example enjoying their first annual re union dinner five years from now and then repeating thereafter every five years. It is also typical that a number of co coordinators from each year group work to publicise the dinner with their fellow past pupils to generate support and ensure a successful dinner for that year group attending. Details of the co coordinators are also posted on the website well in advance of the dinner.

The President of the Past Pupils Union invites a number of guests each year. The guests include presidents of other past pupils unions, Carmelites, teaching staff from the College and friends of the College.', N'Company', N'Internal', NULL, N'assets/img/news/news01a.jpg', N'Img/News/news01a.jpg', 1, 1, 1, CAST(N'2019-02-22T18:30:00.000' AS DateTime), NULL, NULL)
GO
INSERT [Business].[News] ([Id], [Title], [Brief], [Content], [Category], [NewsType], [Group], [ImgUrl], [Thumbnail], [NewsBy], [Status], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (13, N'The Power of Teamwork', N'We believe in the power of teamwork, not just between individuals but also between companies and organisations. No man is an island, no company too.', N'The Power of Teamwork

We believe in the power of teamwork, not just between individuals but also between companies and organisations. No man is an island, no company too.

At APPOiNT we believe that our unique positions (locations too), experience and the synergy of our team can help companies scale their backend support without limits. (They say sky in the limit, we believe the universe is)

Our company was born with the understanding of the growing pains and challenges that tech companies are facing in developed countries i.e. Scarcity of human resources and space cost and constraint. Therefore we think out of the box(country) and look-out to develop solutions for these challenges.

We are looking forward to an opportunity to work with you. We believe our solution will ease your growing pains. Allow us to talk to you. We are based in Singapore and operating in Vietnam.', N'Company', N'Internal', NULL, N'assets/img/news/news01.jpg', N'Img/News/news01.jpg', 1, 1, 1, CAST(N'2019-02-22T18:30:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [Business].[News] OFF
GO
