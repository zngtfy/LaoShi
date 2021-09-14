import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { DashboardGradComponent } from './dashboard-grad.component';

const routes: Routes = [
  {
    path: '',
    component: DashboardGradComponent,
    data: {
      title: 'Dashboard of Thesis'
    }
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class DashboardGradRoutingModule {}
