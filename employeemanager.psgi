use strict;
use warnings;

use EmployeeManager;

my $app = EmployeeManager->apply_default_middlewares(EmployeeManager->psgi_app);
$app;

