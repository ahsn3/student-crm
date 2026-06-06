(function () {
  var root = document.getElementById("profilePage");
  if (!root) {
    return;
  }

  var fileInput = document.getElementById("profileLogoFile");
  var avatar = document.getElementById("profilePhotoAvatar");
  var img = document.getElementById("profilePhotoImg");
  var initials = document.getElementById("profilePhotoInitials");
  var fileNameEl = document.getElementById("profilePhotoFileName");
  var uploadLabel = root.querySelector(".profile-photo-upload-btn");
  var removeForm = document.getElementById("profileRemovePhotoForm");
  var confirmMsg = root.getAttribute("data-remove-confirm") || "Remove your profile photo?";
  var pendingLabel = (fileNameEl && fileNameEl.getAttribute("data-pending")) || "Change photo";
  var previewUrl = null;

  function revokePreview() {
    if (previewUrl) {
      URL.revokeObjectURL(previewUrl);
      previewUrl = null;
    }
  }

  function showPreview(file) {
    if (!file || !avatar) {
      return;
    }
    revokePreview();
    previewUrl = URL.createObjectURL(file);
    avatar.classList.remove("profile-photo-avatar--empty");
    if (img) {
      img.src = previewUrl;
      img.hidden = false;
    } else {
      var newImg = document.createElement("img");
      newImg.id = "profilePhotoImg";
      newImg.className = "profile-photo-avatar-img";
      newImg.alt = "";
      newImg.width = 96;
      newImg.height = 96;
      newImg.src = previewUrl;
      if (initials) {
        initials.remove();
      }
      avatar.appendChild(newImg);
      img = newImg;
    }
    if (initials) {
      initials.hidden = true;
    }
    if (fileNameEl) {
      fileNameEl.textContent = pendingLabel + ": " + file.name;
    }
    if (uploadLabel) {
      uploadLabel.textContent = pendingLabel;
    }
  }

  if (fileInput) {
    fileInput.addEventListener("change", function () {
      var file = fileInput.files && fileInput.files[0];
      if (!file) {
        return;
      }
      showPreview(file);
    });
  }

  if (removeForm) {
    removeForm.addEventListener("submit", function (event) {
      if (!window.confirm(confirmMsg)) {
        event.preventDefault();
      }
    });
  }

  if (uploadLabel && fileNameEl && fileNameEl.getAttribute("data-current")) {
    uploadLabel.textContent = pendingLabel;
  }

  window.addEventListener("pagehide", revokePreview);
})();
