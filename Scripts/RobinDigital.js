document.addEventListener("DOMContentLoaded", (event) => {

    //Enable custom back button that submits the CCC btnBack when clicked
    let cccBackButton = document.getElementById(`btnBack`);
    let backButton = document.querySelectorAll(`.BackButton`);
    backButton.forEach(function (button) {
        button.addEventListener(`click`, function (event) {
            cccBackButton.firstChild.click();
        });
    });

    //Enable custom next button that submits the CCC btnContinue when clicked
    let cccNextButton = document.getElementById(`btnContinue`);
    let nextButton = document.querySelectorAll(`.NextButton`);
    nextButton.forEach(function (button) {
        button.addEventListener(`click`, function (event) {
            cccNextButton.firstChild.click();
        });
    });

    //Fix label widths so they are 100% of available space
    let formItem = document.querySelectorAll(`#aspnetForm .form-group`);
    formItem.forEach(function (item) {
        let itemOuterSpan = item.firstElementChild;
        if (itemOuterSpan != null) {
            let itemOuterDiv = itemOuterSpan.firstElementChild;
            if (itemOuterDiv != null) {
                let formLabel = itemOuterDiv.firstElementChild;

                if (formLabel !== null) {
                    formLabel.style.display = 'block';
                    formLabel.style.width = 'inherit';
                }

                //For when there is a second field in the form group such as email confirmation
                let itemOuterDiv2 = itemOuterDiv.nextElementSibling;
                if (itemOuterDiv2 != null) {
                    let formLabel2 = itemOuterDiv2.firstElementChild;

                    if (formLabel2 !== null) {
                        formLabel2.style.display = 'block';
                        formLabel2.style.width = 'inherit';
                    }
                }
            }
        }

    });

    //Another variation
    let formItem2 = document.querySelectorAll(`#aspnetForm .form-input`);
    formItem2.forEach(function (item) {
        let itemOuterSpan = item.firstElementChild;
        if (itemOuterSpan != null) {
            let itemOuterDiv = itemOuterSpan.firstElementChild;
            if (itemOuterDiv != null) {
                let formLabel = itemOuterDiv.firstElementChild;

                if (formLabel !== null) {
                    formLabel.style.display = 'block';
                    formLabel.style.width = 'inherit';
                }
            }
        }

    });

    //Fix validation error boxes so they are more visible
    //Fix label widths so they are 100% of available space
    let validationError = document.querySelectorAll(`#aspnetForm .error`);
    validationError.forEach(function (errorMsg) {
        errorMsg.classList.add(`alert`);
        errorMsg.classList.add(`alert-danger`);
    });

    //Fix empty boxes for drop-downs so they say Please Select instead
    let selectBoxes = document.querySelectorAll(`#aspnetForm select`);
    selectBoxes.forEach(function (elem) {
        let selectedOption = elem.selectedIndex;
        [...elem.options].forEach(function (option) {
            if (option.value === ``) {
                option.text = `-- Please Select --`
                option.disabled = true;
            }
        });
    });

    //Clear validation errors when input is changed
    //document.querySelectorAll('#aspnetForm input, #aspnetForm select, #aspnetForm textarea').forEach(function (field) {
    //    field.addEventListener('input', function () {
    //        document.querySelectorAll('.alert-danger, .validator').forEach(function (error) {
    //            error.style.display = 'none';
    //        });

    //        document.querySelectorAll('.textfield, .form-control').forEach(function (input) {
    //            input.style.borderColor = '#dee2e6';
    //        });
    //    });
    //});

    //Clear closest validation error when input is changed
    document.querySelectorAll('input, select, textarea').forEach(function (field) {
        field.addEventListener('input', function () {
            field.style.borderColor = '#dee2e6';

            // Find the closest validation error element within the same form-group
            var formGroup = field.closest('.form-group');
            if (formGroup) {
                var error = formGroup.querySelector('.alert-danger, .validator, .field-validation-error');
                if (error) {
                    error.style.display = 'none';
                }
            }
        });
    });

    //Replaces jQuery Date Picker with browser native date selector - field should have HTML5InputType="date" against it
    $(function () {
        $("input[type=date]").datepicker("destroy");
    });

    //Switch any existing values in date boxes from dd/MM/yyyy to yyyy-MM-dd so they show in date fields
    let dateBoxes = document.querySelectorAll(`#aspnetForm input[type=date]`);
    dateBoxes.forEach(function (elem) {
        switchDateYMD(elem.id);
        elem.addEventListener('blur', function (event) {
            elem.value = isDateYMD(elem.value);
        });
    });

    //Switch dates from yyyy-MM-dd to dd/MM/yyyy before form submission
    if (cccNextButton !== null) {
        cccNextButton.addEventListener('click', function (event) {
            let dateBoxes = document.querySelectorAll(`#aspnetForm input[type=date]`);
            dateBoxes.forEach(function (elem) {
                switchDateDMY(elem.id);
            });
        });
    }

    //Capitalise the first character of all text boxes and remove any leading or trailing spaces
    let textBoxes = document.querySelectorAll(`#aspnetForm input[type=text]`);
    textBoxes.forEach(function (elem) {
        elem.addEventListener('change', function (event) {
            elem.value = capitaliseAfterSpaceOrHypen(elem.value);
            elem.value = trimString(elem.value);
        });
    });

    //Enable Enter Key in course search boxes
    let searchBox1 = document.getElementById(`SearchDept1`);
    let searchButton1 = document.getElementById(`SearchButton1`);

    if (searchBox1 !== null && searchButton1 !== null) {
        searchBox1.addEventListener(`keydown`, function (event) {
            if (event.key === "Enter") {
                // Cancel the default action, if needed
                event.preventDefault();
                // Trigger the button element with a click

                searchButton1.click();
            }
        });
    }


    let searchBox2 = document.getElementById(`SearchDept2`);
    let searchButton2 = document.getElementById(`SearchButton2`);

    if (searchBox2 !== null && searchButton2 !== null) {
        searchBox2.addEventListener(`keydown`, function (event) {
            if (event.key === "Enter") {
                // Cancel the default action, if needed
                event.preventDefault();
                // Trigger the button element with a click

                searchButton2.click();
            }
        });
    }

    //Prevent Enter button in input fields submitting forms
    let tabEvent = new KeyboardEvent('keydown', { 'key': 'Tab' });
    let inputBoxes = document.querySelectorAll(`#aspnetForm input[type=text]`);
    inputBoxes.forEach(function (elem) {
        elem.addEventListener(`keydown`, function (event) {
            if (event.key === "Enter") {
                // Cancel the default action to submit the form and do nothing
                event.preventDefault();
                elem.dispatchEvent(tabEvent);
            }
        });
    });
});


