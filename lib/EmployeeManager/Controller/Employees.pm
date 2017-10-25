package EmployeeManager::Controller::Employees;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

EmployeeManager::Controller::Employees - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched EmployeeManager::Controller::Employees in Employees.');
}

sub list : Local {
    my ( $self, $c ) = @_;
    $c->stash( employees => [ $c->model('DB::Employee')->search( {}, { rows => 50, order_by => 'emp_no ASC' } ) ] );
    $c->stash( template => 'employees/list.tt2' );
}

=encoding utf8

=head1 AUTHOR

Kit,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
