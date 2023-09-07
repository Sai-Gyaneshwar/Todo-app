<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Page</title>
    <style>
        .form_container {
            margin-top: 20px;
            width: 400px;
            height: 600px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 15px;
            padding: 50px 40px 20px 40px;
            background-color: #ffffff;
            box-shadow: 0px 106px 42px rgba(0, 0, 0, 0.01),
        0px 7px 15px rgba(0, 0, 0, 0.1);
            border-radius: 11px;
            font-family: "Inter", sans-serif;
        }
          .title_container {
		    display: flex;
		    flex-direction: column;
		    align-items: left;
		    justify-content: left;
		    gap: 10px;
		    }
		
		    .title {
		    margin: 0;
		    font-size: 1.25rem;
		    font-weight: 700;
		    color: #212121;
		    }
		
		
		    .input_container {
		    width: 100%;
		    height: fit-content;
		    position: relative;
		    display: flex;
		    flex-direction: column;
		    text-align: left;
		    gap: 5px;
		    }
		
		
		    .input_label {
		    font-size: 0.75rem;
		    color: #8B8E98;
		    font-weight: 600;
		    margin-left: 10px;
		    margin-bottom: 5px;
		    }
		    .input_label_r{
		    font-size: 0.75rem;
		    color: #6b8dff;
		    font-weight: 600;
		    text-align: right;
		    margin-bottom: 5px;
		    }
		
		    .input_field {
		    width: auto;
		    height: 40px;
		    padding: 0 0 0 20px;
		    border-radius: 7px;
		    outline: none;
		    border: 1px solid #e5e5e5;
		    }
		
		    .input_field:focus {
		    border: 1px solid transparent;
		    box-shadow: 0px 0px 0px 2px #242424;
		    background-color: transparent;
		    }
		
		    .sign-in_btn {
		    width: 100%;
		    height: 40px;
		    border: 0;
		    background: #115DFC;
		    border-radius: 7px;
		    outline: none;
		    color: #ffffff;
		    cursor: pointer;
		    }
		
		    .second{
		    width: 100%;
		    height: 40px;
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    gap: 10px;
		    background: #ffffff;
		    border-radius: 7px;
		    outline: none;
		    color: #242424;
		    border: 1px solid #e5e5e5;
		    cursor: pointer;
		    }
		
		
		    .separator {
		    width: 100%;
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    gap: 30px;
		    color: #8B8E98;
		    }
		
		    .separator .line {
		    display: block;
		    width: 100%;
		    height: 1px;
		    border: 0;
		    background-color: #e8e8e8;
		    }
		
		    .note {
		    font-size: 0.75rem;
		    color: #8B8E98;
		    text-decoration: underline;
		    }
    </style>
</head>
<body>

<!-- <form action="registration">
<label for="name">
Name </label>
<input type="text" name="name"/><br><br>
<label for="email">
Email </label>
<input type="email" name="email"/><br><br>
<label for="password">email
password </label>
<input type="password" name="password"/><br><br>
<label for="conpass">
conform password</label>
<input type="password" name="conpass"/><br><br>
<input type="submit" value="Submit"/><br><br>
</form> -->

    <div class="container">
        <center>
            <form class="form_container" action="registration">
                <div class="title_container">
                    <p class="title">Create a Account</p>
                </div>
                    <br>
                <div class="input_container">
                    <label class="input_label" for="name_field">Name</label>
                    <input placeholder="Jhon cena" title="Inpit title" name="name" type="text" class="input_field" id="email_field" required>
                </div>
                <div class="input_container">
                    <label class="input_label" for="email_field">Email</label>
                    <input placeholder="name@mail.com" title="Inpit title" name="email" type="email" class="input_field" id="email_field" required>
                </div>
                <div class="input_container">
                    <label class="input_label" for="password_field">Password</label>
                    <input placeholder="Password" title="Inpit title" name="password" type="password" class="input_field" id="password" required>
                </div>
                <div class="input_container">
                    <label class="input_label" for="password_field">Confirm Password</label>
                    <input placeholder="Confirm Password" title="Inpit title" name="conpass" type="password" class="input_field" id="confirmPassword" required>
                </div>
                <button title="Sign In" type="submit" onclick="Validate()" class="sign-in_btn">
                <span>Sign Up</span>
                </button>
            
                <div class="separator">
                    <hr class="line">
                    <span>Or</span>
                    <hr class="line">
                </div>
                <button title="Sign Up" onclick="window.location.href = 'login.jsp'" type="button" class="second">
                <span>Sign In</span>
                </button> 
                <!-- <p class="note">Terms of use &amp; Conditions</p> -->
            </form>
        </center>
    </div>
    <script type="text/javascript">
        function Validate() {
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            if (password != confirmPassword) {
                alert("Passwords do not match.");
                return false;
            }
            return true;
        }
    </script>

</body>
</html>