//Sort a select by the text options
function sortSelectByText(dropDown) {
    let items = new Array();
    let optionNum = null;

    optionNum = 0;
    [...dropDown.options].forEach(function (option) {
        items[optionNum] = new Array();
        items[optionNum][0] = option.text;
        items[optionNum][1] = option.value;

        optionNum += 1;
    });
    items.sort();

    optionNum = 0;
    items.forEach(function (elem) {
        let sortedOption = new Option(elem[0], elem[1]);
        dropDown.options[optionNum] = sortedOption;

        optionNum += 1;
    });
}

//Moves the specified item to the top of the select list options
function sortSelectMoveToTop(dropDown, optionValue) {
    let items = new Array();
    let optionNum = null;
    let selectedValue = dropDown.value;

    optionNum = 0;
    [...dropDown.options].forEach(function (option) {
        items[optionNum] = new Array();
        items[optionNum][0] = option.text;
        items[optionNum][1] = option.value;

        optionNum += 1;
    });

    //Sort array
    //items.sort();

    //Move specified item to the top of the list
    items.sort(function (x, y) {
        let first = optionValue;
        return x[1] == first ? -1 : y[1] == first ? 1 : 0;
    });

    //If there is a please select/blank option put this back at the top
    items.sort(function (x, y) {
        let first = ``;
        return x[1] == first ? -1 : y[1] == first ? 1 : 0;
    });

    //Clear existing select options
    while (dropDown.options.length > 0) {
        dropDown.options[0] = null;
    }

    optionNum = 0;
    //Add array items back to select
    items.forEach(function (elem) {
        let sortedOption = new Option(elem[0], elem[1]);
        dropDown.options[optionNum] = sortedOption;

        optionNum += 1;
    });

    //Ensure previously selected option remains selected
    dropDown.value = selectedValue;
}

//Switch date from yyyy-MM-dd to dd/MM/yyyy
function switchDateDMY(elemID) {
    let elem = document.getElementById(elemID);
    let elemVal = elem.value;

    if (elemVal !== null) {
        if (elemVal.length > 0) {
            let elemDay = elemVal.substring(8, 10);
            let elemMonth = elemVal.substring(5, 7);
            let elemYear = elemVal.substring(0, 4);
            //let elemDate = new Date(elemYear, elemMonth, elemDay);
            let dateString = elemDay + `/` + elemMonth + `/` + elemYear;

            //alert(dateString);

            elem.type = 'text';
            elem.value = dateString;
        }
    }
}

