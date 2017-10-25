use utf8;
package EmployeeManager::Schema::Result::Department;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

EmployeeManager::Schema::Result::Department

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

=head1 TABLE: C<departments>

=cut

__PACKAGE__->table("departments");

=head1 ACCESSORS

=head2 dept_no

  data_type: 'char'
  is_nullable: 0
  size: 4

=head2 dept_name

  data_type: 'varchar'
  is_nullable: 0
  size: 40

=cut

__PACKAGE__->add_columns(
  "dept_no",
  { data_type => "char", is_nullable => 0, size => 4 },
  "dept_name",
  { data_type => "varchar", is_nullable => 0, size => 40 },
);

=head1 PRIMARY KEY

=over 4

=item * L</dept_no>

=back

=cut

__PACKAGE__->set_primary_key("dept_no");

=head1 UNIQUE CONSTRAINTS

=head2 C<dept_name_unique>

=over 4

=item * L</dept_name>

=back

=cut

__PACKAGE__->add_unique_constraint("dept_name_unique", ["dept_name"]);

=head1 RELATIONS

=head2 dept_emps

Type: has_many

Related object: L<EmployeeManager::Schema::Result::DeptEmp>

=cut

__PACKAGE__->has_many(
  "dept_emps",
  "EmployeeManager::Schema::Result::DeptEmp",
  { "foreign.dept_no" => "self.dept_no" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 dept_managers

Type: has_many

Related object: L<EmployeeManager::Schema::Result::DeptManager>

=cut

__PACKAGE__->has_many(
  "dept_managers",
  "EmployeeManager::Schema::Result::DeptManager",
  { "foreign.dept_no" => "self.dept_no" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07047 @ 2017-10-25 16:36:45
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:6KK1leBtMvyIhGrdplMo5Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
