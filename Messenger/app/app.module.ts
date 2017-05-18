import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { ReactiveFormsModule }   from '@angular/forms';

// Imports for loading & configuring the in-memory web api
import { InMemoryWebApiModule } from 'angular-in-memory-web-api';
import { InMemoryDataService } from './in-memory-data/in-memory-data.service';


import { AppComponent } from './app.component';
/*
***************** Sidebar part of application ******************
*/
import { SidebarComponent } from './components/sidebar/sidebar.component';
import { PanelFunctionsComponent } from './components/sidebar/panel-functions/panel-functions.component';
// import { SearchFunctionComponent } from './components/sidebar/search-function/search-function.component';
import { ContactsListComponent } from './components/sidebar/contacts-list/contacts-list.component';
import { ContactItemComponent } from './components/sidebar/contact-item/contact-item.component';
import { ContactFormComponent } from './components/middle/contact-form/contact-form.component';

/*
*****************  Middle part of application ***************** 
*/
import { MiddleComponent } from './components/middle/middle.component';
/*
*****************  Services ***************** 
*/
import { AppService } from './shared/services/app.service';
import { SidebarService } from './shared/services/sidebar.service';
import { MiddleService } from "./shared/services/middle.service";
/*
*****************  Other ***************** 
*/
import { DisplayDirective } from './shared/directives/display.directive';
import { FilterSearchPipe } from './filter-search.pipe';

@NgModule({
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    ReactiveFormsModule,
    InMemoryWebApiModule.forRoot(InMemoryDataService)
  ],
  declarations: [
    AppComponent,
    DisplayDirective,
    SidebarComponent,
    MiddleComponent,
    ContactFormComponent,
    PanelFunctionsComponent,
    // SearchFunctionComponent,
    ContactsListComponent,
    ContactItemComponent,
    FilterSearchPipe],
  providers: [AppService, SidebarService, MiddleService],
  bootstrap: [AppComponent]
})
export class AppModule {


}