//Switch date from dd/MM/yyyy to yyyy-MM-dd
function switchDateYMD(elemID) {
    let elem = document.getElementById(elemID);

    //Need to get via attribute as value shows as empty due to format issue
    let elemVal = elem.getAttribute(`value`);

    //alert(elemVal);
    if (elemVal !== null) {
        if (elemVal.length > 0) {
            let elemDay = elemVal.substring(0, 2);
            let elemMonth = elemVal.substring(3, 5);
            let elemYear = elemVal.substring(6, 10);
            //let elemDate = new Date(elemYear, elemMonth, elemDay);
            let dateString = elemYear + `-` + elemMonth + `-` + elemDay;

            //alert(dateString);
            elem.value = dateString;
        }
    }
}

function addSearchableDropDown(elem) {
    //On Safari Datalists only show the value and not the description so disable on this browser
    //Chrome also contains Safari in its user agent string so need 2 checks

    let enableSearchableDropDowns = true;
    let isIPhone = navigator.userAgent.indexOf("iPhone") > -1;
    let isIPad = navigator.userAgent.indexOf("iPad") > -1;

    if (isIPhone === true || isIPad === true) {
        enableSearchableDropDowns = false;
    }

    if (enableSearchableDropDowns === true) {
        //Get text from Select
        let currentDropDownText = elem.options[elem.selectedIndex].text;
        //Hide select
        elem.classList.add("d-none");

        //Remove datalist if it already exists such as if re-running this function if the items in the original select have changed
        let existingInputBox = document.getElementById(elem.id + "InputBox");
        let existingDataList = document.getElementById(elem.id + "InputBoxItems");

        if (existingInputBox !== null) {
            existingInputBox.remove();
        }

        if (existingDataList !== null) {
            existingDataList.remove();
        }

        //Create textbox
        let inputBox = document.createElement(`input`);
        inputBox.id = elem.id + "InputBox";
        inputBox.value = currentDropDownText;
        inputBox.classList.add("textfield");
        inputBox.classList.add("form-control");
        inputBox.setAttribute("type", "text");
        inputBox.setAttribute("autocomplete", "off");

        let dataList = document.createElement(`datalist`);
        dataList.id = elem.id + "InputBoxItems";
        dataList.innerHTML = elem.innerHTML;

        //Add to page
        elem.parentNode.insertBefore(dataList, elem.nextSibling);
        elem.parentNode.insertBefore(inputBox, elem.nextSibling);

        inputBox.setAttribute(`list`, elem.id + "InputBoxItems");

        let changeEvent = new Event(`change`);
        let blurEvent = new Event(`blur`);
        let tabEvent = new KeyboardEvent('keydown', { 'key': 'Tab' });

        //If existing element is changed programatically ensure new element is kept up to date
        elem.addEventListener(`change`, function (event) {
            let newDropDownText = elem.options[elem.selectedIndex].text;

            //Update input box to match value if different
            if (inputBox.value !== newDropDownText) {
                inputBox.value = newDropDownText;
            }
        });

        //On focus clear current value so datalist will show
        inputBox.addEventListener(`focus`, function (event) {
            inputBox.value = ``;
        });

        inputBox.addEventListener(`keydown`, function (event) {
            if (event.key === "Enter") {
                // Cancel the default action to submit the form and do nothing
                event.preventDefault();
                inputBox.dispatchEvent(tabEvent);
            }
        });

        //On blur update original element value to value selected in datalist
        inputBox.addEventListener(`change`, function (event) {
            //Try to set select based on value such as if selected from datalist or tab key
            let selectedIndex = [...elem.options].findIndex(option => option.value === inputBox.value);

            //If blank check if input box contains the full text value
            if (selectedIndex === -1) {
                selectedIndex = [...elem.options].findIndex(option => option.text === inputBox.value);
            }

            if (selectedIndex >= 0) {
                elem.selectedIndex = selectedIndex;

                //Trigger change event on original element to ensure any on change events fire
                elem.dispatchEvent(changeEvent);

                //Check if value was valid
                let selectedItem = elem.options[elem.selectedIndex];

                //If valid
                if (selectedItem != null) {
                    inputBox.value = elem.options[elem.selectedIndex].text;
                }
                else {
                    inputBox.value = ``;
                }
            }
            else {
                inputBox.value = ``;
            }
        });

        //On tab autocomplete if one element
        inputBox.addEventListener(`keydown`, function (event) {
            if (event.key == `Tab`) {
                event.preventDefault();

                //Check if text value was entered
                let selectedIndex = [...dataList.options].findIndex(option => option.text.indexOf(inputBox.value) > -1);
                if (selectedIndex === -1) {
                    //If not found then check if it was the value
                    selectedIndex = [...dataList.options].findIndex(option => option.value.indexOf(inputBox.value) > -1);
                }

                if (selectedIndex >= 0) {
                    //Input box must contain value not text to be able to be looked up on blur and switched back to text value
                    inputBox.value = dataList.options[selectedIndex].value;

                    //Focus next element in form
                    const inputTypes = ['text', 'number', 'email', 'tel', 'date', 'password', 'select-one'];

                    //Format for standard screens in PS Web Enrolments which have many spans ans divs
                    let nextElement = inputBox.parentElement.parentElement.parentElement.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.nextElementSibling;
                    //If next field has a searchable drop-down then select this element instead
                    let nextElementInputBox = null;
                    if (nextElement.nextElementSibling !== null) {
                        nextElementInputBox = nextElement.nextElementSibling.nextElementSibling;
                    }

                    //If next element is a form field then switch focus to it
                    if (nextElementInputBox !== null && inputTypes.includes(nextElementInputBox.type) === true) {
                        nextElementInputBox.focus();
                    }
                    else if (nextElement !== null && inputTypes.includes(nextElement.type) === true) {
                        nextElement.focus();
                    }
                }
            }
        });

        //Clear closest validation error when input is changed
        inputBox.addEventListener('input', function () {
            inputBox.style.borderColor = '#dee2e6';

            // Find the closest validation error element within the same form-group
            var formGroup = inputBox.closest('.form-group');
            if (formGroup) {
                var error = formGroup.querySelector('.alert-danger, .validator, .field-validation-error');
                if (error) {
                    error.style.display = 'none';
                }
            }
        });

        //If options of original select are changed, refresh datalist
        let observer = new MutationObserver(function (mutationsList, observer) {
            //console.log(mutationsList);
            dataList.innerHTML = elem.innerHTML;
            inputBox.value = ``;
        });

        observer.observe(elem, { characterData: false, childList: true, attributes: false });

        return inputBox;
    }
    else {
        return null;
    }
}

