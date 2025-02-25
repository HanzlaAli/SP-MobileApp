// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../Widgets/MyAppBar.dart';
import '../../helper/Constants/MySpaces.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Privacy Policy',
        isDrawer: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Column(
                  children: const [
                    Text(
                      'Privacy Policy',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Last modified: 31 March 2023',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  introduction(),
                  const SizedBox(height: 16),
                  defenations(),
                  const SizedBox(height: 16),
                  ageLimitations(),
                  const SizedBox(height: 16),
                  privacyPolicyApplies(),
                  verticalSpacing16,
                  informationCollect(),
                  verticalSpacing16,
                  howAndWhyUseYourInfo(),
                  verticalSpacing16,
                  interactionBtYouAndHealthCareProvider(),
                  verticalSpacing16,
                  DisclosureYourInfo(),
                  verticalSpacing16,
                  yourChoiceOurCollection_Use_DisclosureInfo(),
                  verticalSpacing16,
                  Acessing_CorrectingYourPersonelInfo(),
                  verticalSpacing16,
                  mendedSolutionsKeepYourDataSecure(),
                  verticalSpacing16,
                  mendedSolutionsDoesNotSellUserData(),
                  verticalSpacing16,
                  requesting_DeletingUserData(),
                  verticalSpacing16,
                  yourCaliforniaPrivacyRights(),
                  verticalSpacing16,
                  RemainingCompletelyAnonymousNotPossible(),
                  verticalSpacing16,
                  dataSecurity(),
                  verticalSpacing16,
                  changesToOurPrivacyPolicy(),
                  verticalSpacing16,
                  contactInformation(),
                  verticalSpacing16,
                  optOutPage(),
                  verticalSpacing16,
                  verticalSpacing16,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget introduction() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Headings(text: 'Introduction:'),
        verticalSpacing10,
        Paragraph(
          text:
              'Mended Solutions (“Mended Solutions”, the Company“, "Our," or “We”) respects your privacy and is committed to protecting it through our compliance with this policy. This policy is intended to help you understand what data we collect, how we use it, and your rights related to it. The purpose of this Policy is to explain the technical aspects of data Processing in a simple and clear way. Please feel free to email info@Mended Solutions.com if you have any questions about this Policy, or any suggestions for us to improve it.',
        ),
        verticalSpacing5,
        Paragraph(text: 'This policy describes the following:'),
        verticalSpacing5,
        UnorderList(
            'The types of information we may collect or that you may provide when you purchase, download, install, register with, access, or use the Mended Solutions Platform, including our Website and Application (the “Platform”).'),
        verticalSpacing5,
        UnorderList(
            'Our practices for collecting, using, maintaining, protecting, and disclosing that information.'),
        verticalSpacing5,
        Paragraph(
            text:
                'This policy applies only to information we collect on this Platform, including our Website, Mended Solutions.com, our Mobile Application, in email, text, and other electronic communications sent through or in connection with this Platform.'),
        verticalSpacing5,
        Paragraph(text: 'This policy DOES NOT apply to information that:'),
        verticalSpacing5,
        UnorderList(
            'We collect offline or on any websites you may access through this Platform.'),
        verticalSpacing5,
        UnorderList(
            'You provide to or is collected by any third party (see Third-Party Information Collection).'),
        verticalSpacing5,
        Paragraph(
            text:
                'These other third parties may have their own privacy policies, which we encourage you to read before providing information on or through them.Please read this policy carefully to understand our policies and practices regarding your information and how we will treat it. If you do not agree with our policies and practices, do not download, register with, or use this Platform. By downloading, registering with, or using this Platform, you agree to this privacy policy. This policy may change from time to time (see Changes to Our Privacy Policy). Your continued use of this Platform after we revise this policy means you accept those changes, so please check the policy periodically for updates.'),
      ],
    );
  }

  Widget defenations() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Headings(text: 'Definitions'),
        verticalSpacing10,
        Paragraph(
            text:
                '“Data” for purposes of this policy and unless otherwise specified, includes data that is linked to one person or household including things like name, email address, phone numbers, device ID, third-party identifiers, contact information, communications with Healthcare Providers using our Platform to provide Healthcare Services, and IP address. Some jurisdictions might consider this to be “personal data,” “personally identifiable information,” or “sensitive personal data” incertain circumstances.'),
        verticalSpacing5,
        Paragraph(
            text:
                '“Process(ing)” refers to activities done with data, including, without limitation, manipulating, changing, wrangling, storing, reading, and writing data.'),
        verticalSpacing5,
        Paragraph(
            text:
                '“Service Provider(s)” refers to a person or company that we have a legal agreement with to process data collected by us or on our behalf. Data that is processed on our behalf is required to be done only at our direction; no other person or company can authorize it. Our Service Providers are not permitted to disclose data that is individually identifiable to any other person or company, other than to us or the Service Providers’ own subcontractors (provided that they’re bound to dataprocessing terms that are no less restrictive than the terms the Service Provider is bound by). The data obtained by Service Providers from their relationship with us must only be used for performing the services specified in our agreement with them,or as reasonably necessary to perform one or more of the following:'),
        verticalSpacing5,
        UnorderList(
            'comply with applicable law, regulation, or legal process;'),
        verticalSpacing5,
        UnorderList(
            'detect, prevent or mitigate fraud or security vulnerabilities;'),
        verticalSpacing5,
        UnorderList(
            'debug to identify and repair errors impairing existing intended functionalities;'),
        verticalSpacing5,
        UnorderList(
            'conduct internal research for technological development and demonstration of our products or services, if such use is reasonably necessary and proportionate to achieve the purpose for which the data was shared.'),
        verticalSpacing5,
        Paragraph(
            text:
                '“Third Party” refers an entity that is not a Service Provider, not a Healthcare Provider, or any other parties that are not defined in this Policy or our Terms of Use.'),
      ],
    );
  }

  Widget privacyPolicyApplies() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'TO WHOM DOES THIS PRIVACY POLICY APPLY?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'This Policy applies to any visitors to the public portions of our Platform, including our websites and apps, users of the paid portions of our Platform, and independent contractor Healthcare Providers who are using the Platform to deliver Healthcare Services.\n\n'
            'This policy does not apply to the collection and use of information for employees or independent contractors (not including Healthcare Providers) of Mended Solutions. If you’re a current or former Mended Solutions job applicant, employee, owner, director, officer, or independent contractor other than a Healthcare Provider, please contact us at info@Mended Solutions.com for the appropriate notice governing those portions of the Platform.',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          ),
        ],
      );

  Widget ageLimitations() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(
            text:
                'CHILDREN UNDER THE AGE OF 18 ARE NOT ALLOWED TO USE THE PLATFORM WITHOUT PARENTAL CONSENT',
          ),
          verticalSpacing10,
          Paragraph(
              text:
                  'The Platform is not intended for children under 18 years of age, and we do not knowingly collect personal information from children under 18. If we learn we have collected or received personal information from a child under 18 without verificationof parental consent, we will delete that information. If you believe we might have any information from or about a child under 18, please contact us at info@Mended Solutions.com.'),
          verticalSpacing5,
          Paragraph(
              text:
                  'We don’t knowingly collect or solicit any data or information from anyone under the age of 18 or knowingly allow such persons to become our users. The Platform is not directed at and not intended to be used by children under the age of 18. If you’re aware that we have collected personal information from a child under age 18 please let us know by contacting us, and we’ll delete that information.'),
          verticalSpacing5,
          Paragraph(
              text:
                  'California residents under 16 years of age may have additional rights regarding the collection and sale of their personal information. Please see Your California Privacy Rights for more information.'),
        ],
      );

  Widget informationCollect() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "INFORMATION WE COLLECT AND HOW WE COLLECT IT"),
          verticalSpacing10,
          Paragraph(
              text:
                  "We collect information from and about users of our Platform:"),
          verticalSpacing10,
          UnorderList("Directly from you when you provide it to us."),
          // verticalSpacing5,
          UnorderList("Automatically when you use the Platform"),
          verticalSpacing10,
          Paragraph(
              text:
                  "What data we process depends on how you're using the Platform. Below, we explain the specific data we process. In the next section, we explain how and why we process this data"),
          verticalSpacing10,
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "“Visitor data”",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      ": When you visit the website, app, or Platform, we Process information like the particular pages visited or which features you interacted with, the amount of time on the website or app, site/app/Platform errors, information about the type of device and browser you’re using, and IP address. We may Process your Third-Party identifier or advertising ID (if available based on the settings of your device) and will share it if you opt-in.",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          verticalSpacing10,
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "“Account Registration Data”",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      ": Once a user registers with the Platform, we Process data such as the account name the user selects, the email that they use, their age, phone number, emergency contact details, and whether a user verifies their email address. We also assign each user (including Providers) who creates anaccount a sequentially-generated user ID.",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          verticalSpacing10,
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "“Checkout Flow Data”",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      ": We Process data about whether a user registers for the Platform or pays for access to the Platform services.",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          verticalSpacing10,
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "“Customer Service Communications Data”",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      ": We Process communications users have with our customer service team.",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          verticalSpacing10,
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "“Healthcare Communications Data”",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      ": We Process communications and related information users share with their Provider to facilitate the healthcare. This includes messages with Providers, worksheets, attendance, and journal entries.",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          verticalSpacing10,
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "“Healthcare Quality Data”",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      ": We Process client feedback about their Provider,ratings and reviews of their Provider, actions regarding switching Provider or quitting Healthcare, and the reason selected by the client. We Process Provider session availability, session cancellations and no-shows.",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          verticalSpacing10,
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "“Member Engagement Data”",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      ": We Process data for logging into the Platform andactivity conducted during that log in such as when a user logs in, the timing, number and length of messages received or sent through the Platform, the timing, number and duration of live session scheduled or conducted, the number and timingof use of other features such as worksheets, journals and goals. This category doesnot include Healthcare Communications Data like the content of any messages sentor received by users, the content of any live sessions, or the content of journal entries, worksheets, or goals.",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          verticalSpacing10,
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "“Onboarding data”",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      ":: When an account is created with the Platform, the user fillsout a questionnaire. We Process the information used to complete this questionnaire. Some of this information may include identifiers like email address, phone number, chosen name (first name or nickname), and physical address",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          verticalSpacing10,
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "“Provider Data”",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      ": In order to follow up with you on the status of your application,to identify, match, credential, re-credential, run checks, issue 1099s and payProviders, we Process Provider information such as the Provider's name, bank account information, gender, date of birth, governmental identification numbers(SSN/FEIN), e-mail address, phone number, address, NPI number (if applicable),license information, CAQH number (if applicable), and areas of interest/expertise, education, and job history. Providers may also separately and outside of this policy, consent to using facial scans to assist logging them in and verifying their identity.",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          verticalSpacing10,
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "“Provider Engagement Data”",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      ": We Process data about Provider logins to thePlatform, the number of live sessions conducted by a Provider, number of messagesand words exchanged by a Provider, number of worksheets shared by a Provider,and number of journal entries shared with a Provider",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          verticalSpacing10,
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "“Transaction Data”",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      ": We Process data about payment transactions on the Platformsuch as whether a user completed payment for our services, signed up for servicesusing a trial offer, canceled or ended a trial, received a discount or financial aid, orreceived any extensions or refunds.",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          verticalSpacing12,
          Headings(
            text: "Information You Provide to Us",
            italic: true,
            fontsize: 16,
          ),
          verticalSpacing12,
          Paragraph(
              text:
                  "When you download, register with, or use this Platform, we may ask you provide information:"),
          verticalSpacing10,
          UnorderList(
              "• By which you may be personally identified, such as name, postal address, email address, telephone number, social security number, or any other identifier by which you may be contacted online or offline (“Personal Information”)."),
          UnorderList(
              "That is about you but individually does not identify you"),
          Paragraph(
            text: "This information includes:",
            fontsize: 12,
            italic: true,
          ),
          UnorderList(
              "Information that you provide by filling in forms in the Platform. This includes information provided at the time of registering to use the Platform, subscribing to any Services offered on the Platform , and posting material , and requesting further Services. We may also ask you for information when you enter a contestor promotion sponsored by us, and when you report a problem with the Platform."),
          UnorderList(
              "Records and copies of your correspondence (including email addresses and phone numbers), if you contact us"),
          UnorderList(
              "Your responses to surveys that we might ask you to complete for research purposes."),
          UnorderList(
              "Details of transactions you carry out through the Platform and of the fulfillment of your orders. You may be required to provide financial information before placing an order through the Platform."),
          UnorderList("Your search queries on the Platform."),
          verticalSpacing5,
          Paragraph(
              text:
                  "You may also provide information for publication or display (“Posted”) on public areas of the Platform or websites you access through the Platform (collectively, “User Contributions”). Your User Contributions are Posted and transmitted to others at your own risk. Although you may set certain privacy settings for such information by logging into your account profile, please be aware that no security measures are perfect or impenetrable. Additionally, we cannot control the actions of third parties with whom you may choose to share your User Contributions.\nTherefore, we cannot and do not guarantee that your User Contributions will not be viewed by unauthorized persons."),
          verticalSpacing12,
          Headings(
            text: "Automatic Information Collection and Tracking",
            italic: true,
            fontsize: 16,
          ),

          verticalSpacing10,
          Paragraph(
              text:
                  "When you download, access, and use the Platform, it may use technology to automatically collect:"),
          verticalSpacing10,
          UnorderList(
              "\"Usage Details\". When you access and use the Platform, we may automatically collect certain details of your access to and use of the Platform, including traffic data, location data, logs, and other communication data and the resources that you access and use on or through the Platform."),
          UnorderList(
              "\"Device Information\". We may collect information about your mobile deviceand internet connection, including the device’s unique device identifier, IPaddress, operating system, browser type, mobile network information, and the device’s telephone number."),
          UnorderList(
              "\"Stored Information and Files\". The Platform also may access metadata and other information associated with other files stored on your device. This may include, for example, photographs, audio and video clips, personal contacts, and address book information."),
          UnorderList(
              "\"Location Information\". This Platform collects real-time information about the location of your device"),
          verticalSpacing10,
          Paragraph(
              text:
                  "If you do not want us to collect this information do not download the Platform or delete it from your device."),
          verticalSpacing10,
          Paragraph(
              text:
                  "We also may use these technologies to collect information about your activities over time and across third-party websites, apps, or other online services (behavioral tracking)."),
          verticalSpacing10,
          Headings(
            text: "Information Collection and Tracking Technologies",
            italic: true,
            fontsize: 16,
          ),
          verticalSpacing10,
          Paragraph(
              text:
                  "The technologies we use for automatic information collection may include:"),
          verticalSpacing10,
          UnorderList(
              "\"Cookies (or mobile cookies)\". A cookie is a small file placed on your smartphone. It may be possible to refuse to accept mobile cookies by activating the appropriate setting on your smartphone. However, if you select this setting you may be unable to access certain parts of our Platform."),
          verticalSpacing10,
          UnorderList(
              "\"Web Beacons\". Pages of the Platform and our emails may contain small electronic files known as web beacons (also referred to as clear gifs, pixel tags,and single-pixel gifs) that permit Mended Solutions, for example, to count users who have visited those pages or opened an email and for other related Platform statistics (for example, recording the popularity of certain Platform content and verifying system and server integrity)."),
          verticalSpacing10,
          Headings(
            text: "Third-Party Information Collection",
            italic: true,
            fontsize: 16,
          ),
          verticalSpacing10,
          Paragraph(
              text:
                  "When you use the Platform or its content, certain third parties may use automatic information collection technologies to collect information about you or your device. These third parties may include:"),
          verticalSpacing10,
          UnorderList("Advertisers, ad networks, and ad servers"),
          UnorderList("Analytics companies."),
          UnorderList("Your device manufacturer."),
          UnorderList("Your service provider"),
          UnorderList("Your internet service provider."),
          verticalSpacing10,
          Paragraph(
              text:
                  "These third parties may use tracking technologies to collect information about you when you use this Platform. The information they collect may be associated with your personal information or they may collect information, including personal information, about your online activities over time and across different websites, apps, and other online services websites. They may use this information to provide you with interest-based (behavioral) advertising or other targeted content."),
          verticalSpacing10,
          Paragraph(
              text:
                  "We do not control these third parties’ tracking technologies or how they may beused. If you have any questions about an advertisement or other targeted content,you should contact the responsible provider directly."),
        ],
      );

  howAndWhyUseYourInfo() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "HOW AND WHY WE USE YOUR INFORMATION"),
          verticalSpacing12,
          Paragraph(
              text:
                  "We use information that we collect about you or that you provide to us, including any personal information, to:"),
          verticalSpacing10,
          UnorderList(
              "To fulfill or meet the reason you provided the information. For example, if you share your name and contact information to request a price quote or ask a question about our products or services, we will use that personal information to respond to your inquiry. If you provide your personal information to purchase a product or service, we will use that information to process your payment and facilitate delivery. We may also save your information to facilitate new product orders or process returns."),
          UnorderList(
              "Provide you with the Platform and its contents, and any other information, products or services that you request from us."),
          UnorderList("Fulfill any other purpose for which you provide it."),
          UnorderList(
              "To provide, support, personalize, and develop our Platform, Website, Apps,products, and services."),
          UnorderList(
              "To create, maintain, customize, and secure your account with us."),
          UnorderList(
              "To process your requests, purchases, transactions, and payments and prevent transactional fraud."),
          UnorderList(
              "Give you notices about your account, including expiration and renewal notices."),
          UnorderList(
              "Carry out our obligations and enforce our rights arising from any contracts entered into between you and us, including for billing and collection."),
          UnorderList(
              "Notify you when Platform updates are available, and of changes to any products or services we offer or provide though it"),
          UnorderList(
              "To provide you with support and to respond to your inquiries, including to investigate and address your concerns and monitor and improve our responses."),
          UnorderList(
              "Operate the Platform and make sure you’re able to use our Services effectively."),
          UnorderList("To send you periodic emails or text messages."),
          UnorderList(
              "To connect you with Providers Offering Healthcare Services. To connect you with Healthcare Services and Providers on our Platform, we need to be able to facilitate information sharing between you and your Provider so that you can get the help you need from them. We also Process data like your provider preferences, your state (if applicable), and your country to determine what provider to suggest to you based on applicable licensing requirements."),
          UnorderList(
              "To communicate with you, verify your identity and secure your account. For example, we need to make sure that if you ask a question or have a concern about the Platform, we’re able to respond to you and provide an answer."),
          UnorderList(
              "To monitor and improve the quality of Healthcare Services offered by Providers.\nFor example, we track if a live session occurred, was canceled or if the Provider did not show up, to ensure that timely services are being delivered to you. We also track ratings, reviews, complaints and other client feedback to ensure the quality of providers on our Platform. If you consent, a licensed Provider who is employed by Mended Solutions may review correspondence with your Provider for quality assurance purposes. For example, if you raise a concern about your Provider, or we have concerns about a specific Provider’s clinical care."),
          UnorderList(
              "To monitor Platform usage for product improvements. For example, we may track regular usage of certain pages, buttons, or features on the Platform in order to allocate our research and development resources appropriately. In addition, if you opt-in to “performance cookies,” we may process some data to track site visits across our sister sites. This is known as “first-party cross domain tracking.”"),
          UnorderList(
              "To personalize your web or app experience and to deliver content and product and service offerings relevant to your interests, including targeted offers and ads through our Platform, third-party sites, and via email or text message (with your consent, where required by law). For example, if you identify as a religious person and would prefer a Provider who utilizes faith-based practices, we Process that information to allow us to match you with an appropriate Provider that can meet these needs. Another example is if you state that you would like help with anxiety, we may recommend content and features that would be helpful to you, such as anxiety-related group sessions. "),
          UnorderList(
              "For testing, research, analysis, and product development, including to develop and improve our Website, products, and services."),
          UnorderList(
              "To help us understand how you use our service and improve it. For example, we might assess the usage of various features and decide to invest more resources in features that are popular or decide to remove features that aren’t providing value to our members. We might also ask you for feedback about how we can improve our Platform or what you like or don’t like about the Provider that is matched to you."),
          UnorderList(
              "To offer you new features and make the services more convenient for you. For example, we may use some of your data to determine which products and features to roll out to you. We may also Process data to know when you have already seen a “pop-up” on the Platform and do not need to be shown it anymore. Another example of this is when we use your IP address to help conveniently auto-populate your state (if applicable) and country, or assist you with providing your address when completing information about your emergency contact."),
          UnorderList(
              "To comply with laws and to respond to law enforcement requests and as required by applicable law, court order, or governmental regulations. For example, a court might subpoena information from us where we would be required to share certain information requested in the subpoena. This is not unique to Mended Solutions and is applicable to in-person Healthcare Services as well. Keep in mind that, as a general rule, we defer to your chosen Provider to decide to produce (or not produce) any notes or messages you have had with them. Many jurisdictions have strict rules governing Healthcare Provider/client relationships and the confidentiality requirements associated with that. We encourage you to discuss with your Provider early on if you have concerns about their disclosure obligations."),
          UnorderList(
              "To protect your safety and the safety of others. For example, if we have reason to believe that you or any other person may be in immediate danger or your privacy infringed upon, we may use the information to investigate or reach out to you or the appropriate authorities if it is legally appropriate/permitted to do so."),
          UnorderList(
              "To help maintain the safety, security, and integrity of our Platform, website, app, products, and services, databases, and other technology assets, and business. For example, we may process some of your data when issuing security patches and bug fixes in order to address security risks. We may also process your data to track potential abuse on the platform, prevent and detect security incidents, protect against malicious, deceptive, fraudulent, or illegal activity, or prosecute those responsible for such activities."),
          UnorderList(
              " To send you opportunities, promotions, news, updates and reminders about our services and your account. For example, we might email you to offer you special promotions or discounts. We might also email you to provide you with health or therapy related news or content that you might find interesting. You can opt out of receiving texts or marketing communications at any time."),
          UnorderList(
              "If you opt in to targeting cookies and web beacons, we Process some data for advertising purposes."),
          UnorderList(
              "Occasionally, your data may be handled by a select number of employees who are part of Mended Solutions for support services. These employees are under strict duties of confidentiality. For example, a paralegal at Mended Solutions may receive subpoenas or legal correspondence on behalf of members or former members (sometimes others too) and make sure they are provided to Mended Solutions’s Legal team to address."),
          UnorderList(
              "As described to you when collecting your personal information or as otherwise set forth in the CCPA"),
          UnorderList(
              "To evaluate or conduct a merger, divestiture, restructuring, reorganization, dissolution, or other sale or transfer of some or all of our assets, whether as a going concern or as part of bankruptcy, liquidation, or similar proceeding, in which personal information held by us about our Platform users is among the assets transferred."),
          Headings(
            text:
                "If you are a Health Care Provider on our Platform, in addition to the above, we may Process some data to:",
            fontsize: 16,
          ),
          UnorderList(
              "Send you email, calls, or text message (SMS) reminders, notifications, and updates about your application, profile or account."),
          UnorderList(
              "Verify your identity, check your credentials, and background, and secure your account."),
          UnorderList(
              "Assist in the provider recruitment process and onboard you to the Platform."),
          UnorderList(
              "Run, maintain, and operate our Platform, match clients to you based on your preferences, and facilitate the communication between you and your clients."),
          UnorderList(
              "Run background checks and other screening required for credentialing and recredentialing purposes."),
          UnorderList("To pay you and comply with all relevant tax laws."),
          UnorderList(
              "Provide you quality statistics, feedback from our Mended Solutions team, and feedback from clients"),
          UnorderList(
              "Offer you information about new features, opportunities, perks and other incentives."),
          UnorderList(
              "Promote your profile on Mended Solutions and with Third-Party websites and directories to get you more clients (to opt-out email info@Mended Solutions.com)"),
          UnorderList(
              "To comply with applicable all laws, rules and regulations."),
          verticalSpacing10,
          Paragraph(
            text:
                "Here's some more information about the purposes for which we share your data:",
            italic: true,
          ),
          verticalSpacing10,
          UnorderList(
            "We may share certain data with Service Providers that provide limited services that help us operate the Platform, including, but not limited to, the following:",
          ),
          UnorderListSubItem(
              "Customer Service Providers. For example, we use a tool that helps keep track of requests and questions from our members, visitors, and Providers in a secure way."),
          UnorderListSubItem(
              "Professional Advisors and Attorneys. To assist with business matters."),
          UnorderListSubItem(
              "Web Hosting, Data hosting, and Storage Providers.** For example, cloud hosting providers such as Amazon Web Services, Azure, or GCP."),
          UnorderListSubItem(
              "Technology Service Providers. For example, we sometimes integrate tools into our Platform which give our Platform more functionality, like technology that helps us host group meetings."),
          UnorderListSubItem(
              "Email and Communication Service Providers. For example, we may use a tool that makes reaching out to you easier for us and more convenient for you."),
          UnorderListSubItem(
              "Billing and Payment Processing Service Providers. For example, we use Stripe to help process payments in a secure way. Stripe also assists us in paying healthcare providers and issuing tax documents to them. For this purpose, we may share email addresses of providers with Stripe and other data that is needed to pay Providers such as a provider’s name and tax ID."),
          UnorderListSubItem(
              "Reporting and Analytics Service Providers. For example, we might use a service to help us keep track of which pages and features are most used on our site."),
          UnorderList(
              "We may share some of your data with Service Providers to ensure the safety and security of the Platform and that of our users."),
          UnorderList(
              "We may share some of your data in connection with an asset sale, merger or bankruptcy."),
          UnorderList(
              "We also use a few APIs and SDKs to improve your experience. The location you share while these tools are running may be read, accessed, and collected by that site in accordance with their Privacy Policy."),
          verticalSpacing10,
          Paragraph(
              text:
                  "Note that if you make any information publicly available on the Platform, such as with a public post, anyone may see and use such information"),
          verticalSpacing12,
          Paragraph(
              text:
                  "The usage information we collect helps us to improve our Platform and to deliver a better and more personalized experience by enabling us to: "),
          verticalSpacing10,
          UnorderList("Estimate our audience size and usage patterns"),
          UnorderList(
              "Store information about your preferences, allowing us to customize our Platform according to your individual interests."),
          UnorderList("Speed up your searches."),
          UnorderList("Recognize you when you use the Platform."),
          verticalSpacing10,
          Paragraph(
              text:
                  "We use location information we collect to operate the Platform, including, without limitation, matching you with Providers in specific areas."),
          verticalSpacing10,
          Paragraph(
              text:
                  "We may also use your information to contact you about our own and third parties'goods and services that may be of interest to you. If you do not want us to use your information in this way, please email us at info@Mended Solutions.com to opt-out. For more information, see Your Choices About Our Collection, Use, and Disclosure of Your Information."),
          verticalSpacing10,
          Paragraph(
              text:
                  "We may use the information we collect to display advertisements to our advertisers' target audiences. Even though we do not disclose your personal information for these purposes without your consent, if you click on or otherwise interact with an advertisement, the advertiser may assume that you meet its target criteria."),
        ],
      );

  Widget interactionBtYouAndHealthCareProvider() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(
              text: "INTERACTIONS BETWEEN YOU AND YOUR HEALTHCARE PROVIDER."),
          verticalSpacing12,
          Paragraph(
              text:
                  "You and your Healthcare Provider are able to see the messages you exchange, the worksheets you submit, and the journal entries you submit (if you opt in to sharing journal entries)."),
          verticalSpacing10,
          Paragraph(
              text:
                  "If you consent, a licensed Provider who is employed by Mended Solutions may review correspondence with your Provider for quality assurance purposes. For example, if you raise a concern about your Provider, or we have concerns about a specific Provider’s clinical care."),
          verticalSpacing10,
          Paragraph(
              text:
                  "In addition, our internal Legal or Trust and Safety teams may review correspondence for specific accounts if we have a reason to believe that there is a security, legal, fraud or abuse issue occurring on that specific account."),
          verticalSpacing10,
          Paragraph(
              text:
                  "Messages with your Provider are not shared with any Third Party, and your live sessions are not recorded. We also do not share when you send a message, or have a session with your Provider, with any Third Party."),
          verticalSpacing10,
          Paragraph(
              text:
                  "All message exchanged between you and your Provider are encrypted."),
        ],
      );

  Widget DisclosureYourInfo() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "DISCLOSURE OF YOUR INFORMATION."),
          verticalSpacing12,
          Paragraph(
              text:
                  "We may disclose aggregated information about our users, and information that does not identify any individual or device, without restriction."),
          verticalSpacing10,
          Paragraph(
              text:
                  "In addition, we may disclose personal information that we collect or you provide:"),
          verticalSpacing10,
          UnorderList("To our subsidiaries and affiliates."),
          UnorderList(
              "To contractors, service providers, and other third parties we use to support our business and who are bound by contractual obligations to keep personal information confidential and use it only for the purposes for which we disclose it to them"),
          UnorderList(
              "To a buyer or other successor in the event of a merger, divestiture, restructuring, reorganization, dissolution, or other sale or transfer of some or all of Mended Solutions’s assets, whether as a going concern or as part of bankruptcy, liquidation, or similar proceeding, in which personal information held by Mended Solutions about our Platform users is among the assets transferred."),
          UnorderList(
              "To third parties to market their products or services to you if you have not opted out of these disclosures"),
          UnorderList(
              "To fulfill the purpose for which you provide it. For example, if you give us an email address to use the “email a friend” feature of our Website or Platform, we will transmit the contents of that email and your email address to the recipients."),
          UnorderList(
              "For any other purpose disclosed by us when you provide the information."),
          UnorderList("With your consent."),
          UnorderList(
              "To comply with any court order, law, or legal process, including to respond to any government or regulatory request."),
          UnorderList(
              "To enforce our rights arising from any contracts entered into between you and us, including the Platform Terms of Use, and for billing and collection."),
          UnorderList(
              "If we believe disclosure is necessary or appropriate to protect the rights, property, or safety of Mended Solutions, our customers or others. This includes exchanging information with other companies and organizations for the purposes of fraud protection and credit risk reduction."),
        ],
      );

  Widget yourChoiceOurCollection_Use_DisclosureInfo() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(
              text:
                  "YOUR CHOICES ABOUT OUR COLLECTION, USE, AND DISCLOSURE OF YOUR INFORMATION"),
          verticalSpacing12,
          Paragraph(
              text:
                  "We strive to provide you with choices regarding the personal information you provide to us. This section describes mechanisms we provide for you to control certain uses and disclosures of over your information."),
          verticalSpacing10,
          UnorderList(
              "\"Tracking Technologies.\". You can set your browser to refuse all or some browser cookies, or to alert you when cookies are being sent. If you disable or refuse cookies or block the use of other tracking technologies, some parts of the Platform may then be inaccessible or not function properly."),
          UnorderListSubItem(
              "If you opt-in to “performance cookies”, we may use Third-Party analytics cookies from trusted partners to Process data for activities including but not limited to analyzing traffic sources, visits, and site interactions. This analysis helps us to improve our products and services. "),
          UnorderListSubItem(
              "If you opt-in to “targeting cookies” and web beacons, information regarding your activity on our websites, excluding activity when you’re logged in and have started therapy, may be shared for advertising purposes."),
          UnorderList(
              "\"Location Information.\"You can choose whether to allow the Platform to collect and use real-time information about your device’s location through the device’s privacy settings. If you block the use of location information, some parts of the Platform may become inaccessible or not function properly"),
          UnorderList(
              "\"Promotion by Mended Solutions.\" If you do not want us to use your email address to promote our own or third parties’ products or services, you can opt-out by emailing us stating your request to info@Mended Solutions.com."),
          UnorderList(
              "\"Targeted Advertising by Mended Solutions.\" If you do not want us to use information that we collect or that you provide to us to deliver advertisements according to our advertisers’ target-audience preferences, you can opt-out by emailing us stating your request to info@Mended Solutions.com."),
          UnorderList(
              "\"Disclosure of Your Information for Third-Party Advertising and Marketing.\" If you do not want us to share your personal information with unaffiliated or non-agent third parties for advertising and marketing purposes, you can opt-out by emailing us stating your request to info@Mended Solutions.com."),
          verticalSpacing10,
          Paragraph(
              text:
                  "We do not control third parties’ collection or use of your information to serve interest-based advertising. However, these third parties may provide you with ways to choose not to have your information collected or used in this way. You can opt out of receiving targeted ads from members of the Network Advertising Initiative (“NAI”) on the NAI’s website"),
          verticalSpacing10,
          Paragraph(
              text:
                  "California residents may have additional personal information rights and choices. Please see Your California Privacy Rights for more information."),
          verticalSpacing12
        ],
      );

  Widget Acessing_CorrectingYourPersonelInfo() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "ACCESSING AND CORRECTING YOUR PERSONAL INFORMATION"),
          verticalSpacing12,
          Paragraph(
              text:
                  "You can review and change your personal information by logging into the Platform and visiting your account profile page. You may also email us at info@Mended Solutions.com to request access to, correct, or delete any personal information that you have provided to us. We cannot delete your personal information except by also deleting your user account. We may not accommodate a request to change information if we believe the change would violate any law or legal requirement or cause the information to be incorrect"),
          verticalSpacing10,
          Paragraph(
              text:
                  "If you delete your User Contributions from the Platform, copies of your User Contributions may remain viewable in cached and archived pages, or might have been copied or stored by other Platform users. Proper access and use of information provided on the Platform, including User Contributions, is governed by our Terms of Use."),
          verticalSpacing10,
          Paragraph(
              text:
                  "California residents may have additional personal information rights and choices. Please see “Your California Privacy Rights” for more information."),
        ],
      );

  Widget mendedSolutionsKeepYourDataSecure() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "Mended Solutions KEEPS YOUR DATA SECURE"),
          verticalSpacing12,
          Paragraph(
              text:
                  "We apply industry standards and strive to apply best practices to prevent any unauthorized access and disclosure. Internet-based services carry inherent security risks, but our systems infrastructure, encryption technology, operation and processes are all designed, built, and maintained with your security and privacy in mind."),
          verticalSpacing10,
          Paragraph(
              text:
                  "Mended Solutions has an experienced team of data security professionals whose job it is to make sure we use secure technology to protect your data. We have security staff who test internal security at Mended Solutions to try and anticipate threat actors and security staff that act defensively and build processes and infrastructure to prevent incidents and attacks. We have numerous robust security practices such as:"),
          verticalSpacing10,
          UnorderList(
              "All the messages between a member and their Provider are secure and encrypted by 256-bit encryption"),
          UnorderList(
              "Our servers are distributed across multiple data centers for optimal security and protection."),
          UnorderList(
              "Our browsing encryption system (SSL) follows modern best practices"),
          UnorderList(
              "Our databases are encrypted and scrambled rendering them useless in the unlikely event that they are stolen or inappropriately retrieved."),
          UnorderList(
              "We have robust monitoring and alerting systems and procedures in place that include both automated systems and humans."),
          Paragraph(text: "For your own security, keep the following in mind:"),
          verticalSpacing10,
          UnorderList(
              "\"Phishing\": This is a type of online identity theft or account hacking. We will never request your login information or credit card information in any nonsecure or unsolicited communication. You should always be diligent when you are asked to provide your account information and make sure it is in our secure system."),
          UnorderList(
              "\"Third-Party links\": Our Platform may contain links to a Third-Party website or service. We do not control Third-Party websites, and do not have control over their privacy policies and terms of use. The fact that we link to a website is not an endorsement, authorization, or representation of our affiliation with that Third Party or of their privacy and security policies or practices."),
          verticalSpacing10,
        ],
      );

  Widget mendedSolutionsDoesNotSellUserData() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "Mended Solutions DOES NOT SELL USER DATA"),
          verticalSpacing12,
          Paragraph(
              text:
                  "Mended Solutions is not paid by anyone for any data. In California, however, the laws define “sale” broadly to include the sharing of personal information in exchange for anything of value. If you opt in to our use of targeting cookies and web beacons, this use may be considered a “sale” of personal information under that specific California law. For specific information on your data rights as a resident of California, see the additional notice for California residents."),
        ],
      );

  Widget requesting_DeletingUserData() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "REQUESTING AND DELETING YOUR DATA"),
          verticalSpacing12,
          Paragraph(
              text:
                  "To request a summary of your data, log in to your Mended Solutions account and go to Menu –> My Account (or Account settings) –> My Data, where you will see an option to request a copy of your data. The data you will receive as part of this request includes the contact information that you input on the site, questionnaire answers, worksheet entries, emergency contact information, messages you sent to your Provider, journal entries that you created, and other personal data"),
          verticalSpacing10,
          Paragraph(
              text:
                  "Additional data which we maintain includes email interactions with our help desk, which is stored on your email system. You may also request this information by writing to info@Mended Solutions.com. Please visit our opt-out instructions page to request to delete the above data or opt out of Mended Solutions services. Some data will be maintained as allowed by law or required by our retention policy."),
          verticalSpacing10,
          Paragraph(
              text:
                  "You may reach out to us at info@Mended Solutions.com if you need additional help. We will only comply with a request for deletion of your data if we can verify your identity. There is usually no charge. In exceptional circumstances, we may charge a reasonable fee after discussing the fee with you"),
          verticalSpacing10,
          Paragraph(
              text:
                  "Please note that if you’ve started health care services, we may retain some of your data for an extended period based on applicable data retention laws."),
          verticalSpacing10,
          Paragraph(text: "Requirements:", italic: true),
          verticalSpacing10,
          UnorderList(
              "You must provide sufficient and accurate details that allow us to understand, evaluate, and respond to your request"),
          UnorderList(
              "Only you or your authorized representative may make a request on your behalf. You may also make a request on behalf of your minor child depending on the applicable laws."),
          UnorderList(
              "We reserve the right to deny information requests that are unduly burdensome as allowed by law."),
          UnorderList(
              "You must provide sufficient, accurate information that allows us to reasonably verify your identity or status as an authorized representative."),
          verticalSpacing10,
          Paragraph(
              text:
                  "If you have any questions about your rights, want to exercise them, or want to appeal our response to your request, please email us at info@Mended Solutions.com. "),
          verticalSpacing10,
          Paragraph(
              text:
                  "We will not discriminate against you for exercising any of your privacy rights. We will not deny you services, charge you different prices or rates, impose penalties, or provide a different quality of service."),
        ],
      );

  Widget yourCaliforniaPrivacyRights() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "YOUR CALIFORNIA PRIVACY RIGHTS"),
          verticalSpacing12,
          Paragraph(
              text:
                  "This Section on California Privacy Rights only applies to California residents and, for California residents, supplements the Mended Solutions Privacy Policy to comply with the California Consumer Privacy Act of 2018 (“CCPA”) and the California Privacy Rights Act (“CPRA”) of 2023. "),
          verticalSpacing10,
          Paragraph(
              text:
                  "The CCPA and the CPRA are California laws that provide its residents with certain rights over information about them, including notice about the categories of personal information we have collected from them in the preceding twelve months and the purposes for which the information is used or disclosed, and correction of personal information."),
          verticalSpacing10,
          Paragraph(
              text:
                  "We collect information that identifies, relates to, describes, references, is reasonably capable of being associated with, or could reasonably be linked, directly or indirectly, with a particular consumer, household, or device (“personal information”). Personal information does not include:"),
          verticalSpacing10,
          UnorderList("Publicly available information from government records"),
          UnorderList("Deidentified or aggregated consumer information."),
          UnorderList("Information excluded from the CCPA’s scope, like:"),
          UnorderListSubItem(
              "health or medical information covered by the Health Insurance Portability and Accountability Act of 1996 (HIPAA) and the California Confidentiality of Medical Information Act (CMIA), clinical trial data, or other qualifying research data;"),
          UnorderListSubItem(
              "personal information covered by certain sector-specific privacy laws, including the Fair Credit Reporting Act (FCRA), the Gramm-LeachBliley Act (GLBA) or California Financial Information Privacy Act (FIPA), and the Driver’s Privacy Protection Act of 1994."),
          verticalSpacing10,
          Paragraph(
              text:
                  "The following Sections outline the data that is Processed by us, as well as the purpose for collection, and the categories of sources of such information:"),
          verticalSpacing10,
          UnorderList("Information We Collect and How We Collect It"),
          UnorderList("How and Why We Use Your Information "),
          UnorderList("Interactions Between You and Your Healthcare Provider"),
          UnorderList("Disclosure of Your Information"),
          UnorderList(
              "Your Choices About Our Collection, Use, and Disclosure of Your Information"),
          verticalSpacing10,
          Paragraph(
              text:
                  "The data referenced above may fall in certain defined categories under the CCPA and CPRA. Accordingly, we may have collected:"),
          UnorderList(
              "A. Identifiers. A real name, alias, postal address, unique personal identifier, online identifier, Internet Protocol address, email address, account name, Social Security number, driver’s license number, passport number, or other similar identifiers."),
          UnorderList(
              "B. Personal information categories listed in the California Customer Records statute (Cal. Civ. Code § 1798.80(e)). A name, signature, Social Security number, physical characteristics or description, address, telephone number, passport number, driver’s license or state identification card number, insurance policy number, education, employment, employment history, bank account number, credit card number, debit card number, or any other financial information, medical information, or health insurance information. Some personal information included in this category may overlap with other categories."),
          UnorderList(
              "C. Protected classification characteristics under California or federal law. Age (40 years or older), race, color, ancestry, national origin, citizenship, religion or creed, marital status, medical condition, physical or mental disability, sex (including gender, gender identity, gender expression, pregnancy or childbirth and related medical conditions), sexual orientation, veteran or military status, genetic information (including familial genetic information). "),
          UnorderList(
              "D. Commercial information. Records of personal property, products or services purchased, obtained, or considered, or other purchasing or consuming histories or tendencies."),
          UnorderList(
              "E. Biometric information. Genetic, physiological, behavioral, and biological characteristics, or activity patterns used to extract a template or other identifier or identifying information, such as, fingerprints, faceprints, and voiceprints, iris or retina scans, keystroke, gait, or other physical patterns, and sleep, health, or exercise data."),
          UnorderList(
              "F. Internet or other similar network activity. Browsing history, search history, information on a consumer’s interaction with  a website, application, or advertisement."),
          UnorderList("G. Geolocation data. Physical location or movements."),
          UnorderList(
              "H. Sensory data. Audio, electronic, visual, thermal, olfactory, or similar information."),
          UnorderList(
              "I. Professional or employment-related information. Current or past job history or performance evaluations."),
          UnorderList(
              "J. Non-public education information (per the Family Educational Rights and Privacy Act (20 U.S.C. Section 1232g, 34 C.F.R. Part 99)). Education records directly related to a student maintained by an educational institution or party acting on its behalf, such as grades, transcripts, class lists, student schedules, student identification codes, student financial information, or student disciplinary records."),
          UnorderList(
              "K. Inferences drawn from other personal information. Profile reflecting a person’s preferences, characteristics, psychological trends, predispositions, behavior, attitudes, intelligence, abilities, and aptitudes."),
          verticalSpacing10,
          Paragraph(
              text:
                  "The information that we have disclosed in the past 12 months and the recipients of the information are described above, in the Section titled “How and Why We Use Your Information?” The information that we may have shared in the past 12 months falls into the following personal information categories under the CCPA and CPRA:"),
          UnorderList("Identifiers"),
          UnorderList(
              "Personal information categories listed in the California Customer Records statute (Cal. Civ. Code § 1798.80(e))."),
          UnorderList(
              "Protected classification characteristics under California or federal law"),
          UnorderList("Commercial information."),
          UnorderList("Biometric information."),
          UnorderList("Internet or other similar network activity"),
          UnorderList("Geolocation data."),
          UnorderList("Sensory data"),
          UnorderList(" Sensitive Personal Information"),
          UnorderList("Professional or employment-related information"),
          UnorderList(
              "Non-public education information (per the Family Educational Rights and Privacy Act (20 U.S.C. Section 1232g, 34 C.F.R. Part 99))."),
          verticalSpacing10,
          Paragraph(
              text:
                  "As noted in the Section titled “How and Why We Use Your Information”, our “sale” of information (including sale of information about consumers under the age of 16) consists of the disclosure of your information for targeted advertising purposes, and we aren’t paid by any Third Party for any data. The information that we may have “sold” (for purposes of the CCPA and CPRA) in the past 12 months falls into the following personal information categories under the CCPA and CPRA:"),
          verticalSpacing10,
          UnorderList("Identifiers."),
          UnorderList("Commercial information."),
          UnorderList("Internet or other similar network activity."),
          verticalSpacing10,
          Headings(
            text:
                "California residents have the right to know what information we have about them",
            fontsize: 15,
          ),
          verticalSpacing10,
          Paragraph(
              text:
                  "California residents can request certain information about what we have Processed over the past twelve months. Once we receive and verify your consumer request, we can provide the following information:"),
          verticalSpacing10,
          UnorderList(
              "The specific pieces of personal information we collected about you."),
          UnorderList(
              "The categories of personal information we collected about you."),
          UnorderList(
              "The categories of sources for the personal information we collected about you"),
          UnorderList(
              "Our business or commercial purpose for collecting that personal information"),
          UnorderList(
              "The categories of Third Parties with whom we shared that personal information. "),
          UnorderList(
              "Whether we disclosed your personal information for a business purpose and the personal information categories that each category of recipient obtained"),
          verticalSpacing10,
          Paragraph(
              text:
                  "We will verify your identity by matching the information you provide with information that we maintain about you or via biometrics. You also have the right to request that we correct personal information about you if it is found to be inaccurate. To make such a request, please email info@Mended Solutions.com."),
          verticalSpacing10,
          Headings(
            text: "You can “opt out” and request that we delete your data.",
            fontsize: 14,
          ),
          verticalSpacing10,
          Paragraph(
              text:
                  "You can request that we delete your data as described in the section of this policy called: “Requesting and Deleting Your Data.” Once your request is received and verified (by matching the information you provide with information that we maintain about you ), we’ll move forward with the Process of deleting your information in line with our legal requirements and retention policy. We cannot fulfill a deletion request and need to retain your information if the data is necessary to: "),
          verticalSpacing10,
          UnorderList(
              "Comply with applicable laws, including but not limited to, the California Electronic Communications Privacy Act (Cal. Penal Code § 1546 seq.) and information covered by the California Confidentiality of Medical Information Act"),
          UnorderList(
              "speech rights, or exercise another right provided for by law."),
          UnorderList(
              "Detect security incidents, protect against malicious, deceptive, fraudulent, or illegal activity, or prosecute those responsible for such activities."),
          UnorderList(
              "Debug products to identify and repair errors that impair existing intended functionality"),
          UnorderList(
              "Engage in public or peer-reviewed scientific, historical, or statistical research in the public interest that adheres to all other applicable ethics and privacy laws, when the information’s deletion may likely render impossible or seriously impair the research’s achievement, if you previously provided informed consent."),
          UnorderList(
              "Provide you services, take actions reasonably anticipated within the context of our ongoing business relationship, or otherwise perform our contract with you. "),
          UnorderList(
              "Make other internal and lawful uses of that information that are compatible with the context in which you provided it. "),
          verticalSpacing10,
          Paragraph(
              text:
                  "As noted above, you may opt out of the “sale” of personal information about you by withdrawing your consent to accept cookies used for advertising here. Our Platform is also designed to implement a do-not-sell privacy preference requested via a global privacy control."),
          verticalSpacing10,
          Headings(
            text: "Other California Privacy Rights",
            fontsize: 14,
          ),
          verticalSpacing10,
          Paragraph(
              text:
                  "California’s “Shine the Light” law (Civil Code Section § 1798.83) permits users of our Platform that are California residents to request certain information regarding our disclosure of personal information to third parties for their direct marketing purposes. To make such a request, please email info@Mended Solutions.com."),
          Paragraph(
              text:
                  "If you are a California resident, California law may provide you with additional rights regarding our use of your personal information. To learn more about your California privacy rights, visit https://oag.ca.gov/privacy/ccpa."),
        ],
      );

  Widget RemainingCompletelyAnonymousNotPossible() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "REMAINING COMPLETELY ANONYMOUS IS NOT POSSIBLE"),
          verticalSpacing12,
          Paragraph(
              text:
                  "When you sign up for an account on Mended Solutions, we do not ask you for your full name. You may pick any name or “nickname” which will identify you in the system. You will need to provide an email address so that we can verify you, keep your account secure and so we can communicate with you. You can choose an email that does not include your name, but you should be aware that in some jurisdictions emails may be “personal data,” “personally identifiable information” or “sensitive personal data” in certain circumstances. When you decide to start the healthcare process, we’ll ask you for your contact information for emergency situations. Your healthcare provider may request additional specific information about you as required by their licensing board guidelines."),
          verticalSpacing10,
          Paragraph(
              text:
                  "Even though we try to limit the kinds of information you must provide to us as discussed above, it is very difficult to be truly “anonymous” when you use any app or the internet."),
        ],
      );

  Widget dataSecurity() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "DATA SECURITY"),
          verticalSpacing12,
          Paragraph(
              text:
                  "We have implemented measures designed to secure your personal information from accidental loss and from unauthorized access, use, alteration, and disclosure. All information you provide to us is stored on our secure servers behind firewalls. Any payment transactions and other Sensitive Information will be encrypted using SSL technology."),
          verticalSpacing10,
          Paragraph(
              text:
                  "The safety and security of your information also depends on you. Where we have given you (or where you have chosen) a password for access to certain parts of our Platform, you are responsible for keeping this password confidential. We ask you not to share your password with anyone. We urge you to be careful about giving out information in public areas of the Platform like message boards. The information you share in public areas may be viewed by any user of the Platform. "),
          verticalSpacing10,
          Paragraph(
              text:
                  "Unfortunately, the transmission of information via the internet and mobile platforms is not completely secure. Although we do our best to protect your personal information, we cannot guarantee the security of your personal information transmitted through our Platform. Any transmission of personal information is at your own risk. We are not responsible for circumvent ion of any privacy settings or security measures we provide."),
        ],
      );

  Widget changesToOurPrivacyPolicy() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "CHANGES TO OUR PRIVACY POLICY"),
          verticalSpacing12,
          Paragraph(
              text:
                  "We may update our privacy policy from time to time. If we make material changes to how we treat our users’ personal information, we will post the new privacy policy on this page and notify you by email or text message to the primary email address or phone number specified in your account."),
          verticalSpacing10,
          Paragraph(
              text:
                  "The date the privacy policy was last revised is identified at the top of the page. You are responsible for ensuring we have an up-to-date active and deliverable email address and/or phone number for you and for periodically visiting this privacy policy to check for any changes. We encourage you to periodically review this page for the latest information."),
          verticalSpacing10,
        ],
      );

  Widget contactInformation() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "CONTACT INFORMATION"),
          verticalSpacing12,
          Paragraph(
              text:
                  "To ask questions or comment about this privacy policy and our privacy practices, contact us at the following email: info@Mended Solutions.com."),
          verticalSpacing10,
          Paragraph(
              text:
                  "To register a complaint or concern, please email us at the following email: info@Mended Solutions.com."),
        ],
      );

  Widget optOutPage() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: Headings(
              text: "Opt-Out Page",
              fontsize: 24,
            ),
          ),
          verticalSpacing12,
          Headings(text: "OPTING OUT"),
          verticalSpacing12,
          Headings(
            text: "I am a Mended Solutions customer and I want to opt-out",
            fontsize: 14,
            italic: true,
          ),
          verticalSpacing10,
          Paragraph(
              text:
                  "If you have a Mended Solutions account and wish to completely opt-out of Mended Solutions’s services:"),
          verticalSpacing10,
          UnorderList("Log into your Mended Solutions account"),
          UnorderList(
              "If you are currently receiving therapy, go to Menu > My Account (or Account settings) > Payment settings > Cancel Membership"),
          UnorderList(
              " Then go to Menu > My Account (or Account settings) > Personal Information and click on Request Erasure"),
          verticalSpacing10,
          Paragraph(
              text:
                  "We will send a confirmation to the email address on your account once your request is processed."),
          verticalSpacing12,
          Headings(
            text: "I want to opt-out of tracking via cookies or web beacons.",
            italic: true,
            fontsize: 15,
          ),
          verticalSpacing12,
          Paragraph(
              text:
                  "To manage your cookie preferences, including tracking by third parties, please follow this link: https://Mended Solutions.com/opt-out."),
          verticalSpacing10,
          Paragraph(
              text:
                  "To clear strictly necessary cookies or cookies that you opted into previously, you can clear all cookies from this site using your browser. For instructions please see https://www.aboutcookies.org/how-to-delete-cookies/"),
          verticalSpacing10,
          Paragraph(
              text:
                  "Note: If you used a different browser (such as on another device) to visit this site, you’ll need to clear cookies on each browser.")
        ],
      );
}

