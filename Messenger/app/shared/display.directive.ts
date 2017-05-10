import { Directive, ElementRef, Renderer } from '@angular/core';

@Directive({
    selector: '[display]',
    host: {
        '(mouseleave)': 'onMouseLeave()'
    }
})
export class DisplayDirective {
    constructor(private element: ElementRef, private renderer: Renderer) {
        this.renderer.setElementStyle(this.element.nativeElement, "cursor", "poiner");
    }

    onMouseLeave(): void {
        this.setDisplay("none");
        this.setFontWeight("bold");
        console.log("MouseLeave");
        console.log(this.element);
    }

    private setDisplay(value: string): void {
        this.renderer.setElementStyle(this.element.nativeElement, "display", value);
    }
    

    private setFontWeight(value:string) {
        this.renderer.setElementStyle(this.element.nativeElement, "font-weight", value);
    }
}