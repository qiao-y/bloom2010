using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace BLOOM.Web.Models.User
{
    public class GeneralInfo
    {
      
        public aspnet_AccountInfo m_accountInfo  {get;set;}
        public aspnet_Membership m_personalInfo { get; set; }
        public GeneralInfo()
        {
            m_accountInfo = new aspnet_AccountInfo();
            m_personalInfo = new aspnet_Membership();
        }
        //public GenenalInfo()
        //{
        //    BalanceInfo = new BalanceInfo();
        //    PersonalInfo = new PersonalInfo();
        //}
        //public BalanceInfo BalanceInfo { get; set; }
        //public PersonalInfo PersonalInfo { get; set; }
    }
}
