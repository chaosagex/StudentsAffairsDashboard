using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StudentsAffairsDashboard.Models
{
    public partial class Uniform_Invoice: invoice_payment
    {
        public Uniform_Invoice() : base()
        {
            this.date = DateTime.Now;
            payment_details pd = new payment_details();
            pd.type = 5;
            pd.name = "uniform";
            this.payment_details.Add(pd);
        }
    }
    
}