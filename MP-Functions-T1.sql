USE [MenuPlanner]
GO
/****** Object:  View [dbo].[PreferenceVsOrder]    Script Date: 01/05/2017 15:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PreferenceVsOrder]
AS
SELECT     TOP (100) PERCENT dbo.[Order].CustomerID, dbo.[Order].OrderID, dbo.OrderDayMeal.OrderDayMealID, dbo.OrderDayMeal.MealID, dbo.OrderDayMeal.IsSubstitute, 
                      dbo.OrderDayMeal.OrderDayID, dbo.OrderDayMeal.MealTypeID
FROM         dbo.[Order] INNER JOIN
                      dbo.OrderDay ON dbo.[Order].OrderID = dbo.OrderDay.OrderID INNER JOIN
                      dbo.OrderDayMeal ON dbo.OrderDay.OrderDayID = dbo.OrderDayMeal.OrderDayID INNER JOIN
                      dbo.CustomerMeal ON dbo.OrderDayMeal.MealID = dbo.CustomerMeal.MealID AND dbo.[Order].CustomerID = dbo.CustomerMeal.CustomerID
WHERE     (dbo.[Order].OrderStatusID <= 3) AND (dbo.CustomerMeal.Approved = 0) AND (dbo.CustomerMeal.IngredientStatus = 2) AND (dbo.CustomerMeal.CustomerStatus = 0) OR
                      (dbo.[Order].OrderStatusID <= 3) AND (dbo.CustomerMeal.Approved = 0) AND (dbo.CustomerMeal.IngredientStatus = 4) AND (dbo.CustomerMeal.CustomerStatus = 1)
ORDER BY dbo.[Order].OrderID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Order"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 214
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OrderDay"
            Begin Extent = 
               Top = 6
               Left = 252
               Bottom = 99
               Right = 403
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OrderDayMeal"
            Begin Extent = 
               Top = 6
               Left = 441
               Bottom = 114
               Right = 601
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CustomerMeal"
            Begin Extent = 
               Top = 6
               Left = 639
               Bottom = 114
               Right = 800
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      En' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PreferenceVsOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'd
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PreferenceVsOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PreferenceVsOrder'
GO
/****** Object:  View [dbo].[vueOrderForCustomer]    Script Date: 01/05/2017 15:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vueOrderForCustomer]
AS
SELECT     OrderID, ISNULL(BuildDate, '') AS BuildDate, ISNULL(PrintDate, '') AS PrintDate, Week, OrderStatusID, ISNULL(ShipDate, '') AS ShipDate, CustomerID
FROM         dbo.[Order]
GO
/****** Object:  View [dbo].[vueCancelledAndCreatedOrderFromMpClient]    Script Date: 01/05/2017 15:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vueCancelledAndCreatedOrderFromMpClient]
AS
SELECT     dbo.[Order].OrderID, dbo.[Order].BuildDate, dbo.Customer.CustomerID, dbo.Customer.First, dbo.Customer.Last, CASE WHEN UPPER(AgentNote.Subject) 
                      = UPPER('Order Cancelled From MpClient') THEN 'Cancelled' ELSE 'Created' END AS OrderStatus, dbo.[Order].Week
FROM         dbo.[Order] WITH (NOLOCK) INNER JOIN
                      dbo.Customer WITH (NOLOCK) ON dbo.[Order].CustomerID = dbo.Customer.CustomerID INNER JOIN
                      dbo.AgentNote WITH (NOLOCK) ON dbo.[Order].OrderID = dbo.AgentNote.OrderID
WHERE     (UPPER(dbo.AgentNote.Subject) = UPPER('Order Cancelled From MpClient')) OR
                      (UPPER(dbo.AgentNote.Subject) = UPPER('Order Created From MpClient'))
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Order"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 214
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Customer"
            Begin Extent = 
               Top = 6
               Left = 252
               Bottom = 114
               Right = 426
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AgentNote"
            Begin Extent = 
               Top = 114
               Left = 38
               Bottom = 222
               Right = 201
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vueCancelledAndCreatedOrderFromMpClient'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vueCancelledAndCreatedOrderFromMpClient'
GO
/****** Object:  View [dbo].[vueUserList]    Script Date: 01/05/2017 15:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vueUserList]
AS
SELECT     UserID, ApplicationID, ISNULL(Name, '') AS Expr1, CreationDate, Username, FirstName, LastName, Email, Password, PasswordQuestion, PasswordAnswer, 
                      IsApproved, LastActivityDate, LastLoginDate, LastPasswordChangedDate, IsOnline, IsLockedOut, LastLockedOutDate, FailedPasswordAttemptCount, 
                      FailedPasswordAttemptWindowStart, FailedPasswordAnswerAttemptCount, FailedPasswordAnswerAttemptWindowStart, LastModified, Comment, IsAnonymous, 
                      CustomerID
FROM         dbo.[User]
WHERE     (IsDeleted = 0)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "User"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 329
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vueUserList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vueUserList'
GO
/****** Object:  UserDefinedFunction [dbo].[splitString]    Script Date: 01/05/2017 15:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[splitString]
(	
	@Input NVARCHAR(MAX),
	@Character CHAR(1)
)
RETURNS @Output TABLE (
	Item NVARCHAR(1000)
)
AS
BEGIN
	DECLARE @StartIndex INT, @EndIndex INT

	SET @StartIndex = 1
	IF SUBSTRING(@Input, LEN(@Input) - 1, LEN(@Input)) <> @Character
	BEGIN
		SET @Input = @Input + @Character
	END

	WHILE CHARINDEX(@Character, @Input) > 0
	BEGIN
		SET @EndIndex = CHARINDEX(@Character, @Input)
		
		INSERT INTO @Output(Item)
		SELECT SUBSTRING(@Input, @StartIndex, @EndIndex - 1)
		
		SET @Input = SUBSTRING(@Input, @EndIndex + 1, LEN(@Input))
	END

	RETURN
END
GO
/****** Object:  View [dbo].[vueIngredientPreferencesReport]    Script Date: 01/05/2017 15:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vueIngredientPreferencesReport]
AS
SELECT     dbo.Ingredient.IngredientID, dbo.Ingredient.Name, ISNULL(SUM(a.DoNotInclude + a.OKSmallAMounts), 0) AS TOTAL, ISNULL(SUM(a.DoNotInclude), 0) AS DoNotInclude,
                       ISNULL(SUM(a.OKSmallAMounts), 0) AS OKSmallAMounts
FROM         (SELECT     IngredientID, (CASE WHEN IngredientLevelID = 1 THEN 1 ELSE 0 END) AS DoNotInclude, (CASE WHEN IngredientLevelID = 2 THEN 1 ELSE 0 END) 
                                              AS OKSmallAMounts
                       FROM          dbo.CustomerIngredientExclusion WITH (NOLOCK)) AS a RIGHT OUTER JOIN
                      dbo.Ingredient WITH (NOLOCK) ON a.IngredientID = dbo.Ingredient.IngredientID
GROUP BY dbo.Ingredient.IngredientID, dbo.Ingredient.Name
GO
/****** Object:  UserDefinedFunction [dbo].[DAYSEARCH]    Script Date: 01/05/2017 15:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[DAYSEARCH](@day_name VARCHAR(9), @step_count INT, @direction smallint)
RETURNS datetime
AS
BEGIN
/*
Returns a date based upon criteria to find a specific day-of-week 
 for a specific number of "steps" forward or backward.
 For instance, "last Wednesday" or "two Thursdays from today".
@day_name = day of week to find ie. Monday, Tuesday...
@step_count = number of iterations back for a specific day:
--------> "1 Last Monday " =  1
--------> "3 Thursdays from now" = 3
@direction:
--------> -1 if Past
--------> 1 if Future
*/

 DECLARE @daysearch datetime
 DECLARE @counter smallint
 DECLARE @hits smallint
 DECLARE @day_name_calc VARCHAR(9)

 SELECT @counter = @direction
 SELECT @hits = 0

 WHILE @hits < @step_count
   BEGIN
     SELECT @day_name_calc = DATENAME(weekday , DATEADD(d, @counter, GETDATE())) 
     
     IF @day_name_calc = @day_name
       BEGIN
         SELECT @hits = @hits + 1
         SELECT @daysearch = DATEADD(d, @counter, GETDATE())
       END

     SELECT @counter = (@counter + (1 * @direction))
   END
 RETURN @daysearch      
