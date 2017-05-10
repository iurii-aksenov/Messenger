import { Pipe, PipeTransform } from '@angular/core';
 
@Pipe({
    name: 'filterSearch'
})
export class FilterSearchPipe implements PipeTransform {
  transform(items: any[], args: any[]): any {
     
    return items.filter(item => 
      item.firstName.indexOf(args[0]) !== -1);
    
  }
}