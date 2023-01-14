(function($) {
    "use strict";
    let page = parseInt(100/8);
let other = 100%8;
if (other === 0) {
    page = 100/8;
}else  {
    page += 1;
}
$('#pagination-demo').twbsPagination(
    {
        totalPages: page,
        visiblePages: 4,
        next: 'Next',
        prev: 'Prev',
        onPageClick: function (event, page) {
            //fetch content and render here
            $('#page-content').text('Page ' + page) + ' content here';
        }
    }
);
}
(jQuery)
);