


function LogoutAccount() {
  if (!confirm("Xác nhận đăng xuất?")) {
    return false;
  }
  //Logout action
  $.ajax({
    url: "/AccountMember/LogoutAccount",
    type: "POST",
    contentType: "json",
    data: {},
    success: function (result) {
      if (result.length > 0) {
        alert(result);
        location.href = "/AccountMember/Login";
      }
    },
    error: function () {
      alert("Không thực hiện được");
    },
  });
}

var myModal = new bootstrap.Modal(
  document.getElementById("deleteAccountModal"),
  {
    keyboard: false,
  }
);

$("#deleteAccount").click(function () {
  event.preventDefault();
  myModal.show();
});

$("#btnSendRequest").click(function () {
  event.preventDefault();
  var ReasonName = $("#ReasonName").val();
  if (ReasonName === "") {
    alert("Vui lòng nhập lý do");
  } else {
    $.ajax({
      url: "/Profile/DeleteAccount",
      type: "GET",
      /*contentType: 'json',*/
      data: {
        Reason: ReasonName,
      },
      success: function (result) {
        if (result.length > 0) {
          alert(result);
          location.href = "/AccountMember/Login";
        } else {
          alert("Xóa tài khoản không thành công");
        }
      },
      error: function () {
        alert("Không thực hiện được");
      },
    });
  }
});


function ChangeName() {
  var name = $("#Fullname").val();
  if (name == "") {
    alert("Tên không được để trống");
    return false;
  }
  if (confirm("Xác nhận thay đổi Họ và tên")) {
    $.ajax({
      url: "/Profile/ChangeProfile",
      type: "POST",
      data: {
        Fullname: name,
        changeType: 1, //Fullname
      },
      success: function (result) {
        if (result.status == 1) {
          alert(result.msg);
          location.reload();
        } else {
          alert(result.msg);
        }
      },
      error: function () {
        alert("Không thực hiện được");
      },
    });
  }
}

function ChangePhone() {
  var phone = $("#Telephone").val();
  if (phone == "") {
    alert("Số điện thoại không được để trống");
    return false;
  }
  if (confirm("Xác nhận thay đổi Số điện thoại")) {
    $.ajax({
      url: "/Profile/ChangeProfile",
      type: "POST",
      data: {
        Telephone: phone,
        changeType: 2, //Telephone
      },
      success: function (result) {
        if (result.status == 1) {
          alert(result.msg);
          location.reload();
        } else {
          alert(result.msg);
        }
      },
      error: function () {
        alert("Không thực hiện được");
      },
    });
  }
}

function ChangeBirthDay() {
  var day = parseInt($("#birthDay").val());
  var month = parseInt($("#birthMonth").val());
  var year = parseInt($("#birthYear").val());

  if (!(day > 1)) {
    alert("Kiểm tra thông tin ngày sinh");
    return false;
  }
  if (!(month > 1)) {
    alert("Kiểm tra thông tin tháng sinh");
    return false;
  }
  if (!(year > 1) || year.toString().length < 4) {
    alert("Kiểm tra thông tin năm sinh");
    return false;
  }

  var dateOfBirth = day + "/" + month + "/" + year;

  if (confirm("Xác nhận thay đổi Ngày sinh")) {
    $.ajax({
      url: "/Profile/ChangeProfile",
      type: "POST",
      data: {
        DateOfBirth: dateOfBirth,
        changeType: 3, //BirthDay
      },
      success: function (result) {
        if (result.status == 1) {
          alert(result.msg);
          location.reload();
        } else {
          alert(result.msg);
        }
      },
      error: function () {
        alert("Không thực hiện được");
      },
    });
  }
}

function ChangeGender() {
  var gender = $("#Gender").val();
  if (gender == "") {
    alert("Vui lòng chọn giới tính");
    return false;
  }
  if (confirm("Xác nhận thay đổi thông tin Giới tính")) {
    $.ajax({
      url: "/Profile/ChangeProfile",
      type: "POST",
      data: {
        Gender: gender,
        changeType: 4, //Gender
      },
      success: function (result) {
        if (result.status == 1) {
          alert(result.msg);
          location.reload();
        } else {
          alert(result.msg);
        }
      },
      error: function () {
        alert("Không thực hiện được");
      },
    });
  }
}