function addSearchableDropDownWithButton(elem, buttonText) {
    //On Safari Datalists only show the value and not the description so disable on this browser
    //Chrome also contains Safari in its user agent string so need 2 checks

    let enableSearchableDropDowns = true;
    let isIPhone = navigator.userAgent.indexOf("iPhone") > -1;
    let isIPad = navigator.userAgent.indexOf("iPad") > -1;

    if (isIPhone === true || isIPad === true) {
        enableSearchableDropDowns = false;
    }

    if (enableSearchableDropDowns === true) {
        //Get text from Select
        let currentDropDownText = elem.options[elem.selectedIndex].text;
        //Hide select
        elem.classList.add("d-none");

        //Remove datalist if it already exists such as if re-running this function if the items in the original select have changed
        let existingInputBox = document.getElementById(elem.id + "InputBox");
        let existingDataList = document.getElementById(elem.id + "InputBoxItems");

        if (existingInputBox !== null) {
            existingInputBox.remove();
        }

        if (existingDataList !== null) {
            existingDataList.remove();
        }

        //Create textbox
        let inputBox = document.createElement(`input`);
        inputBox.id = elem.id + "InputBox";
        inputBox.value = currentDropDownText;
        inputBox.classList.add("textfield");
        inputBox.classList.add("form-control");
        inputBox.setAttribute("type", "text");

        let dataList = document.createElement(`datalist`);
        dataList.id = elem.id + "InputBoxItems";
        dataList.innerHTML = elem.innerHTML;

        let changeEvent = new Event(`change`);
        let blurEvent = new Event(`blur`);
        let tabEvent = new KeyboardEvent('keydown', { 'key': 'Tab' });

        //Create Input Group and Button
        let inputButton = document.createElement(`button`);
        inputButton.id = elem.id + "InputButton";
        inputButton.innerHTML = buttonText;
        //inputButton.type = "button"; //Not using this as button loses its outline - see event listener below for prevent default
        inputButton.classList.add("btn");
        inputButton.classList.add("btn-outline-secondary");
        //inputButton.classList.add("active");

        let inputGroup = document.createElement(`div`);
        inputGroup.id = elem.id + "InputGroup";
        inputGroup.classList.add("input-group");
        inputGroup.classList.add("mb-3");
        inputGroup.classList.add("pt-2");

        inputGroup.appendChild(inputBox);
        inputGroup.appendChild(inputButton);

        //Add to page
        elem.parentNode.insertBefore(dataList, elem.nextSibling);
        elem.parentNode.insertBefore(inputGroup, elem.nextSibling);

        inputBox.setAttribute(`list`, elem.id + "InputBoxItems");

        //If existing element is changed programatically ensure new element is kept up to date
        elem.addEventListener(`change`, function (event) {
            let newDropDownText = elem.options[elem.selectedIndex].text;

            //Update input box to match value if different
            if (inputBox.value !== newDropDownText) {
                inputBox.value = newDropDownText;
            }
        });

        //On focus clear current value so datalist will show
        inputBox.addEventListener(`focus`, function (event) {
            inputBox.value = ``;
        });

        inputBox.addEventListener(`keydown`, function (event) {
            if (event.key === "Enter") {
                // Cancel the default action to submit the form and do nothing
                event.preventDefault();
                inputBox.dispatchEvent(tabEvent);
            }
        });

        //On blur update original element value to value selected in datalist
        inputBox.addEventListener(`change`, function (event) {
            //Try to set select based on value such as if selected from datalist or tab key
            let selectedIndex = [...elem.options].findIndex(option => option.value === inputBox.value);

            //If blank check if input box contains the full text value
            if (selectedIndex === -1) {
                selectedIndex = [...elem.options].findIndex(option => option.text === inputBox.value);
            }

            if (selectedIndex >= 0) {
                elem.selectedIndex = selectedIndex;

                //Trigger change event on original element to ensure any on change events fire
                elem.dispatchEvent(changeEvent);

                //Check if value was valid
                let selectedItem = elem.options[elem.selectedIndex];

                //If valid
                if (selectedItem != null) {
                    inputBox.value = elem.options[elem.selectedIndex].text;
                }
                else {
                    inputBox.value = ``;
                }
            }
            else {
                inputBox.value = ``;
            }
        });

        //On tab autocomplete if one element
        inputBox.addEventListener(`keydown`, function (event) {
            if (event.key == `Tab`) {
                event.preventDefault();

                //Check if text value was entered
                let selectedIndex = [...dataList.options].findIndex(option => option.text.indexOf(inputBox.value) > -1);
                if (selectedIndex === -1) {
                    //If not found then check if it was the value
                    selectedIndex = [...dataList.options].findIndex(option => option.value.indexOf(inputBox.value) > -1);
                }

                if (selectedIndex >= 0) {
                    //Input box must contain value not text to be able to be looked up on blur and switched back to text value
                    inputBox.value = dataList.options[selectedIndex].value;

                    //Focus next element in form
                    const inputTypes = ['text', 'number', 'email', 'tel', 'date', 'password', 'select-one'];

                    //Format for standard screens in PS Web Enrolments which have many spans ans divs
                    let nextElement = inputBox.parentElement.parentElement.parentElement.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.nextElementSibling;
                    //If next field has a searchable drop-down then select this element instead
                    let nextElementInputBox = null;
                    if (nextElement.nextElementSibling !== null) {
                        nextElementInputBox = nextElement.nextElementSibling.nextElementSibling;
                    }

                    //If next element is a form field then switch focus to it
                    if (nextElementInputBox !== null && inputTypes.includes(nextElementInputBox.type) === true) {
                        nextElementInputBox.focus();
                    }
                    else if (nextElement !== null && inputTypes.includes(nextElement.type) === true) {
                        nextElement.focus();
                    }
                }
            }
        });

        //Clear closest validation error when input is changed
        inputBox.addEventListener('input', function () {
            inputBox.style.borderColor = '#dee2e6';

            // Find the closest validation error element within the same form-group
            var formGroup = inputBox.closest('.form-group');
            if (formGroup) {
                var error = formGroup.querySelector('.alert-danger, .validator, .field-validation-error');
                if (error) {
                    error.style.display = 'none';
                }
            }
        });

        //If options of original select are changed, refresh datalist
        let observer = new MutationObserver(function (mutationsList, observer) {
            //console.log(mutationsList);
            dataList.innerHTML = elem.innerHTML;
            inputBox.value = ``;
        });

        //Ensure button press does not submit form
        inputButton.addEventListener(`click`, function (event) {
            event.preventDefault();
        });

        observer.observe(elem, { characterData: false, childList: true, attributes: false });

        return inputGroup;
    }
    else {
        return null;
    }
}