class Headings extends StatelessWidget {
  Headings({required this.text, this.italic = false, this.fontsize = 18});
  String text;
  bool italic;
  double fontsize;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontsize,
          fontWeight: FontWeight.bold,
          fontStyle: italic ? FontStyle.italic : FontStyle.normal),
    );
  }
}

class Paragraph extends StatelessWidget {
  Paragraph({required this.text, this.fontsize = 14, this.italic = false});
  String text;
  bool italic;
  double fontsize;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontsize,
          fontStyle: italic ? FontStyle.italic : FontStyle.normal,
          fontWeight: FontWeight.normal),
    );
  }
}

class UnorderList extends StatelessWidget {
  UnorderList(this.text, {super.key});
  String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: SizedBox(
              width: 7.0,
              height: 7.0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          Flexible(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14.0),
            ),
          ),
        ],
      ),
    );
  }
}

class UnorderListSubItem extends StatelessWidget {
  UnorderListSubItem(this.text, {super.key});
  String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 18, top: 8, bottom: 8),
            child: SizedBox(
              width: 9.0,
              height: 3.5,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  // shape: BoxShape.rectangle,
                  color: Color.fromARGB(255, 116, 114, 114),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          Flexible(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14.0),
            ),
          ),
        ],
      ),
    );
  }
}
