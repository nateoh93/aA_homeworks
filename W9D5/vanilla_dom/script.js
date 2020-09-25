document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!
  const addList = (e) => {
    e.preventDefault();

    const input = document.querySelector(".favorite-input");
    const favValue = input.value;
    input.value = "";

    const newList = document.createElement("li");
    newList.textContent = favValue;

    const restaurantList = document.getElementById("sf-places");
    restaurantList.appendChild(newList);
  }

  const submitPlace = document.querySelector(".favorite-submit");
  submitPlace.addEventListener("click", addList);


  // adding new photos

  // --- your code here!

  const photoForm = (e) => {
    const photoFormDiv = document.querySelector(".photo-form-container");

    if (photoFormDiv.className === "photo-form-container hidden") {
      photoFormDiv.className = "photo-form-container";
    } else {
      photoFormDiv.className = "photo-form-container hidden";
    };
  }

  const photoFormShow = document.querySelector(".photo-show-button");
  photoFormShow.addEventListener("click", photoForm);

  const addPhoto = (e) => {
    e.preventDefault();

    const photoUrlInput = document.querySelector(".photo-url-input");
    const photoValue = photoUrlInput.value;
    photoUrlInput.value = "";

    const newImage = document.createElement("img");
    newImage.src = photoValue;

    const newImageList = document.createElement("li");
    newImageList.appendChild(newImage);

    const dogPhotoList = document.querySelector(".dog-photos");
    dogPhotoList.appendChild(newImageList);
  }

  const imageSubmit = document.querySelector(".photo-url-submit");
  imageSubmit.addEventListener("click", addPhoto);

});