function calculateAge(dob) {
    let today = new Date();
    let date31stAug = new Date(today.getFullYear() + "-08-31");
    let daysDiff = dateDiffInDays(dob, date31stAug);

    return Math.floor(daysDiff / 365.23076923074);
}

function calculateAge(dob, referenceDate) {
    let daysDiff = dateDiffInDays(dob, referenceDate);

    return Math.floor(daysDiff / 365.23076923074);
}

function dateDiffInDays(a, b) {
    const MILLISECONDS_TO_DAYS = 1000 * 60 * 60 * 24;
    // Discard the time and time-zone information.
    const utc1 = Date.UTC(a.getFullYear(), a.getMonth(), a.getDate());
    const utc2 = Date.UTC(b.getFullYear(), b.getMonth(), b.getDate());

    return Math.floor((utc2 - utc1) / MILLISECONDS_TO_DAYS);
}

const nth = (d) => {
    const dString = String(d);
    const last = +dString.slice(-2);
    if (last > 3 && last < 21) return 'th';
    switch (last % 10) {
        case 1: return "st";
        case 2: return "nd";
        case 3: return "rd";
        default: return "th";
    }
};

//Contact name is displayed as a single field so this function takes values from a forename and surname box and merges them into the default field
function updateContactName(contactNameField, contactForenameField, contactSurnameField) {
    let contactName = document.getElementById(contactNameField);
    let contactForename = document.getElementById(contactForenameField);
    let contactSurname = document.getElementById(contactSurnameField);

    let contactString = ``;
    if (contactForename.value.length > 0) {
        contactString += contactForename.value;
    }
    if (contactSurname.value.length > 0) {
        if (contactString.length > 0) {
            contactString += ` ` + contactSurname.value;
        }
        else {
            contactString += contactSurname.value;
        }
    }

    contactName.value = contactString;
}

