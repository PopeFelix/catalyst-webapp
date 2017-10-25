use strict;
use warnings;
use Test::More;


use Catalyst::Test 'EmployeeManager';
use EmployeeManager::Controller::Employees;

ok( request('/employees')->is_success, 'Request should succeed' );
done_testing();
