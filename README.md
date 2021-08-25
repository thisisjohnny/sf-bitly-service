# Bit.ly URL Shortening Service Apex Action

[Bit.ly](https://bit.ly) is a common URL shortening service to take your long, difficult to share URLs and make them easier to use. This package includes resources to provide Salesforce admins with an invokable Apex action inside of Flow to generate one or more shortened URLs via the Bit.ly API for use within the originating flow.

## What To Do

1. Install this package using the link below
2. Add one or more users to the included Permission Set. This will grant access to the Apex classes and custom metadata type necessary for using this action
3. Create a record in the Bitly API Token custom metadata type with your Bit.ly Access Token. In Salesforce, Setup -> Custom Metadata Types -> Manage Records -> New
4. In Flow Builder, create your flow and include the Bitly Shortener Service Apex action. Pass a collection variable of type Text to the Long URLs input value, and under Advanced check the box to Manually assign variables, and create a new collection variable resource of type Text for storing your shortened URLs.

## Deploy to Your Org

### Disclaimer

**This package is provided without warranty.**
This software has not been fully tested nor developed with strict security and access controls in mind. It makes http callouts to the public internet. By installing this package in your org, you assume all risk of consequences and agree not to hold myself or my employer liable.

To deploy this package to you Salesforce environment, use the [Salesforce DX Public Deployer](https://hosted-scratch.herokuapp.com/byoo?template=https://github.com/thisisjohnny/sf-bitly-service) and choose the option best for you.

----
_Made with_ ❤️&☕️ _in Reston_