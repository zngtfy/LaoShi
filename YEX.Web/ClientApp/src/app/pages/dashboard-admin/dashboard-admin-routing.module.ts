import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { DashboardAdminComponent } from './dashboard-admin.component';

const routes: Routes = [
  {
    path: '',
    component: DashboardAdminComponent,
    data: {
      title: 'Dashboard Administrator'
    }
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class DashboardAdminRoutingModule {}