function ChangeNational() {
  var country = $("#CountryId").val();
  if (country == "") {
    alert("Vui lòng chọn quốc gia");
    return false;
  }
  if (confirm("Xác nhận thay đổi quốc tịch")) {
    $.ajax({
      url: "/Profile/ChangeProfile",
      type: "POST",
      data: {
        CountryId: country,
        changeType: 5, //Country
      },
      success: function (result) {
        if (result.status == 1) {
          alert(result.msg);
          location.reload();
        } else {
          alert(result.msg);
        }
      },
      error: function () {
        alert("Không thực hiện được");
      },
    });
  }
}

function ChangeAddress() {
  var address = $("#Address").val();
  var provinceId = $("#ProvinceId").val();
  var districtId = $("#DistrictId").val();
  if (address == "") {
    alert("Địa chỉ không được để trống");
    return false;
  }
  if (provinceId == "") {
    alert("Vui lòng chọn tỉnh/TP");
    return false;
  }
  if (districtId == "") {
    alert("Vui lòng chọn quận/huyện");
    return false;
  }
  if (confirm("Xác nhận thay đổi Họ và tên")) {
    $.ajax({
      url: "/Profile/ChangeProfile",
      type: "POST",
      data: {
        Address: address,
        ProvinceId: provinceId,
        DistrictId: districtId,
        changeType: 6, //Address
      },
      success: function (result) {
        if (result.status == 1) {
          alert(result.msg);
          location.reload();
        } else {
          alert(result.msg);
        }
      },
      error: function () {
        alert("Không thực hiện được");
      },
    });
  }
}

function ChangeIdCard() {
  var idCard = $("#IdCard").val();
  var dateOfIssueIdCard = $("#DateOfIssueIdCard").val();
  var placeOfIssueIdCard = $("#PlaceOfIssueIdCard").val();
  if (idCard == "") {
    alert("CCCD/CMND không được để trống");
    return false;
  }
  if (dateOfIssueIdCard == "") {
    alert("Ngày cấp không được để trống");
    return false;
  }
  if (placeOfIssueIdCard == "") {
    alert("Nơi cấp không được để trống");
    return false;
  }
  if (confirm("Xác nhận thay đổi thông tin CMND/CCCD")) {
    $.ajax({
      url: "/Profile/ChangeProfile",
      type: "POST",
      data: {
        IdCard: idCard,
        DateOfIssueIdCard: dateOfIssueIdCard,
        PlaceOfIssueIdCard: placeOfIssueIdCard,
        changeType: 7, //IdCard
      },
      success: function (result) {
        if (result.status == 1) {
          alert(result.msg);
          location.reload();
        } else {
          alert(result.msg);
        }
      },
      error: function () {
        alert("Không thực hiện được");
      },
    });
  }
}

function ChangePassport() {
  var passport = $("#Passport").val();
  var dateOfIssuePassport = $("#DateOfIssuePassport").val();
  var dateOfExpirationPassport = $("#DateOfExpirationPassport").val();
  if (passport == "") {
    alert("Passport không được để trống");
    return false;
  }
  if (dateOfIssuePassport == "") {
    alert("Ngày cấp không được để trống");
    return false;
  }
  if (dateOfExpirationPassport == "") {
    alert("Ngày hết hạn không được để trống");
    return false;
  }
  if (confirm("Xác nhận thay đổi thông tin Passport")) {
    $.ajax({
      url: "/Profile/ChangeProfile",
      type: "POST",
      data: {
        Passport: passport,
        DateOfIssuePassport: dateOfIssuePassport,
        DateOfExpirationPassport: dateOfExpirationPassport,
        changeType: 8, //Passport
      },
      success: function (result) {
        if (result.status == 1) {
          alert(result.msg);
          location.reload();
        } else {
          alert(result.msg);
        }
      },
      error: function () {
        alert("Không thực hiện được");
      },
    });
  }
}

function GetDistrict(element) {
  console.log(element.value);
  // Tương tác với server
  $.ajax({
    url: "/Ajax/GetDropdownDistrict",
    data: {
      provinceId: element.value,
    },
    success: function (result) {
      //Reset option Destination
      $("#DistrictId").empty();
      $("#DistrictId").append(
        $("<option></option>").val("").html("Chọn quận/huyện")
      );
      for (n = 0; n < result.length; n++) {
        $("#DistrictId").append(
          $("<option></option>")
            .val(result[n].Value)
            .html(result[n].Text)
        );
      }
    },
  });
}






function btnHidden8() {
  var x = document.getElementById("edit_passport");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}

function btnHidden_payment() {
  var x = document.getElementById("add-card");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}