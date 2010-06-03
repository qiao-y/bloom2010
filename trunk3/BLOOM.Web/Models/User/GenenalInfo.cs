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
    public class GenenalInfo
    {
        public BalanceInfo BalanceInfo { get; set; }
        public PersonalInfo PersonalInfo { get; set; }
    }
}
