use utf8;
package EmployeeManager::Schema::Result::Employee;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

EmployeeManager::Schema::Result::Employee

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<employees>

=cut

__PACKAGE__->table("employees");

=head1 ACCESSORS

=head2 emp_no

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 birth_date

  data_type: 'date'
  is_nullable: 0

=head2 first_name

  data_type: 'varchar'
  is_nullable: 0
  size: 14

=head2 last_name

  data_type: 'varchar'
  is_nullable: 0
  size: 16

=head2 gender

  data_type: 'text'
  is_nullable: 0

=head2 hire_date

  data_type: 'date'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "emp_no",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "birth_date",
  { data_type => "date", is_nullable => 0 },
  "first_name",
  { data_type => "varchar", is_nullable => 0, size => 14 },
  "last_name",
  { data_type => "varchar", is_nullable => 0, size => 16 },
  "gender",
  { data_type => "text", is_nullable => 0 },
  "hire_date",
  { data_type => "date", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</emp_no>

=back

=cut

__PACKAGE__->set_primary_key("emp_no");

=head1 RELATIONS

=head2 dept_emps

Type: has_many

Related object: L<EmployeeManager::Schema::Result::DeptEmp>

=cut

__PACKAGE__->has_many(
  "dept_emps",
  "EmployeeManager::Schema::Result::DeptEmp",
  { "foreign.emp_no" => "self.emp_no" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 dept_managers

Type: has_many

Related object: L<EmployeeManager::Schema::Result::DeptManager>

=cut

__PACKAGE__->has_many(
  "dept_managers",
  "EmployeeManager::Schema::Result::DeptManager",
  { "foreign.emp_no" => "self.emp_no" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 salaries

Type: has_many

Related object: L<EmployeeManager::Schema::Result::Salary>

=cut

__PACKAGE__->has_many(
  "salaries",
  "EmployeeManager::Schema::Result::Salary",
  { "foreign.emp_no" => "self.emp_no" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 titles

Type: has_many

Related object: L<EmployeeManager::Schema::Result::Title>

=cut

__PACKAGE__->has_many(
  "titles",
  "EmployeeManager::Schema::Result::Title",
  { "foreign.emp_no" => "self.emp_no" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07047 @ 2017-10-25 16:36:45
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:tqc4JpUWuKb3ndV0dp33fw

    # many_to_many():
    #   args:
    #     1) Name of relationship bridge, DBIC will create accessor with this name
    #     2) Name of has_many() relationship this many_to_many() is shortcut for
    #     3) Name of belongs_to() relationship in model class of has_many() above
    #   You must already have the has_many() defined to use a many_to_many().
    
__PACKAGE__->many_to_many( # Departments employee is part of or has been a part of 
    departments => 'dept_emps',
    'dept_no'
);
__PACKAGE__->many_to_many( # Departments employee manages or has managed
    departments_managed => 'dept_managers',
    'dept_no'
);

__PACKAGE__->has_many(
    'curr_dept_managers',
    "EmployeeManager::Schema::Result::DeptManager",

    sub {
        my $args = shift;
        {   "$args->{foreign_alias}.emp_no" => "$args->{self_alias}.emp_no",
            "$args->{foreign_alias}.date"   => \'CURRENT_TIMESTAMP'
        };
    },

        #    { "foreign.emp_no" => "self.emp_no", 'foreign.date' => { '>=', \'CURRENT_TIMESTAMP' } },
        { cascade_copy => 0, cascade_delete => 0 },
);

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