//Contact name is displayed as a single field so this function takes the value from the default field and displays it on the seperate fields
function setContactName(contactNameField, contactForenameField, contactSurnameField) {
    let contactName = document.getElementById(contactNameField);
    let contactForename = document.getElementById(contactForenameField);
    let contactSurname = document.getElementById(contactSurnameField);

    let contactString = contactName.value.trim();
    let contactForenameValue = ``;
    let contactSurnameValue = ``;
    if (contactString.lastIndexOf(` `) > 0) {
        contactForenameValue = contactString.substring(0, contactString.lastIndexOf(` `));
        contactSurnameValue = contactString.substring(contactString.lastIndexOf(` `) + 1);
    }
    else {
        contactForenameValue = contactString;
    }

    contactForename.value = contactForenameValue;
    contactSurname.value = contactSurnameValue;
}

function capitaliseFirstLetter(val) {
    return String(val).charAt(0).toUpperCase() + String(val).slice(1);
}

function capitaliseFirstLetterOfEachWord(val) {
    return String(val).split(' ').map(word => word.charAt(0).toUpperCase() + word.slice(1)).join(' ');
}

function capitaliseAfterHyphen(val) {
    return String(val).split('-').map(word => word.charAt(0).toUpperCase() + word.slice(1)).join('-');
}

function capitaliseAfterSpaceOrHypen(val) {
    return String(val).split(/([-\s])/).map(word => word.charAt(0).toUpperCase() + word.slice(1)).join('');
}

function capitaliseAfterSpaceOrHypenAndRemoveHyphen(val) {
    return String(val).split(/[-\s]/).map(word => word.charAt(0).toUpperCase() + word.slice(1)).join(' ');
}

function trimString(val) {
    return String(val).trim();
}

function isDate(val) {
    //Check if value is a date in the format dd/MM/yyyy
    let datePattern = /^(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/(\d{4})$/;

    if (datePattern.test(val)) {
        return val;
    }
    else {
        return null;
    }
}

function isDateYMD(val) {
    //Check if value is a date in the format yyyy-MM-dd
    let datePattern = /^(\d{4})-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/;

    if (datePattern.test(val)) {
        return val;
    }
    else {
        ageField = document.getElementById(`AgeInfo`);

        if (ageField !== null) {
            ageField.innerHTML = ``;
        }

        return null;
    }
}