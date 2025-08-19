# Turning Data into Gold: Customer Segmentation with SQL & Economics

🔍 Not all customers are created equal — and that’s okay.  
The real power is knowing who’s who, and how best to serve them.

In this project, I used **SQL** and the **AdventureWorks2012** database to segment customers into **Gold, Silver, and Bronze** tiers based on their total purchase value.

---

## 💡 Why it matters for business
- 🥇 **Gold** → Reward loyal customers with exclusive offers  
- 🥈 **Silver** → Re-engage to encourage repeat purchases  
- 🥉 **Bronze** → Find ways to turn them into long-term buyers  

---

## 🛠 Tools & Techniques
- `SUM()` → Calculate total purchase value  
- `GROUP BY` → Aggregate customer transactions  
- `CASE WHEN` → Classify them into tiers  
- `ORDER BY` → Rank customers by purchase value  

---

## 🧠 Economics Insight
Customer loyalty isn’t just emotional — it’s measurable.  
When businesses track **spending patterns**, they can boost:  
- Retention  
- Profitability  
- Customer Lifetime Value (CLV)  

---

## 📊 SQL Query
```sql
SELECT
    [Sales].[SalesOrderHeader].[CustomerID],
    CONCAT([Person].[Person].[FirstName], ' ', [Person].[Person].[LastName]) AS FULL_NAME,
    SUM([Sales].[SalesOrderHeader].[TotalDue]) AS Total_Purchase,
    CASE
        WHEN SUM([Sales].[SalesOrderHeader].[TotalDue]) >= 10000 THEN 'GOLD'
        WHEN SUM([Sales].[SalesOrderHeader].[TotalDue]) BETWEEN 5000 AND 9999 THEN 'SILVER'
        ELSE 'BRONZE'
    END AS CustomerTier
FROM [Sales].[SalesOrderHeader]
JOIN [Sales].[Customer]
    ON [Sales].[SalesOrderHeader].[CustomerID] = [Sales].[Customer].[CustomerID]
JOIN [Person].[Person]
    ON [Sales].[Customer].[PersonID] = [Person].[Person].[BusinessEntityID]
GROUP BY
    [Sales].[SalesOrderHeader].[CustomerID],
    [Person].[Person].[FirstName],
    [Person].[Person].[LastName]
ORDER BY Total_Purchase DESC;
