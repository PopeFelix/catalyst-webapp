use utf8;
package EmployeeManager::Schema::Result::DeptEmp;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

EmployeeManager::Schema::Result::DeptEmp

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

=head1 TABLE: C<dept_emp>

=cut

__PACKAGE__->table("dept_emp");

=head1 ACCESSORS

=head2 emp_no

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 dept_no

  data_type: 'char'
  is_foreign_key: 1
  is_nullable: 0
  size: 4

=head2 from_date

  data_type: 'date'
  is_nullable: 0

=head2 to_date

  data_type: 'date'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "emp_no",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "dept_no",
  { data_type => "char", is_foreign_key => 1, is_nullable => 0, size => 4 },
  "from_date",
  { data_type => "date", is_nullable => 0 },
  "to_date",
  { data_type => "date", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</emp_no>

=item * L</dept_no>

=back

=cut

__PACKAGE__->set_primary_key("emp_no", "dept_no");

=head1 RELATIONS

=head2 dept_no

Type: belongs_to

Related object: L<EmployeeManager::Schema::Result::Department>

=cut

__PACKAGE__->belongs_to(
  "dept_no",
  "EmployeeManager::Schema::Result::Department",
  { dept_no => "dept_no" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);

=head2 emp_no

Type: belongs_to

Related object: L<EmployeeManager::Schema::Result::Employee>

=cut

__PACKAGE__->belongs_to(
  "emp_no",
  "EmployeeManager::Schema::Result::Employee",
  { emp_no => "emp_no" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07047 @ 2017-10-25 16:36:45
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:pPfHeaBGhAfpnLy0WOtoxw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
