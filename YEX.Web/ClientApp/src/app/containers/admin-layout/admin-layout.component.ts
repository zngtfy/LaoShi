import { Component, OnInit, ViewChild } from '@angular/core';
import { UserProvider } from '../../providers';
import { Token } from '../../utilities';

@Component({
  selector: 'app-admin-layout',
  templateUrl: './admin-layout.component.html',
  styleUrls: ['./admin-layout.component.css']
})
export class AdminLayoutComponent implements OnInit{
    
    public navItems = [];
    curUser: any = {
        id: 0,
        userName: "admin",
        firstName: "Hao",
        lastName: "Lee",
        fullName: "Người dùng",
        language: "vi-vn",
        role: "",
        avatar: "assets/img/avatars/ava1.png"
    };

    constructor(
        private pro: UserProvider,
    ) { }
    ngOnInit()
    {
        this.navItems = this.pro.getMenuNav();
        this.getCurUser();
    }

    refreshAvatar(avatar){
        this.curUser.avatar = avatar;
    }

    getCurUser() {
        let t = Token.getUser();
        //console.log(t);
        if(t==null)
        {
            this.curUser={
                id: 0,
                userName: "no-one",
                firstName: "Người",
                lastName: "dùng",
                fullName: "Người dùng",
                language: "vi-vn",
                role: "",
                avatar: "assets/img/avatars/ava1.png"
            }
        }
        else
        {
            this.curUser = t;
        }
    }

    SignOut()
    {
        console.log("out");
        this.pro.signOut();
        this.curUser={
            id: 0,
                userName: "no-one",
                firstName: "Người",
                lastName: "dùng",
                fullName: "Người dùng",
                language: "vi-vn",
                role: "",
                avatar: "assets/img/avatars/ava1.png"
        }
    }
}
