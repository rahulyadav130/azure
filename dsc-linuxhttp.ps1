Configuration httpd
{
    Import-DscResource -ModuleName 'nx'
    Node localhost {
        #Ensure apache2 package is installed
        nxpackage 'apache2' {
            Ensure          = 'Present'
            Name            = 'httpd'
            PackageManager  = 'yum'
        }
        #Ensure apache2 service is running
        nxService 'apache2' {
            Enabled         = $true
            Name            = 'httpd'
            Controller      = 'init'
            State           = 'running'
        }
    }
}
