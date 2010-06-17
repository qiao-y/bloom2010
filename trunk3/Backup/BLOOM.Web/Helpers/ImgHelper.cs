//This file defines the image helper, which allows you to easily pass an image to a view.
//Copy from:
//http://www.tracefact.net/Asp-Net/AspNetMvc-View-Part4.aspx

using System.Web.Mvc;
using System.Web.Routing;

namespace BLOOM.Web.Helpers
{
    public static class ImageHelper
    {
        public static string Image(this HtmlHelper helper, string id, string url, string alternateText)
        {
            return Image(helper, id, url, alternateText, null);
        }

        public static string Image(this HtmlHelper helper, string id, string url, string alternateText, object htmlAttributes)
        {
            // Create tag builder
            var builder = new TagBuilder("img");

            // Create valid id
            builder.GenerateId(id);

            // Add attributes
            builder.MergeAttribute("src", url);
            builder.MergeAttribute("alt", alternateText);
            builder.MergeAttributes(new RouteValueDictionary(htmlAttributes));

            // Render tag
            return builder.ToString(TagRenderMode.SelfClosing);
        }

    }
}