-- uzduotis3: produktu kategoriju pelningumo analize per laika teritorijose ir pardavimo
 -- kanaluose
 -- naudok production_product, production_productsubcategory, production_productcategory,
 -- sales_salesorderdetails, sale_slaeterritory ir sales_salesorderheader lenteles
 -- 1.susiek produktus   su ju subkategorijomis, kategorijoms, teritorijomis  ir pardavimo
 --  kanalais 
 SELECT pp.productID,
    pp.Name AS produktas,
    ps.ProductSubcategoryID,
    ps.Name AS sub_kategorija,
    pc.ProductCategoryID,
    pc.Name AS kategorija,
    st.Name AS teritorija,
    ss.SalesOrderID,
    soh.Status,
    soh.OnlineOrderFlag
 FROM  production_product pp
    JOIN production_productsubcategory ps ON ps.ProductSubcategoryID = pp.ProductSubcategoryID
    JOIN production_productcategory pc ON ps.ProductCategoryID = pc.ProductCategoryID
    JOIN sales_salesorderdetail ss  ON pp.productID = ss.ProductID
    JOIN sales_salesorderheader soh  ON ss.salesorderID = soh.salesorderID
    JOIN sales_salesterritory st ON  soh.TerritoryID = st.TerritoryID

 --2. Apskaičiuoti bendras pajama bei runningtotal kiekvienai kategorijai pagal metus ir ketvirčius.

 -- 3.Naudok Case , kad kategorijas susikirstytumeme i "High Profit' ir 'Low Profit".
 -- ė