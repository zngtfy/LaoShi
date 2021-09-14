import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { DashboardTeacherComponent } from './dashboard-teacher.component';

const routes: Routes = [
  {
    path: '',
    component: DashboardTeacherComponent,
    data: {
      title: 'Dashboard of Teacher - TA'
    }
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class DashboardTeacherRoutingModule {}