END
GO
/****** Object:  UserDefinedFunction [dbo].[GetMealRating]    Script Date: 01/05/2017 15:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetMealRating]
(	
	-- Add the parameters for the function here
	@Rating INT,
	@MealID INT	
)
RETURNS INT 
AS
BEGIN
	-- Add the SELECT statement with parameter references here
	  -- Insert Values into Temp table
	DECLARE @Output INT
	DECLARE @TempRating TABLE (Rating INT)
	DECLARE @CustomerID INT
	DECLARE @getCustomerID CURSOR
	SET @getCustomerID = CURSOR FOR
		SELECT DISTINCT CustomerID FROM UserRatings with (nolock) WHERE MealID = @MealID
	OPEN @getCustomerID
	FETCH NEXT
	FROM @getCustomerID INTO @CustomerID
	WHILE @@FETCH_STATUS = 0
	BEGIN
		INSERT INTO @TempRating
		SELECT Top 1 Rating FROM UserRatings with (nolock) WHERE MealID = @MealID and CustomerID = @CustomerID ORDER BY CreatedDate DESC
		 
	FETCH NEXT
	FROM @getCustomerID INTO @CustomerID
	END
	CLOSE @getCustomerID
	DEALLOCATE @getCustomerID
		SELECT  @Output = COUNT(Rating) FROM @TempRating where Rating = @Rating
	RETURN @OutPut
END
GO
/****** Object:  View [dbo].[VwCustomerAccessReport]    Script Date: 01/05/2017 15:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VwCustomerAccessReport]
AS
SELECT     dbo.Customer.First, dbo.Customer.Last, dbo.Customer.Email, dbo.[Plan].Name, dbo.CustomerAccess.LoginDate, dbo.MembershipLogin.Password
FROM         dbo.Customer INNER JOIN
                      dbo.CustomerAccess ON dbo.Customer.CustomerID = dbo.CustomerAccess.CustomerID INNER JOIN
                      dbo.MembershipLogin ON dbo.Customer.CustomerID = dbo.MembershipLogin.CustomerID LEFT OUTER JOIN
                      dbo.CustomerPlan ON dbo.Customer.CustomerPlanID = dbo.CustomerPlan.CustomerPlanID AND 
                      dbo.Customer.CustomerID = dbo.CustomerPlan.CustomerID LEFT OUTER JOIN
                      dbo.[Plan] ON dbo.CustomerPlan.PlanID = dbo.[Plan].PlanID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[39] 4[20] 2[17] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Customer"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 370
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CustomerAccess"
            Begin Extent = 
               Top = 10
               Left = 542
               Bottom = 169
               Right = 712
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MembershipLogin"
            Begin Extent = 
               Top = 0
               Left = 720
               Bottom = 240
               Right = 1016
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "CustomerPlan"
            Begin Extent = 
               Top = 336
               Left = 788
               Bottom = 526
               Right = 988
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Plan"
            Begin Extent = 
               Top = 80
               Left = 1230
               Bottom = 188
               Right = 1389
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 12
         Width = 284
         Width = 2355
         Width = 2055
         Width = 2730
         Width = 1500
         Width = 3690
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwCustomerAccessReport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwCustomerAccessReport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwCustomerAccessReport'
GO
/****** Object:  View [dbo].[vw_CustomerOrders]    Script Date: 01/05/2017 15:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_CustomerOrders] as
select First+' '+Last customer,builddate, orderid,  Status, shipdate, Name planname, [week] planweek
from [order] ord, [customer] cus, [orderstatus] ordsts, [Plan] pln
where ord.customerid=cus.customerid
and ord.orderstatusid=ordsts.orderstatusid
and ord.planid=pln.planid
GO
/****** Object:  View [dbo].[vuePlanForCustomer]    Script Date: 01/05/2017 15:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vuePlanForCustomer]
AS
SELECT     ISNULL(dbo.CustomerPlan.StartDate, '') AS StartDate, ISNULL(dbo.CustomerPlan.EndDate, '') AS EndDate, dbo.CustomerPlan.CustomerPlanID, 
                      dbo.CustomerPlan.Week, dbo.[Plan].PlanID, dbo.[Plan].Name, dbo.[Plan].DisplayName, dbo.[Plan].Description, dbo.[Plan].IsCustomPlan, dbo.[Plan].ProgramID, 
                      dbo.[Plan].Active, dbo.[Plan].Price, dbo.[Plan].CostPerDay, dbo.[Plan].Shipping, dbo.[Plan].DoNotSubstitute, dbo.[Plan].IsDeleted, dbo.[Plan].IsSnack, 
                      dbo.CustomerPlan.CustomerID
FROM         dbo.CustomerPlan INNER JOIN
                      dbo.[Plan] ON dbo.CustomerPlan.PlanID = dbo.[Plan].PlanID
WHERE     (dbo.[Plan].IsDeleted = 0) AND (dbo.[Plan].Active = 1)
GO
/****** Object:  View [dbo].[vueOrderRegenerationReport]    Script Date: 01/05/2017 15:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vueOrderRegenerationReport]
AS
SELECT     TOP (100) PERCENT dbo.OrderRegeneration.OrderRegenerationID, dbo.OrderRegeneration.OrderID, dbo.OrderRegeneration.MpClientRemarks, 
                      dbo.OrderRegeneration.OrdercreationRemarks, dbo.OrderRegeneration.UpdatedDate, dbo.[Order].BuildDate, dbo.[Order].ShippedWeight, dbo.[Order].Week, 
                      dbo.[Order].PlanID, dbo.Customer.CustomerID, dbo.Customer.First, dbo.Customer.Last, dbo.Customer.Email, dbo.[Plan].Name AS PlanName
FROM         dbo.OrderRegeneration INNER JOIN
                      dbo.[Order] ON dbo.OrderRegeneration.OrderID = dbo.[Order].OrderID INNER JOIN
                      dbo.Customer ON dbo.[Order].CustomerID = dbo.Customer.CustomerID INNER JOIN
                      dbo.[Plan] ON dbo.[Order].PlanID = dbo.[Plan].PlanID
ORDER BY dbo.OrderRegeneration.UpdatedDate DESC
GO
/****** Object:  View [dbo].[vueOrderList]    Script Date: 01/05/2017 15:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vueOrderList]
AS
SELECT     dbo.[Order].OrderID, CASE WHEN [order].OrderStatusID = 2 AND 
                      Customer.AlwaysReviewHold = 1 THEN OrderStatus.Status + ' (Always)' ELSE OrderStatus.Status END AS OrderStatus, dbo.[Plan].Name AS PlanName, 
                      dbo.Program.Name AS ProgramName, dbo.Customer.CustomerID, dbo.[Order].Week AS PlanWeek, dbo.CustomerStatus.Status AS CustomerStatus, 
                      dbo.Customer.First + ' ' + dbo.Customer.Last AS CustomerName, dbo.Customer.First AS CustomerFirstName, dbo.[Order].PlanID, 
                      dbo.Customer.Last AS CustomerLastName, dbo.[Order].BuildDate, dbo.[Order].ShipDate
FROM         dbo.[Order] WITH (NOLOCK) INNER JOIN
                      dbo.OrderStatus WITH (NOLOCK) ON dbo.[Order].OrderStatusID = dbo.OrderStatus.OrderStatusID INNER JOIN
                      dbo.[Plan] WITH (NOLOCK) ON dbo.[Order].PlanID = dbo.[Plan].PlanID INNER JOIN
                      dbo.Customer WITH (NOLOCK) ON dbo.[Order].CustomerID = dbo.Customer.CustomerID INNER JOIN
                      dbo.CustomerStatus WITH (NOLOCK) ON dbo.Customer.CustomerStatusID = dbo.CustomerStatus.CustomerStatusID INNER JOIN
                      dbo.Program WITH (NOLOCK) ON dbo.[Plan].ProgramID = dbo.Program.ProgramID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Order"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 214
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OrderStatus"
            Begin Extent = 
               Top = 6
               Left = 252
               Bottom = 84
               Right = 403
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Plan"
            Begin Extent = 
               Top = 84
               Left = 252
               Bottom = 192
               Right = 411
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Customer"
            Begin Extent = 
               Top = 114
               Left = 38
               Bottom = 222
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CustomerStatus"
            Begin Extent = 
               Top = 192
               Left = 250
               Bottom = 270
               Right = 418
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Program"
            Begin Extent = 
               Top = 222
               Left = 38
               Bottom = 330
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         A' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vueOrderList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'lias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vueOrderList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vueOrderList'
GO
/****** Object:  View [dbo].[vueCustomOrderList]    Script Date: 01/05/2017 15:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vueCustomOrderList]
AS
SELECT     dbo.Customer.First + ' ' + dbo.Customer.Last AS CustomerName, dbo.CustomOrder.CustomOrderID, dbo.CustomOrder.ShipDate, dbo.Customer.CustomerID, 
                      dbo.CustomOrder.PlanID, dbo.CustomOrder.Week, dbo.CustomOrder.MovedToOrder, dbo.[Plan].Name, ISNULL(dbo.[Order].OrderID, 0) AS OrderID
FROM         dbo.CustomOrder INNER JOIN
                      dbo.Customer ON dbo.CustomOrder.CustomerID = dbo.Customer.CustomerID INNER JOIN
                      dbo.[Plan] ON dbo.CustomOrder.PlanID = dbo.[Plan].PlanID LEFT OUTER JOIN
                      dbo.[Order] ON dbo.Customer.CustomerID = dbo.[Order].CustomerID AND CAST(dbo.CustomOrder.ShipDate AS Date) = CAST(dbo.[Order].ShipDate AS Date) AND 
                      dbo.[Order].OrderStatusID <> 6
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CustomOrder"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 214
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Customer"
            Begin Extent = 
               Top = 91
               Left = 247
               Bottom = 199
               Right = 421
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Plan"
            Begin Extent = 
               Top = 185
               Left = 39
               Bottom = 293
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Order"
            Begin Extent = 
               Top = 103
               Left = 640
               Bottom = 211
               Right = 816
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
        ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vueCustomOrderList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vueCustomOrderList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vueCustomOrderList'
GO
/****** Object:  View [dbo].[vueBulkOrderHistory]    Script Date: 01/05/2017 15:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vueBulkOrderHistory]
AS
SELECT     dbo.BulkOrderHistory.BulkOrderID, dbo.BulkOrderHistory.BulkOrderDate, dbo.BulkOrderHistory.CustomerID, dbo.BulkOrderHistory.OrderID, 
                      dbo.BulkOrderHistory.Status, dbo.Customer.First, dbo.Customer.Last, dbo.[Order].BuildDate, dbo.[Order].ShipDate, dbo.[Plan].Name, dbo.[Order].Week
FROM         dbo.BulkOrderHistory INNER JOIN
                      dbo.[Order] ON dbo.BulkOrderHistory.OrderID = dbo.[Order].OrderID LEFT OUTER JOIN
                      dbo.[Plan] ON dbo.[Order].PlanID = dbo.[Plan].PlanID INNER JOIN
                      dbo.Customer ON dbo.BulkOrderHistory.CustomerID = dbo.Customer.CustomerID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "BulkOrderHistory"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 190
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Order"
            Begin Extent = 
               Top = 6
               Left = 228
               Bottom = 114
               Right = 404
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Plan"
            Begin Extent = 
               Top = 114
               Left = 38
               Bottom = 222
               Right = 197
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Customer"
            Begin Extent = 
               Top = 114
               Left = 235
               Bottom = 222
               Right = 409
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vueBulkOrderHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vueBulkOrderHistory'
GO
/****** Object:  View [dbo].[CustomersLoginLast]    Script Date: 01/05/2017 15:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CustomersLoginLast]
AS
SELECT DISTINCT dbo.Customer.First, dbo.Customer.Last, dbo.Customer.Email, dbo.[Plan].Name, dbo.MembershipLogin.Password, dbo.MembershipLogin.LastLoginDate
FROM         dbo.Customer INNER JOIN
                      dbo.CustomerAccess ON dbo.Customer.CustomerID = dbo.CustomerAccess.CustomerID INNER JOIN
                      dbo.MembershipLogin ON dbo.Customer.CustomerID = dbo.MembershipLogin.CustomerID LEFT OUTER JOIN
                      dbo.CustomerPlan ON dbo.Customer.CustomerPlanID = dbo.CustomerPlan.CustomerPlanID AND 
                      dbo.Customer.CustomerID = dbo.CustomerPlan.CustomerID LEFT OUTER JOIN
                      dbo.[Plan] ON dbo.CustomerPlan.PlanID = dbo.[Plan].PlanID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[15] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Customer"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 247
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CustomerAccess"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 99
               Right = 420
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MembershipLogin"
            Begin Extent = 
               Top = 119
               Left = 393
               Bottom = 356
               Right = 689
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "CustomerPlan"
            Begin Extent = 
               Top = 6
               Left = 647
               Bottom = 114
               Right = 847
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Plan"
            Begin Extent = 
               Top = 252
               Left = 38
               Bottom = 360
               Right = 197
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 2940
         Width = 2070
         Width = 1500
         Width = 1500
         Width = 3105
         Width = 3195
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CustomersLoginLast'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'= 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CustomersLoginLast'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CustomersLoginLast'
GO
/****** Object:  View [dbo].[vuSalesOrder]    Script Date: 01/05/2017 15:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vuSalesOrder]
AS
SELECT     dbo.[Order].ShipDate, AN.Notes, dbo.OrderDayMeal.OrderDayMealID, AN.AgentNoteID, dbo.OrderDay.OrderDayID, dbo.[Order].OrderID, Me.MealID AS MealId, 
                      Me.Name AS MealName, Me.SKU AS Meal
FROM         dbo.OrderDay INNER JOIN
                      dbo.[Order] ON dbo.OrderDay.OrderID = dbo.[Order].OrderID INNER JOIN
                      dbo.OrderDayMeal ON dbo.OrderDay.OrderDayID = dbo.OrderDayMeal.OrderDayID INNER JOIN
                      dbo.Meal AS Me ON dbo.OrderDayMeal.MealID = Me.MealID LEFT OUTER JOIN
                      dbo.AgentNote AS AN ON Me.MealID = AN.MealID AND dbo.[Order].OrderID = AN.OrderID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[49] 4[15] 2[23] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "OrderDay"
            Begin Extent = 
               Top = 30
               Left = 876
               Bottom = 182
               Right = 1036
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Order"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 223
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OrderDayMeal"
            Begin Extent = 
               Top = 88
               Left = 474
               Bottom = 320
               Right = 643
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Me"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 206
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AN"
            Begin Extent = 
               Top = 148
               Left = 263
               Bottom = 255
               Right = 435
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vuSalesOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'= 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vuSalesOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vuSalesOrder'
GO
/****** Object:  View [dbo].[vueMealsByDate]    Script Date: 01/05/2017 15:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vueMealsByDate]
AS
SELECT     TOP (100) PERCENT dbo.Meal.MealID, dbo.Meal.SKU, dbo.Meal.Name, ISNULL(a.Quantity, 0) AS Quantity, dbo.MealType.Name AS MealTypeName
FROM         (SELECT     dbo.OrderDayMeal.MealID, ISNULL(COUNT(dbo.OrderDayMeal.OrderDayMealID), 0) AS Quantity
                       FROM          dbo.OrderDayMeal WITH (NOLOCK) INNER JOIN
                                              dbo.OrderDay WITH (NOLOCK) ON dbo.OrderDayMeal.OrderDayID = dbo.OrderDay.OrderDayID INNER JOIN
                                              dbo.[Order] WITH (NOLOCK) ON dbo.OrderDay.OrderID = dbo.[Order].OrderID
                       WHERE      (dbo.[Order].OrderStatusID <= 5)
                       GROUP BY dbo.OrderDayMeal.MealID) AS a INNER JOIN
                      dbo.Meal WITH (NOLOCK) ON a.MealID = dbo.Meal.MealID INNER JOIN
                      dbo.MealType WITH (NOLOCK) ON dbo.Meal.MealTypeID = dbo.MealType.MealTypeID
WHERE     (dbo.Meal.IsDeleted = 0)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 84
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Meal"
            Begin Extent = 
               Top = 6
               Left = 227
               Bottom = 114
               Right = 397
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MealType"
            Begin Extent = 
               Top = 6
               Left = 435
               Bottom = 84
               Right = 586
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vueMealsByDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vueMealsByDate'
GO
/****** Object:  View [dbo].[vueMealQuantityReport]    Script Date: 01/05/2017 15:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vueMealQuantityReport]
AS
SELECT     dbo.Meal.MealID, dbo.Meal.SKU, dbo.Meal.Name, CASE WHEN Meal.Active = 1 THEN 'Yes' ELSE 'No' END AS Active, dbo.MealType.Name AS MealTypeName, 
                      ISNULL(SUM(a.ShippedQuantity), 0) + ISNULL(SUM(a.QuantityInProcess), 0) AS Quantity, ISNULL(SUM(a.ShippedQuantity), 0) AS ShippedQuantity, 
                      ISNULL(SUM(a.QuantityInProcess), 0) AS QuantityInProcess
FROM         dbo.MealType WITH (NOLOCK) INNER JOIN
                      dbo.Meal ON dbo.MealType.MealTypeID = dbo.Meal.MealTypeID LEFT OUTER JOIN
                          (SELECT     dbo.OrderDayMeal.MealID, (CASE WHEN [Order].OrderStatusID = 5 THEN 1 ELSE 0 END) AS ShippedQuantity, 
                                                   (CASE WHEN [Order].OrderStatusID < 5 THEN 1 ELSE 0 END) AS QuantityInProcess
                            FROM          dbo.[Order] WITH (NOLOCK) INNER JOIN
                                                   dbo.OrderDay ON dbo.[Order].OrderID = dbo.OrderDay.OrderID INNER JOIN
                                                   dbo.OrderDayMeal WITH (NOLOCK) ON dbo.OrderDay.OrderDayID = dbo.OrderDayMeal.OrderDayID) AS a ON dbo.Meal.MealID = a.MealID
WHERE     (dbo.Meal.IsDeleted = 0)
GROUP BY dbo.Meal.MealID, dbo.Meal.SKU, dbo.Meal.Name, dbo.Meal.Active, dbo.MealType.Name
GO
/****** Object:  View [dbo].[vueGetMealsInMenus]    Script Date: 01/05/2017 15:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vueGetMealsInMenus]
AS
SELECT DISTINCT 
                      TOP (100) PERCENT dbo.[Order].PlanID, dbo.[Plan].Name AS PlanName, dbo.OrderDayMeal.MealID, dbo.Meal.SKU, dbo.Meal.Name AS MealName, 
                      dbo.MealType.Name AS MealTypeName, dbo.Meal.MealTypeID, dbo.Meal.Quantity, ISNULL(A.HoldForReview, 0) AS HoldForReview, ISNULL(B.ReadytoPrint, 0) 
                      AS ReadytoPrint
FROM         dbo.[Order] INNER JOIN
                      dbo.OrderDay ON dbo.[Order].OrderID = dbo.OrderDay.OrderID INNER JOIN
                      dbo.OrderDayMeal ON dbo.OrderDay.OrderDayID = dbo.OrderDayMeal.OrderDayID INNER JOIN
                      dbo.Meal ON dbo.OrderDayMeal.MealID = dbo.Meal.MealID INNER JOIN
                      dbo.MealType ON dbo.Meal.MealTypeID = dbo.MealType.MealTypeID INNER JOIN
                      dbo.[Plan] ON dbo.[Order].PlanID = dbo.[Plan].PlanID LEFT OUTER JOIN
                          (SELECT     Order_2.PlanID, OrderDayMeal_2.MealID, COUNT(ISNULL(OrderDayMeal_2.MealID, 0)) AS HoldForReview
                            FROM          dbo.[Order] AS Order_2 INNER JOIN
                                                   dbo.OrderDay AS OrderDay_2 ON Order_2.OrderID = OrderDay_2.OrderID INNER JOIN
                                                   dbo.OrderDayMeal AS OrderDayMeal_2 ON OrderDay_2.OrderDayID = OrderDayMeal_2.OrderDayID
                            WHERE      (Order_2.OrderStatusID = 2)
                            GROUP BY Order_2.PlanID, OrderDayMeal_2.MealID) AS A ON dbo.[Order].PlanID = A.PlanID AND dbo.OrderDayMeal.MealID = A.MealID LEFT OUTER JOIN
                          (SELECT     Order_1.PlanID, OrderDayMeal_1.MealID, COUNT(ISNULL(OrderDayMeal_1.MealID, 0)) AS ReadytoPrint
                            FROM          dbo.[Order] AS Order_1 INNER JOIN
                                                   dbo.OrderDay AS OrderDay_1 ON Order_1.OrderID = OrderDay_1.OrderID INNER JOIN
                                                   dbo.OrderDayMeal AS OrderDayMeal_1 ON OrderDay_1.OrderDayID = OrderDayMeal_1.OrderDayID
                            WHERE      (Order_1.OrderStatusID = 3)
                            GROUP BY Order_1.PlanID, OrderDayMeal_1.MealID) AS B ON dbo.[Order].PlanID = B.PlanID AND dbo.OrderDayMeal.MealID = B.MealID
GROUP BY dbo.[Order].PlanID, dbo.[Plan].Name, dbo.OrderDayMeal.MealID, dbo.Meal.SKU, dbo.Meal.Name, dbo.MealType.Name, dbo.Meal.MealTypeID, dbo.Meal.Quantity, 
                      A.HoldForReview, B.ReadytoPrint
ORDER BY dbo.[Order].PlanID, PlanName, dbo.OrderDayMeal.MealID, dbo.Meal.SKU, MealName, MealTypeName
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[29] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Order"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 230
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OrderDay"
            Begin Extent = 
               Top = 6
               Left = 252
               Bottom = 99
               Right = 403
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OrderDayMeal"
            Begin Extent = 
               Top = 6
               Left = 441
               Bottom = 114
               Right = 601
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Meal"
            Begin Extent = 
               Top = 210
               Left = 235
               Bottom = 318
               Right = 405
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MealType"
            Begin Extent = 
               Top = 6
               Left = 1018
               Bottom = 84
               Right = 1169
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Plan"
            Begin Extent = 
               Top = 114
               Left = 38
               Bottom = 222
               Right = 213
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 639
               Bottom = 99
               Right = 791
            End
            DisplayFlags = 280
            ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vueGetMealsInMenus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'TopColumn = 0
         End
         Begin Table = "B"
            Begin Extent = 
               Top = 6
               Left = 829
               Bottom = 99
               Right = 980
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vueGetMealsInMenus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vueGetMealsInMenus'
GO
/****** Object:  View [dbo].[vueGetCustomerMeals]    Script Date: 01/05/2017 15:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vueGetCustomerMeals]
AS
SELECT     dbo.Meal.MealID, dbo.Meal.SKU, dbo.Meal.Name, dbo.Meal.MealTypeID, dbo.CustomerMeal.CustomerID, dbo.[Order].OrderID, dbo.Meal.Quantity
FROM         dbo.CustomerMeal INNER JOIN
                      dbo.[Order] ON dbo.CustomerMeal.CustomerID = dbo.[Order].CustomerID INNER JOIN
                      dbo.Meal ON dbo.CustomerMeal.MealID = dbo.Meal.MealID
WHERE     (dbo.Meal.Quantity > dbo.Meal.CutoffQuantity) AND (dbo.CustomerMeal.Approved = 1) AND (dbo.Meal.IsDeleted = 0)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CustomerMeal"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 199
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Order"
            Begin Extent = 
               Top = 6
               Left = 237
               Bottom = 114
               Right = 413
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Meal"
            Begin Extent = 
               Top = 114
               Left = 38
               Bottom = 222
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vueGetCustomerMeals'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vueGetCustomerMeals'
GO
/****** Object:  View [dbo].[vueExcludedMealsReport]    Script Date: 01/05/2017 15:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vueExcludedMealsReport]
AS
 select m.MealID, m.SKU, m.Name
,p.[1] [IngredientApproved]
,p.[2] [IngredientExcluded] 
,p.[3] [CustomerApproved] 
,p.[4] [CustomerExcluded] 
from(
select * from(
select cm.CustomerID,MealID,IngredientStatus
from CustomerMeal cm, Customer c
where cm.CustomerID=c.CustomerID
and c.IsDeleted=0
)p
PIVOT (count(customerid) for IngredientStatus in ([1],[2],[3],[4])) as pvt
)p, Meal m
where p.MealID=m.MealID
and m.Active=1
and m.IsDeleted=0
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 227
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Meal"
            Begin Extent = 
               Top = 6
               Left = 265
               Bottom = 114
               Right = 451
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vueExcludedMealsReport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vueExcludedMealsReport'
GO
/****** Object:  UserDefinedFunction [dbo].[GetCustomerMeals]    Script Date: 01/05/2017 15:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetCustomerMeals] (@OrderDayID int)
RETURNS TABLE
AS
RETURN
(
  SELECT 
                MealID = dbo.Meal.MealID,
                SKU = dbo.Meal.SKU,
                MealName = dbo.Meal.Name,
                MealTypename = dbo.MealType.Name,
                MealTyped = dbo.Meal.MealTypeID,
                Quantity=dbo.Meal.Quantity
                FROM dbo.CustomerMeal
                INNER JOIN
                dbo.Meal
                ON
                dbo.CustomerMeal.MealID = dbo.Meal.MealID
                INNER JOIN
                dbo.MealType
                ON
                dbo.MealType.MealTypeID = dbo.Meal.MealTypeID
                WHERE
                dbo.CustomerMeal.CustomerID = (	SELECT TOP 1 CustomerID FROM dbo.[Order] INNER JOIN
												ORDERDay ON OrderDay.OrderID = [Order].OrderID 
                                                WHERE dbo.OrderDay.OrderDayID  = (@OrderDayID)
                                              )  AND 
                                                dbo.CustomerMeal.Approved = 1 AND  (dbo.Meal.Quantity > dbo.Meal.CutoffQuantity) 
                                              )
GO
/****** Object:  View [dbo].[vueErrorLog]    Script Date: 01/05/2017 15:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vueErrorLog]
AS
SELECT     TOP (100) PERCENT ID, ErrorNo, Application, ISNULL([Function], '') AS [Function], ISNULL(ErrorDesc, '') AS ErrorDesc, ISNULL(DetailedDesc, '') AS DetailedDesc, 
                      ISNULL(CreatedDate, '') AS CreatedDate
FROM         dbo.ErrorLog
ORDER BY ID DESC
GO
/****** Object:  View [dbo].[vueCustomerList]    Script Date: 01/05/2017 15:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vueCustomerList]
AS
SELECT     Customer.CustomerID AS customerID, Customer.First, Customer.Last, C.CustomerAddressID, ISNULL(C.Address1, '') + ',' + ISNULL(C.Address2, '') AS Address1, 
                      ISNULL(Customer.Email, '') AS Email, ISNULL(C.City, '') AS City, ISNULL(C.Name, '') AS StateName, ISNULL(CustomerStatus.Status, '') AS CustomerStatus, 
                      ISNULL(Program.Name, '') AS ProgramName, ISNULL([Plan].Name, '') AS PlanName, ISNULL(Customer.PickListComments, '') AS PickListComments, 
                      ISNULL(Customer.MenuComments, '') AS MenuComments, ISNULL(CONVERT(VARCHAR(10), B.OrderID), 'N/A') AS OrderID, B.OrderStatusID, ISNULL(D .Status, 'N/A') 
                      AS OrderStatus
FROM         Customer WITH (NOLOCK) LEFT OUTER JOIN
                      CustomerPlan WITH (NOLOCK) ON Customer.CustomerID = CustomerPlan.CustomerID AND CustomerPlan.isDeleted = 0 LEFT OUTER JOIN
                      [Plan] WITH (NOLOCK) ON CustomerPlan.PlanID = [Plan].PlanID LEFT OUTER JOIN
                      Program WITH (NOLOCK) ON [Plan].ProgramID = Program.ProgramID LEFT OUTER JOIN
                      CustomerStatus WITH (NOLOCK) ON Customer.CustomerStatusID = CustomerStatus.CustomerStatusID LEFT OUTER JOIN
                          (SELECT     B1.OrderRowNo, B1.CustomerID, B1.OrderID, B1.OrderStatusID
                            FROM          (SELECT     ROW_NUMBER() OVER (PARTITION BY CustomerID
                                                    ORDER BY CustomerID, OrderID DESC) AS OrderRowNo, CustomerID, OrderID, OrderStatusID
                            FROM          [Order] WITH (NOLOCK)) AS B1
WHERE     B1.OrderRowNo = 1) AS B ON Customer.customerID = B.CustomerID LEFT OUTER JOIN
    (SELECT     C1.RowNo, C1.CustomerID, C1.CustomerAddressID, C1.Address1, C1.Address2, C1.City, C1.Name
      FROM          (SELECT     ROW_NUMBER() OVER (PARTITION BY CustomerID
                              ORDER BY CustomerID, CustomerAddressID DESC) AS RowNo, CustomerID, CustomerAddressID, CustomerAddress.Address1, CustomerAddress.Address2, 
                             CustomerAddress.City, dbo.[State].Name
      FROM          CustomerAddress WITH (NOLOCK) LEFT OUTER JOIN
                             dbo.[State] WITH (NOLOCK) ON CustomerAddress.StateID = State.StateID) AS C1
WHERE     C1.RowNo = 1) AS C ON Customer.CustomerID = C.CustomerID LEFT OUTER JOIN
OrderStatus D WITH (NOLOCK) ON B.OrderStatusID = D .OrderStatusID
WHERE     Customer.IsDeleted = 0
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vueCustomerList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vueCustomerList'
GO
/****** Object:  View [dbo].[vueIPAccess]    Script Date: 01/05/2017 15:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vueIPAccess]
AS
SELECT     IPAccessID, IPAddress, ISNULL(AddedDate, '') AS AddedDate, Description
FROM         dbo.IPAccess
GO
/****** Object:  View [dbo].[vueProgramList]    Script Date: 01/05/2017 15:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vueProgramList]
AS
SELECT     ProgramID, Name, CASE WHEN Active = 1 THEN 'Yes' ELSE 'No' END AS Active, IsDeleted
FROM         dbo.Program
WHERE     (IsDeleted = 0)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Program"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vueProgramList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vueProgramList'
GO
/****** Object:  View [dbo].[vuePlanList]    Script Date: 01/05/2017 15:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vuePlanList]
AS
SELECT     dbo.[Plan].PlanID, CASE WHEN dbo.[Plan].Active = 1 THEN 'Yes' ELSE 'No' END AS Active, dbo.[Plan].Name, ISNULL(dbo.[Plan].DisplayName, '') AS DisplayName, 
                      ISNULL(dbo.[Plan].Description, '') AS Description, CASE WHEN dbo.[Plan].IsCustomPlan = 1 THEN 'Yes' ELSE 'No' END AS IsCustomPlan, 
                      dbo.Program.Name AS Program
FROM         dbo.[Plan] INNER JOIN
                      dbo.Program ON dbo.[Plan].ProgramID = dbo.Program.ProgramID
WHERE     (dbo.[Plan].IsDeleted = 0)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Plan"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 206
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Program"
            Begin Extent = 
               Top = 6
               Left = 244
               Bottom = 125
               Right = 404
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vuePlanList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vuePlanList'
GO
/****** Object:  View [dbo].[vueMealAndIngredientPreferenceHistory]    Script Date: 01/05/2017 15:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vueMealAndIngredientPreferenceHistory]
AS
SELECT     TOP (100) PERCENT CustomerID, Type, Name, LastAction, Modification
FROM         (SELECT     dbo.CustomerIngredientExclusionHistory.CustomerID, 'Ingredient' AS Type, dbo.Ingredient.Name, dbo.CustomerIngredientExclusionHistory.LastAction, 
                                              CASE WHEN Status = 'Deleted' THEN 'Ingredient Deleted' ELSE CASE WHEN ingredientLevelID = 1 THEN 'Do Not Include' WHEN ingredientLevelID = 2 THEN
                                               'OK in Small Amounts' WHEN ingredientLevelID = 3 THEN 'Customer Likes' WHEN ingredientLevelID = 4 THEN 'Customer Dislikes' END END AS Modification
                       FROM          dbo.CustomerIngredientExclusionHistory WITH (NOLOCK) INNER JOIN
                                              dbo.Ingredient WITH (NOLOCK) ON dbo.CustomerIngredientExclusionHistory.IngredientID = dbo.Ingredient.IngredientID
                       UNION
                       SELECT     dbo.CustomerMealHistory.CustomerID, 'Meal' AS Type, dbo.Meal.Name, dbo.CustomerMealHistory.LastAction, 
                                             CASE WHEN IngredientStatus = 1 THEN 'Ingredient Approved' WHEN IngredientStatus = 2 THEN 'Ingredient Excluded' WHEN IngredientStatus = 3 THEN 'Customer Approved'
                                              WHEN IngredientStatus = 4 THEN 'Customer Excluded' END AS Modification
                       FROM         dbo.CustomerMealHistory WITH (NOLOCK) INNER JOIN
                                             dbo.Meal WITH (NOLOCK) ON dbo.CustomerMealHistory.MealID = dbo.Meal.MealID) AS a
ORDER BY LastAction DESC
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vueMealAndIngredientPreferenceHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vueMealAndIngredientPreferenceHistory'
GO
/****** Object:  View [dbo].[vueIngredientsReport]    Script Date: 01/05/2017 15:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vueIngredientsReport]
AS
SELECT     ISNULL(dbo.IngredientCategory.IngredientCategoryID, 0) AS IngredientCategoryID, ISNULL(dbo.IngredientCategory.Name, '') AS CategoryName, 
                      ISNULL(dbo.Ingredient.IngredientID, 0) AS IngredientID, ISNULL(dbo.Ingredient.Name, '') AS Name
FROM         dbo.IngredientCategory WITH (NOLOCK) LEFT OUTER JOIN
                      dbo.IngredientIngredientCategory WITH (NOLOCK) ON 
                      dbo.IngredientCategory.IngredientCategoryID = dbo.IngredientIngredientCategory.IngredientCategoryID RIGHT OUTER JOIN
                      dbo.Ingredient WITH (NOLOCK) ON dbo.IngredientIngredientCategory.IngredientID = dbo.Ingredient.IngredientID
GO
/****** Object:  View [dbo].[vueGetMealListForPlan]    Script Date: 01/05/2017 15:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vueGetMealListForPlan]
AS
SELECT     MealID, SKU, Name, Active
FROM         dbo.Meal
WHERE     (Active = 1) AND (IsDeleted = 0)
GO
/****** Object:  UserDefinedFunction [dbo].[udf_GetIngredientForCategory]    Script Date: 01/05/2017 15:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE FUNCTION [dbo].[udf_GetIngredientForCategory]
 ( -- Add the parameters for the stored procedure here
       @IngredientCategoryID int,
       @SelectionType        int  --1 All  2 Top 3 Records Only
      
 )
 RETURNS VARCHAR(MAX)
 AS
 BEGIN
   DECLARE @IngredientName VARCHAR(MAX) 
   DECLARE @mIngredientCount INTEGER
IF @SelectionType=1 
	BEGIN
		SELECT @IngredientName =  COALESCE(@IngredientName + ',', '') + ISNULL(Ingredient.Name ,'') FROM         
			
	        IngredientCategory INNER JOIN
                      IngredientIngredientCategory ON IngredientCategory.IngredientCategoryID = IngredientIngredientCategory.IngredientCategoryID INNER JOIN
                      Ingredient ON IngredientIngredientCategory.IngredientID = Ingredient.IngredientID
                    WHERE IngredientCategory.IngredientCategoryID=@IngredientCategoryID
	END
ELSE
	BEGIN
			SELECT TOP 3 @IngredientName =  COALESCE(@IngredientName + ',', '') + ISNULL(Ingredient.Name ,'') FROM         
			
	        IngredientCategory INNER JOIN
                      IngredientIngredientCategory ON IngredientCategory.IngredientCategoryID = IngredientIngredientCategory.IngredientCategoryID INNER JOIN
                      Ingredient ON IngredientIngredientCategory.IngredientID = Ingredient.IngredientID
                    WHERE IngredientCategory.IngredientCategoryID=@IngredientCategoryID
                    ORDER BY Ingredient.Name
                    
                   SELECT @mIngredientCount =COUNT(Ingredient.Name)FROM IngredientCategory INNER JOIN
                      IngredientIngredientCategory ON IngredientCategory.IngredientCategoryID = IngredientIngredientCategory.IngredientCategoryID INNER JOIN
                      Ingredient ON IngredientIngredientCategory.IngredientID = Ingredient.IngredientID
                    WHERE IngredientCategory.IngredientCategoryID=@IngredientCategoryID
                    
                    
                    IF @mIngredientCount>3
                    BEGIN
						SET @IngredientName=@IngredientName+ '...'
                    END
	END
	


       RETURN(@IngredientName)
 END
GO
/****** Object:  UserDefinedFunction [dbo].[udf_GetCategoryForIngredient]    Script Date: 01/05/2017 15:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE FUNCTION [dbo].[udf_GetCategoryForIngredient]
 ( -- Add the parameters for the stored procedure here
       @IngredientID int,
       @SelectionType        int  --1 All  2 Top 3 Records Only
 )
 RETURNS VARCHAR(MAX)
 AS
 BEGIN
   DECLARE @IngredientCategoryName VARCHAR(MAX) 
   DECLARE @mIngredientCount INTEGER

IF @SelectionType=1 
	BEGIN
			(SELECT @IngredientCategoryName =  COALESCE(@IngredientCategoryName + ',', '') + ISNULL(IngredientCategory.name,'') FROM         IngredientCategory RIGHT OUTER JOIN
								  IngredientIngredientCategory ON IngredientCategory.IngredientCategoryID = IngredientIngredientCategory.IngredientCategoryID RIGHT OUTER JOIN
								  Ingredient ON IngredientIngredientCategory.IngredientID = Ingredient.IngredientID  
								  Where   Ingredient.IngredientID=@IngredientID) 
	END
ELSE
	BEGIN
	
		(SELECT TOP 3 @IngredientCategoryName =  COALESCE(@IngredientCategoryName + ',', '') + ISNULL(IngredientCategory.name,'') FROM         IngredientCategory RIGHT OUTER JOIN
									  IngredientIngredientCategory ON IngredientCategory.IngredientCategoryID = IngredientIngredientCategory.IngredientCategoryID RIGHT OUTER JOIN
									  Ingredient ON IngredientIngredientCategory.IngredientID = Ingredient.IngredientID  
									  Where   Ingredient.IngredientID=@IngredientID) 
									  
                     SELECT @mIngredientCount =COUNT(IngredientCategory.Name) FROM         IngredientCategory RIGHT OUTER JOIN
									  IngredientIngredientCategory ON IngredientCategory.IngredientCategoryID = IngredientIngredientCategory.IngredientCategoryID RIGHT OUTER JOIN
									  Ingredient ON IngredientIngredientCategory.IngredientID = Ingredient.IngredientID  
									  Where   Ingredient.IngredientID=@IngredientID
                    
                    
                    IF @mIngredientCount>3
                    BEGIN
						SET @IngredientCategoryName=@IngredientCategoryName+ '...'
                    END
	END
				   RETURN(@IngredientCategoryName)
 END
GO
/****** Object:  View [dbo].[vueIngredientsForCustomer]    Script Date: 01/05/2017 15:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vueIngredientsForCustomer]
AS
SELECT     dbo.CustomerIngredientExclusion.CustomerID, dbo.CustomerIngredientExclusion.IngredientID, dbo.CustomerIngredientExclusion.IngredientLevelID, 
                      dbo.Ingredient.Name, ISNULL(dbo.udf_GetCategoryForIngredient(dbo.CustomerIngredientExclusion.IngredientID, 1), '') AS Catagories
FROM         dbo.CustomerIngredientExclusion INNER JOIN
                      dbo.Ingredient ON dbo.CustomerIngredientExclusion.IngredientID = dbo.Ingredient.IngredientID
GO
/****** Object:  View [dbo].[vueSubstituteReport]    Script Date: 01/05/2017 15:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vueSubstituteReport]
AS
SELECT     TOP (100) PERCENT b.MealID, b.SKU, b.Name, b.Active, b.MealTypeName, b.Calories, b.Quantity, b.ShippedQuantity, b.QuantityInProcess, ISNULL(C.Childs, 0) 
                      AS Expr1, ISNULL(d.Parents, 0) AS Parents
FROM         (SELECT     dbo.Meal.MealID, dbo.Meal.SKU, dbo.Meal.Name, CASE WHEN Meal.Active = 1 THEN 'Yes' ELSE 'No' END AS Active, 
                                              dbo.MealType.Name AS MealTypeName, dbo.Meal.Calories, ISNULL(SUM(a.ShippedQuantity), 0) + ISNULL(SUM(a.QuantityInProcess), 0) AS Quantity, 
                                              ISNULL(SUM(a.ShippedQuantity), 0) AS ShippedQuantity, ISNULL(SUM(a.QuantityInProcess), 0) AS QuantityInProcess
                       FROM          dbo.MealType WITH (NOLOCK) INNER JOIN
                                              dbo.Meal ON dbo.MealType.MealTypeID = dbo.Meal.MealTypeID LEFT OUTER JOIN
                                                  (SELECT     dbo.OrderDayMeal.MealID, (CASE WHEN [Order].OrderStatusID = 5 THEN 1 ELSE 0 END) AS ShippedQuantity, 
                                                                           (CASE WHEN [Order].OrderStatusID < 5 THEN 1 ELSE 0 END) AS QuantityInProcess
                                                    FROM          dbo.[Order] WITH (NOLOCK) INNER JOIN
                                                                           dbo.OrderDay WITH (NOLOCK) ON dbo.[Order].OrderID = dbo.OrderDay.OrderID INNER JOIN
                                                                           dbo.OrderDayMeal WITH (NOLOCK) ON dbo.OrderDay.OrderDayID = dbo.OrderDayMeal.OrderDayID) AS a ON 
                                              dbo.Meal.MealID = a.MealID
                       WHERE      (dbo.Meal.IsDeleted = 0)
                       GROUP BY dbo.Meal.MealID, dbo.Meal.SKU, dbo.Meal.Name, dbo.Meal.Active, dbo.MealType.Name, dbo.Meal.Calories) AS b LEFT OUTER JOIN
                          (SELECT     MealID, COUNT(*) AS Childs
                            FROM          dbo.MealSubstitute WITH (NOLOCK)
                            GROUP BY MealID) AS C ON b.MealID = C.MealID LEFT OUTER JOIN
                          (SELECT     SubstituteMealID, COUNT(*) AS Parents
                            FROM          dbo.MealSubstitute AS MealSubstitute_1 WITH (NOLOCK)
                            GROUP BY SubstituteMealID) AS d ON b.MealID = d.SubstituteMealID
ORDER BY b.MealID
GO
/****** Object:  UserDefinedFunction [dbo].[GetCustomer_SelectMealIDList]    Script Date: 01/05/2017 15:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[GetCustomer_SelectMealIDList] (@CustomerID int)
RETURNS TABLE 
AS
RETURN 
(
  SELECT 
	Meal.MealID,
	Meal.MealTypeID,   
  CASE WHEN (a.IngredientStatus=4 or a.IngredientStatus=2) THEN CONVERT(BIT,0) ELSE CONVERT(BIT,1) END AS Approved        
  FROM        
  (
      SELECT CustomerMeal.Approved,CustomerMeal.IngredientStatus,Meal.MealID        
       FROM        
       CustomerMeal WITH(NOLOCK)        
       inner join Meal WITH(NOLOCK)         
       ON         
       CustomerMeal.MealID=Meal.MealID        
       inner join Customer WITH(NOLOCK)         
       ON         
       CustomerMeal.CustomerID=Customer.CustomerID        
       WHERE         
       Customer.CustomerID=@customerID    
   ) a         
	 right outer join Meal with(nolock)        
	 on         
	 a.MealID=Meal.MealID and Meal.MealTypeID != 4
	 -- where Meal.IsDeleted = 0  and Meal.Active=1
	 INNER JOIN MealPlanDetails WITH(NOLOCK) ON Meal.MealID = MealPlanDetails.MealID
	 WHERE Meal.IsDeleted = 0 AND Meal.Active=1 AND Meal.MealTypeID != 4
	 --AND cutoffquantity < quantity  
	 AND MealPlanDetails.PlanID = (SELECT TOP 1 PlanID FROM CustomerPlan WHERE CustomerID = @customerID AND IsDeleted = 0)
)
GO
/****** Object:  UserDefinedFunction [dbo].[GetCustomer_RemovedMealList]    Script Date: 01/05/2017 15:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[GetCustomer_RemovedMealList] (@CustomerID int)

RETURNS TABLE 
AS
RETURN 
(
SELECT     
  Meal.MealID ,   
  Meal.MealTypeID
  FROM    
   ( SELECT     
    CustomerMeal.MealID,     
    CustomerMeal.Approved,
    CustomerMeal.IngredientStatus 
   
     FROM     
     CustomerMeal WITH(NOLOCK)     
     INNER JOIN     
     Customer WITH(NOLOCK)     
     ON          
     Customer.CustomerID = CustomerMeal.CustomerID    
     
              WHERE     
              Customer.CustomerID=@customerID     
              AND (IngredientStatus=2 OR IngredientStatus=4 )
   )a     
  INNER JOIN    
  Meal WITH(NOLOCK)    
  ON     
  a.MealID=Meal.MealID AND Meal.MealTypeID != 4 
  --WHERE Meal.IsDeleted = 0 AND Meal.Active=1
  INNER JOIN MealPlanDetails WITH(NOLOCK) ON Meal.MealID = MealPlanDetails.MealID
  WHERE Meal.IsDeleted = 0 AND Meal.Active=1 
  --AND cutoffquantity < quantity  
  AND MealPlanDetails.PlanID = (SELECT TOP 1 PlanID FROM CustomerPlan WHERE CustomerID = @customerID AND IsDeleted = 0)  
)
GO
/****** Object:  UserDefinedFunction [dbo].[GetCustomer_ApprovedMealList]    Script Date: 01/05/2017 15:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION[dbo].[GetCustomer_ApprovedMealList] (@CustomerID int) 
RETURNS TABLE 
AS
RETURN 
(
SELECT b.MealID,B.MealTypeID FROM (
SELECT     
  Meal.MealID  ,ISNULL(a.Approved  ,1)as Approved,ISNULL(a.IngredientStatus,1)as IngredientStatus,MealTypeID
  FROM    
   ( SELECT     
    CustomerMeal.MealID,     
    CustomerMeal.Approved,
    CustomerMeal.IngredientStatus      
     FROM     
     CustomerMeal WITH(NOLOCK)     
     INNER JOIN     
     Customer WITH(NOLOCK)     
     ON          
     Customer.CustomerID = CustomerMeal.CustomerID    
     
              WHERE     
              Customer.CustomerID=@customerID    
             
   )a     
  RIGHT JOIN    
  Meal WITH(NOLOCK)    
  ON     
  a.MealID=Meal.MealID  and Meal.MealTypeID != 4   
  --WHERE   (a.IngredientStatus=1 OR a.IngredientStatus=3) AND
  --Meal.IsDeleted = 0 AND Meal.Active=1 
  INNER JOIN MealPlanDetails WITH(NOLOCK) ON Meal.MealID = MealPlanDetails.MealID
  WHERE (a.IngredientStatus=1 OR a.IngredientStatus=3) AND Meal.IsDeleted = 0 AND Meal.Active=1 
  --AND cutoffquantity < quantity  
  AND MealPlanDetails.PlanID = (SELECT TOP 1 PlanID FROM CustomerPlan WHERE CustomerID = @customerID AND IsDeleted = 0)   
  )b
)
GO
/****** Object:  UserDefinedFunction [dbo].[getSubstituteMeal]    Script Date: 01/05/2017 15:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getSubstituteMeal] (@MealId int)
RETURNS TABLE
AS
RETURN
(

	SELECT     Meal.MealID, Meal.Active, Meal.SKU, Meal.Name, Meal.MealTypeID, Meal.ShortDescription, Meal.LongDescription, Meal.Calories, Meal.CaloriesFromFat, 
                      Meal.TotalFat, Meal.SaturatedFat, Meal.TransFat, Meal.Cholesterol, Meal.Protein, Meal.Carbohydrate, Meal.DietaryFiber, Meal.Sugars, Meal.Sodium, Meal.AddDate, 
                      Meal.UpdateDate, Meal.Status, Meal.Quantity, Meal.CutoffQuantity, MealType.Name AS MealTypeName
FROM         Meal WITH (NOLOCK) INNER JOIN
                      MealType ON Meal.MealTypeID = MealType.MealTypeID
	WHERE 
	MealID <> @mealId AND Meal.Active=1 AND MEAL.isDeleted=0 --AND
	--MealID NOT IN (Select SubstituteMealID From MealSubstitute WITH(NOLOCK)
	--where MealID=@mealId) 
	
	
)
GO
/****** Object:  UserDefinedFunction [dbo].[getIngredientNotInMeal]    Script Date: 01/05/2017 15:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getIngredientNotInMeal] (@MealId int)
RETURNS TABLE
AS
RETURN
(
SELECT     
	Ingredient.IngredientID, Ingredient.Name AS ingredientName,
	dbo.udf_GetCategoryForIngredient(Ingredient.IngredientID,1)as IngredientCategoryName
	FROM         
	IngredientCategory WITH(NOLOCK)
	RIGHT OUTER JOIN
	IngredientIngredientCategory WITH(NOLOCK)
	ON 
	IngredientCategory.IngredientCategoryID = IngredientIngredientCategory.IngredientCategoryID 
	RIGHT OUTER JOIN
	Ingredient WITH(NOLOCK)
	ON 
	IngredientIngredientCategory.IngredientID = Ingredient.IngredientID
	WHERE     
	(Ingredient.IngredientID NOT IN (	SELECT MealIngredient.IngredientID
										FROM MealIngredient WITH(NOLOCK)
										WHERE      (MealID = @mealId))) 
	GROUP BY  Ingredient.IngredientID, Ingredient.Name 
	
)
GO
/****** Object:  UserDefinedFunction [dbo].[udf_GetIngredientForMeal]    Script Date: 01/05/2017 15:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE FUNCTION [dbo].[udf_GetIngredientForMeal]
 ( -- Add the parameters for the stored procedure here
       @MealID int
      
 )
 RETURNS VARCHAR(MAX)
 AS
 BEGIN
   DECLARE @IngredientName VARCHAR(MAX) 


(SELECT @IngredientName =  COALESCE(@IngredientName + ',', '') + ISNULL(Ingredient.name,'') FROM MealIngredient INNER JOIN
                      Ingredient ON MealIngredient.IngredientID = Ingredient.IngredientID
                      Where   MealIngredient.MealID=@MealID) 


       RETURN(@IngredientName)
 END
GO
/****** Object:  View [dbo].[vueIngredientList]    Script Date: 01/05/2017 15:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vueIngredientList]
AS
SELECT     IngredientID, Name, ISNULL(dbo.udf_GetCategoryForIngredient(IngredientID, 1), '') AS IngredientCategories, ISNULL(dbo.udf_GetCategoryForIngredient(IngredientID, 
                      2), '') AS DisplayIngredientCategories
FROM         dbo.Ingredient WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vueIngredientCategoryList]    Script Date: 01/05/2017 15:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vueIngredientCategoryList]
AS
SELECT     IngredientCategoryID, Name, ISNULL(dbo.udf_GetIngredientForCategory(IngredientCategoryID, 1), '') AS IngredientNames, 
                      ISNULL(dbo.udf_GetIngredientForCategory(IngredientCategoryID, 2), '') AS DisplayIngredientNames
FROM         dbo.IngredientCategory WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vueIngredientCategoryEditList]    Script Date: 01/05/2017 15:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vueIngredientCategoryEditList]
AS
SELECT     IngredientID, Name, ISNULL(dbo.udf_GetCategoryForIngredient(IngredientID, 1), '') AS IngredientCategories
FROM         dbo.Ingredient
GO
/****** Object:  View [dbo].[vueMealSubstituteList]    Script Date: 01/05/2017 15:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vueMealSubstituteList]
AS
SELECT     dbo.MealSubstitute.SubstituteMealID, dbo.MealSubstitute.MealSubstituteID, dbo.Meal.Active, dbo.Meal.SKU, dbo.Meal.Name, dbo.Meal.MealTypeID, 
                      dbo.Meal.ShortDescription, dbo.Meal.LongDescription, dbo.Meal.Calories, dbo.Meal.CaloriesFromFat, dbo.Meal.TotalFat, dbo.Meal.SaturatedFat, dbo.Meal.TransFat, 
                      dbo.Meal.Cholesterol, dbo.Meal.Protein, dbo.Meal.Carbohydrate, dbo.Meal.DietaryFiber, dbo.Meal.Sugars, dbo.Meal.Sodium, dbo.Meal.AddDate, 
                      dbo.Meal.UpdateDate, dbo.Meal.Status, dbo.Meal.Quantity, dbo.Meal.CutoffQuantity, dbo.Meal.QuantityInProcess, dbo.Meal.QuantityShipped, 
                      dbo.Meal.AlertLevelQuantity, dbo.Meal.ItemCount, dbo.MealSubstitute.MealID
FROM         dbo.MealSubstitute INNER JOIN
                      dbo.Meal ON dbo.MealSubstitute.SubstituteMealID = dbo.Meal.MealID
WHERE     (dbo.Meal.IsDeleted = 0)
GO
/****** Object:  View [dbo].[vueMealIngredientList]    Script Date: 01/05/2017 15:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vueMealIngredientList]
AS
SELECT     dbo.MealIngredient.IngredientID, dbo.Ingredient.Name AS IngredientName, ISNULL(dbo.udf_GetCategoryForIngredient(dbo.MealIngredient.IngredientID, 1), '') 
                      AS IngredientCategoryName, dbo.MealIngredient.MealIngredientID, dbo.Meal.MealID
FROM         dbo.Meal INNER JOIN
                      dbo.MealIngredient ON dbo.Meal.MealID = dbo.MealIngredient.MealID INNER JOIN
                      dbo.Ingredient ON dbo.MealIngredient.IngredientID = dbo.Ingredient.IngredientID
WHERE     (dbo.Meal.IsDeleted = 0)
GO
/****** Object:  View [dbo].[vueMealList]    Script Date: 01/05/2017 15:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vueMealList]
AS
SELECT     dbo.Meal.MealID, CASE WHEN dbo.Meal.Active = 1 THEN 'Yes' ELSE 'No' END AS ActiveStatus, dbo.Meal.SKU, dbo.Meal.Name, 
                      dbo.MealType.Name AS MealTypeName, ISNULL(A.mCount, 0) AS MealSubstitutesCount, dbo.Meal.Calories, dbo.Meal.CaloriesFromFat, dbo.Meal.TotalFat, 
                      dbo.Meal.SaturatedFat, dbo.Meal.TransFat, dbo.Meal.Cholesterol, dbo.Meal.Protein, dbo.Meal.Carbohydrate, dbo.Meal.DietaryFiber, dbo.Meal.Sugars, 
                      dbo.Meal.Sodium, dbo.Meal.Quantity, dbo.Meal.CutoffQuantity, ISNULL(dbo.udf_GetIngredientForMeal(dbo.Meal.MealID), '') AS IngredientName, 
                      dbo.Meal.QuantityInProcess, dbo.Meal.QuantityShipped, dbo.Meal.AlertLevelQuantity, dbo.Meal.ItemCount
FROM         dbo.Meal INNER JOIN
                      dbo.MealType ON dbo.Meal.MealTypeID = dbo.MealType.MealTypeID LEFT OUTER JOIN
                          (SELECT     MealID, COUNT(*) AS mCount
                            FROM          dbo.MealSubstitute
                            GROUP BY MealID) AS A ON dbo.Meal.MealID = A.MealID
WHERE     (dbo.Meal.IsDeleted = 0)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Meal"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 272
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 13
         End
         Begin Table = "MealType"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 84
               Right = 397
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "A"
            Begin Extent = 
               Top = 84
               Left = 246
               Bottom = 162
               Right = 397
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vueMealList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vueMealList'
GO
/****** Object:  View [dbo].[vw_OrdersHoldForReview]    Script Date: 01/05/2017 15:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_OrdersHoldForReview] as
select cus.CustomerID, cus.First, cus.Email, cus.Active 'Customer Active', cus.IsDeleted 'Customer Deleted'
		, pln.planid, pln.Name 'Plan Name', pln.Active 'Plan Active', pln.IsDeleted 'Plan Deleted'
		, ord.orderid, ord.BuildDate, ord.ShipDate, ordsts.Status 'Order Status'
		, plnwk.Week 'Plan Week', plndy.Day 'Plan Day' 
		, ml.MealID, ml.Name 'Meal Name', ml.Quantity 'Meal Quantity' ,ml.AlertLevelQuantity 'Meal Alert Level Quantity', ml.Status 'Meal Status' ,ml.Active 'Meal Active', ml.IsDeleted 'Meal Deleted'
		, mlsubml.Name 'Sub Meal Name', mlsubml.Quantity 'Sub Meal Quantity', mlsubml.AlertLevelQuantity 'Sub Meal Alert Level Quantity' , mlsubml.Status 'Sub Meal Status', mlsubml.Active 'Sub Meal Active', mlsubml.IsDeleted 'Sub Meal Deleted'
from [Customer] cus 
join [Order] ord 
	on cus.CustomerID=ord.CustomerID
join [OrderStatus] ordsts
	on ord.OrderStatusID=ordsts.OrderStatusID
join [Plan] pln 
	on ord.PlanID=pln.PlanID
join [PlanWeek] plnwk
	on pln.PlanID=plnwk.PlanID
join [PlanDay] plndy
	on plnwk.PlanWeekID=plndy.PlanWeekID
join [PlanDayMeal] plndyml
	on plndy.PlanDayID=plndyml.PlanDayID
join [Meal] ml
	on plndyml.MealID=ml.MealID
left outer join [MealSubstitute] mlsub
	on ml.MealID=mlsub.MealID 
	and mlsub.SubstitutePlanID=pln.PlanID
left outer join [Meal] mlsubml
	on mlsub.SubstituteMealID=mlsubml.MealID
where
	ordsts.Status='Hold for Review'
	and ord.orderid=109523


--,[PlanWeek],[PlanDay],[PlanDayMeal],[Meal]
GO
/****** Object:  UserDefinedFunction [dbo].[GetCustomerPlan]    Script Date: 01/05/2017 15:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetCustomerPlan] (@CustomerID int,@StartDate DATETIME)
RETURNS TABLE

AS
RETURN
(
        SELECT 
				pdm.MealID,
				m.Name AS MealName,
				m.LongDescription AS MealDescription,
				pdm.MealTypeID,
				mt.Name AS MealTypeName,
				m.MpClientActive,
				Day,
				cp.PlanID,
				pw.Week,
				CAST(0 AS BIT) as IsSubstitute,
				pdm.PlanDayMealID AS DayMealID,
				GETDATE() AS CurrentDate,
				pdm.[Priority],
				cm.Approved,
				CASE WHEN m.Quantity > m.QuantityInProcess + m.AllocatedQuantity + (SELECT COALESCE(SUM(ChangedAllocatedQuantity),0) FROM [TempMealQuantity] WHERE MealID = pdm.MealID) AND Quantity > CutoffQuantity  THEN 1 ELSE 0 END AS MealQuantity,
				(SELECT TOP 1 CAST(Rating as INT) As Rating FROM UserRatings WHERE MealID = pdm.MealID AND CustomerID = @CustomerId ORDER BY CreatedDate DESC) AS Rating


   FROM PlanDayMeal pdm 

				INNER JOIN CustomerMeal cm on cm.CustomerID = @CustomerID AND CM.MealID = pdm.MealID  
				INNER JOIN Meal m ON m.MealID = pdm.MealID
				INNER JOIN MealType mt ON mt.MealTypeID = pdm.MealTypeID
				INNER JOIN PlanDay pd ON pd.PlanDayID = pdm.PlanDayID
				INNER JOIN PlanWeek pw ON pw.PlanWeekID = pd.PlanWeekID
				INNER JOIN CustomerPlan cp ON cp.PlanID = pw.PlanID AND cp.Week + 1 = pw.Week


   WHERE cp.CustomerID = @CustomerID AND StartDate = @StartDate AND cp.IsDeleted = 0 AND m.Active = 1 
)
GO
