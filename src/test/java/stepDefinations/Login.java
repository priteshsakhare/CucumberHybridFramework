package stepDefinations;


import io.cucumber.java.en.*;
import org.junit.Assert;

import org.openqa.selenium.WebDriver;

import factory.DriverFactory;

import pages.HomePage;
import pages.LoginPage;
import utils.CommonUtils;
import pages.AccountPage;
public class Login {

	WebDriver driver ;
	private LoginPage loginPage;
	private AccountPage accountPage ;
	private CommonUtils commonUtils;

	@Given("User navigates to login page")
	public void user_navigates_to_login_page() {
	   
		driver = DriverFactory.getDriver();
		HomePage homepage = new HomePage(driver);
		homepage.clickOnMyAccount();
		loginPage = homepage.selectLoginOption();


	}

	@When("^User enteres valid email address (.+) into email field$")
	public void user_enteres_valid_email_address_into_email_field(String emailText) {
		
		loginPage.enterEmailAddress(emailText);



	}

	@And("^User enteres valid password (.+) into password field$")
	public void user_enteres_valid_password_into_password_field(String passwordText) {
		loginPage.enterPassword(passwordText);
	}



	@And("User clicks on Login button")
	public void user_clicks_on_login_button() {

		accountPage = loginPage.clickOnLoginButton();

	}

	@Then("User should get successfully logged in")
	public void user_should_get_successfully_logged_in() {
		
		Assert.assertTrue(accountPage.displaceStatusOdEditYourAccountInformationOption());
	}

	@When("User enteres invalid email address into email field")
	public void user_enteres_invalid_email_address_into_email_field() {
		 commonUtils = new CommonUtils();
		loginPage.enterEmailAddress(commonUtils.getEmailWithTimeStamp());
		
	}

	@When("User enteres invalid password {string} into password field")
	public void user_enteres_invalid_password_into_password_field(String invalidPasswordText) {
		
		loginPage.enterPassword(invalidPasswordText);
		
	}

	@Then("User should get a proper warning message about credentials mismatch")
	public void user_should_get_a_proper_warning_message_about_credentials_mismatch() {
		Assert.assertTrue(loginPage.getWarningMessageText().contains("Warning: No match for E-Mail Address and/or Password."));
	}

	@When("User dont enter email address into email field")
	public void user_dont_enter_email_address_into_email_field() {

		loginPage.enterEmailAddress("");
		

	}

	@When("User dont enter password into password field")
	public void user_dont_enter_password_into_password_field() {

		loginPage.enterPassword("");
		


	}	


	

}
