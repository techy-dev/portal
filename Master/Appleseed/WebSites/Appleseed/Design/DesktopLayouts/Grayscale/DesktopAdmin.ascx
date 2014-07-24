<%@ Control Language="c#" %>
<%@ Register Assembly="Appleseed.Framework.Core" Namespace="Appleseed.Framework.Web.UI.WebControls" TagPrefix="rbfwebui" %>
<%@ Register Assembly="Appleseed.Framework.Web.UI.WebControls" Namespace="Appleseed.Framework.Web.UI.WebControls" TagPrefix="rbfwebui" %>
<script runat="server">

    public string ContentContainerSelector;
    private void Page_Load(object sender, System.EventArgs e)
    {
        PortalHeaderMenu.DataBind();

        if (Appleseed.Framework.Security.PortalSecurity.IsInRoles("Admins"))
        {
            BarPanel.Visible = true;
        }
        else
        {
            UserPanel.Visible = true;
        }
    }
</script>

<asp:Panel ID="BarPanel" runat="server" Visible="false">
    <div id="as-admin-bar" class="navbar navbar-admin navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" id="admin-toggle" class="navbar-toggle" data-toggle="collapse" data-target=".userMenu">
                    <span class="sr-only">Toggle navigation</span>
                    <span>Admin</span>
                </button>
                <a href="<%= Appleseed.Framework.Settings.Path.ApplicationFullPath %>" class="navbar-brand">
                    <img alt='Appleseed' src='<%=Appleseed.Framework.Settings.Path.ApplicationFullPath  %>/Design/Themes/Grayscale/images/brick.png' class='admin-logo' height='16' width='16' />AS
                </a>
                <ul id="admin-left-menu" class="nav navbar-nav">
                    <li>
                        <a href="<%= Appleseed.Framework.Settings.Path.ApplicationFullPath %>/100"><span>Administration</span></a>
                        <ul>
                            <li><a href="<%=Appleseed.Framework.Settings.Path.ApplicationFullPath  %>/240">Site Settings</a></li>
                            <li><a href="<%=Appleseed.Framework.Settings.Path.ApplicationFullPath  %>/110">Page Manager</a></li>
                            <li><a href="<%=Appleseed.Framework.Settings.Path.ApplicationFullPath  %>/281">User Manager</a></li>
                            <li><a href="<%=Appleseed.Framework.Settings.Path.ApplicationFullPath  %>/120">Global Modules</a></li>
                            <li><a href="<%=Appleseed.Framework.Settings.Path.ApplicationFullPath  %>/215">Recycle Bin</a></li>
                            <li><a href="http://file.app.clients.anant.us">File.App</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">Site Content</a>
                        <asp:TreeView ID="asSiteTree" runat="server" DataSourceID="biSMDS" CssClass="sitecontent" ExpandDepth="0" />
                    </li>
                </ul>
                <div id="admin-navbar-collapse" class="navbar-collapse collapse userMenu">
                    <!-- begin User Menu at the Top of the Page -->
                    <rbfwebui:HeaderMenu ID="PortalHeaderMenu" runat="server"
                        CssClass="SiteLink" RepeatDirection="Horizontal" CellSpacing="0"
                        CellPadding="0" ShowHelp="False" ShowHome="False"
                        ShowLogon="true" ShowRegister="true" ShowDragNDrop="True"
                        DialogLogon="true" ShowLanguages="true" ShowFlags="true" ShowLangString="true">
                        <ItemStyle Wrap="False"></ItemStyle>
                        <ItemTemplate>
                            <%# Container.DataItem %>
                        </ItemTemplate>
                    </rbfwebui:HeaderMenu>
                    <!-- End User Menu -->
                </div>
                <!-- End Portal Menu -->
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
</asp:Panel>
<!-- Panel for Users who aren't logged in. Doesn't include the top left menu administrator menu. -->
<asp:Panel ID="UserPanel" runat="server" Visible="false">
    <div id="as-not-admin-bar" class="navbar navbar-admin navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <div class="navbar-collapse collapse userMenu">
                    <!-- begin User Menu at the Top of the Page -->
                    <rbfwebui:HeaderMenu ID="HeaderMenu2" runat="server"
                        CssClass="SiteLink" RepeatDirection="Horizontal" CellSpacing="0"
                        CellPadding="0" ShowHelp="False" ShowHome="False"
                        ShowLogon="true" ShowRegister="true" ShowDragNDrop="True"
                        DialogLogon="true" ShowLanguages="true" ShowFlags="true" ShowLangString="true">
                        <ItemStyle Wrap="False"></ItemStyle>
                        <ItemTemplate>
                            <%# Container.DataItem %>
                        </ItemTemplate>
                    </rbfwebui:HeaderMenu>
                    <!-- End User Menu -->
                </div>
            </div>
        </div>
    </div>
</asp:Panel>
<asp:SiteMapDataSource ID="biSMDS" ShowStartingNode="false" runat="server" />