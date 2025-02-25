import 'package:flutter/material.dart';

import '../../Widgets/MyAppBar.dart';
import '../../helper/Constants/MySpaces.dart';
import '../PrivacyPolicy/PrivacyPolicyScreen.dart';

class TermToUseScreen extends StatelessWidget {
  const TermToUseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: // AppBar(),
          MyAppBar(
        title: 'Terms of Use',
        isDrawer: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    const Text(
                      'AppLogo Terms of Use',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    verticalSpacing12,
                    const Text(
                      'Last Modified: 31 March 2023',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    verticalSpacing12,
                    Paragraph(
                        text:
                            "Welcome to AppLogo’s online Platform. Please read these Terms of Use carefully, as they govern your use of our Website, Application, Products, and Services."),
                    verticalSpacing10,
                    Headings(
                      text:
                          "IF YOU HAVE A MEDICAL EMERGENCY, IMMEDIATELY CALL YOURPRIMARY CARE PROVIDER OR DIAL 911. AppLogo’S SERVICES ARENOT APPROPRIATE FOR EMERGENCY MEDICAL CONCERNS.",
                      fontsize: 17,
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpacing16,
                  acceptenceOfTermOfUse(),
                  verticalSpacing16,
                  changesToTermOfUse(),
                  verticalSpacing16,
                  accessingPlatform_AccountSecurity_Represantiaion(),
                  verticalSpacing16,
                  providers_healthCareServices(),
                  verticalSpacing16,
                  paymentAndFees(),
                  verticalSpacing16,
                  providerPaymentWithdrawals(),
                  verticalSpacing16,
                  intellectualPropertyRights(),
                  verticalSpacing16,
                  trademarks(),
                  verticalSpacing16,
                  privacyAndSecurity(),
                  verticalSpacing16,
                  prohibitedUsers(),
                  verticalSpacing16,
                  userContributions(),
                  verticalSpacing16,
                  monitoring_Enforcement_Termination(),
                  verticalSpacing16,
                  contentStandards(),
                  verticalSpacing16,
                  copyrightInfringement(),
                  verticalSpacing16,
                  relianceOnInformationPosted(),
                  verticalSpacing16,
                  changesToPlatform(),
                  verticalSpacing16,
                  InfoAboutYou_yourVisitToPlatform(),
                  verticalSpacing16,
                  InfoAboutYou_yourVisitToPlatform(),
                  verticalSpacing16,
                  onlinePuchase_otherTermsAndConditions(),
                  verticalSpacing16,
                  linkingPlatform_SocialMediaFeatues(),
                  verticalSpacing16,
                  thirdPartycontent_LinksFromPlatform(),
                  verticalSpacing16,
                  geographicRistrictions(),
                  verticalSpacing16,
                  disclaimerOfWarranties(),
                  verticalSpacing16,
                  limitationOnLiability(),
                  verticalSpacing16,
                  indemnification(),
                  verticalSpacing16,
                  governingLawAndJurisdiction(),
                  verticalSpacing16,
                  Abitration(),
                  verticalSpacing16,
                  limitationOnTimeOfFileClaims(),
                  verticalSpacing16,
                  waiver_Severability(),
                  verticalSpacing16,
                  exportControl_Sanctions(),
                  verticalSpacing16,
                  attorneyFees_WaiverJuryTrail_Interpretation(),
                  verticalSpacing16,
                  headings_EntireAgreement_Notices_YouCommentsAndConcerns(),
                  verticalSpacing16
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget acceptenceOfTermOfUse() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "ACCEPTANCE OF THE TERMS OF USE"),
          verticalSpacing12,
          Paragraph(
              text:
                  "These terms of use are entered into by and between You and AppLogo (AppLogo“, the”Company,\" “we ”our,\" or “us”). The following terms and conditions, together with any documents they expressly incorporate by reference (collectively, “Terms of Use”), govern your access to and use of the AppLogo online Platform through which healthcare services may be provided, including any content, functionality, and services offered on or through the AppLogo Mobile Application or the AppLogo Website (collectively the “Platform”), whether as a guest or a registered user. This AppLogo Platform is owned and operated by AppLogo Website located in Florida, United States (info@AppLogo.com). The Platform may be provided or be accessible via multiple websites or applications whether owned or operated by us or by third parties, including, without limitation, the website AppLogo Website and its related apps. "),
          verticalSpacing10,
          Paragraph(
              text:
                  "Please read the Terms of Use carefully before you start to use the Platform. By accessing or using the Platform or by clicking to accept or agree to the Terms of Use when this option is made available to you, you accept and agree to be bound and abide by these Terms of Use, our Privacy Policy, and our Copyright DMCA Policy, each incorporated herein by reference. If you do not want to agree to these Terms of Use, the Privacy Policy, the Terms and Conditions for Services, or the Copyright DMCA Policy you must not access or use the Platform."),
          verticalSpacing10,
          Paragraph(
              text:
                  "This Platform is offered and available to users who are 18 years of age or older and reside in the United States or any of its territories or possessions. By using this Platform, you represent and warrant that you are of legal age to form a binding contract with AppLogo and meet all of the foregoing eligibility requirements. If you do not meet all of these requirements, you must not access or use the Platform."),
          verticalSpacing10,
          Paragraph(
              text:
                  "You hereby confirm that you are legally able to consent to receive Services, or have the consent of a parent or guardian, and are legally able to enter into a contract."),
          verticalSpacing10,
          Paragraph(
              text:
                  "Minor Consent: Where consent from a parent or guardian is required to receive Services on the Platform, you hereby confirm that as the consenting parent or guardian, you have the sole right to consent to Services for the minor seeking therapy and are not legally mandated to confer with or get consent from any other legal guardian before consenting. You also give affirmative consent to the provisions set forth in the accompanying Privacy Policy regarding the collection, process, and use of personal information on behalf of the minor. You also agree that consent to Services remains valid until membership is canceled."),
          verticalSpacing10,
        ],
      );

  Widget changesToTermOfUse() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "CHANGES TO THE TERMS OF USE"),
          verticalSpacing12,
          Paragraph(
              text:
                  "We may revise and update these Terms of Use from time to time in our sole discretion. All changes are effective immediately when we post them, and apply to all access to and use of the Platform thereafter. However, any changes to the dispute resolution provisions set out in Governing Law and Jurisdiction will not apply to any disputes for which the parties have actual notice on or before the date the change is posted on the Platform. "),
          verticalSpacing10,
          Paragraph(
              text:
                  "Your continued use of the Platform following the posting of revised Terms of Use means that you accept and agree to the changes. You are expected to check this page each time you access this Platform so you are aware of any changes, as they are binding on you."),
        ],
      );

  Widget accessingPlatform_AccountSecurity_Represantiaion() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(
              text:
                  "ACCESSING THE PLATFORM, ACCOUNT SECURITY, AND REPRESENTATIONS AND WARRANTIES"),
          verticalSpacing12,
          Paragraph(
              text:
                  "We reserve the right to withdraw or amend this Platform, and any service or material we provide on the Platform, in our sole discretion without notice. We will not be liable if for any reason all or any part of the Platform is unavailable at any time or for any period. From time to time, we may restrict access to some parts of the Platform, or the entire Platform, to users, including registered users."),
          verticalSpacing10,
          Paragraph(text: "You are responsible for both:"),
          verticalSpacing10,
          UnorderList(
              "Making all arrangements necessary for you to have access to the Platform."),
          UnorderList(
              "Ensuring that all persons who access the Platform through your internet connection are aware of these Terms of Use and comply with them."),
          verticalSpacing10,
          Paragraph(
              text:
                  "You hereby confirm and agree that all the information that you provided in or through the Platform, and the information that you will provide in or through the Platform in the future, is accurate, true, current and complete. Furthermore, you agree that during the term of this Agreement you will make sure to maintain and update this information so it will continue to be accurate, current and complete.\n\n To access the Platform or some of the resources it offers, you may be asked to provide certain registration details or other information. It is a condition of your use of the Platform that all the information you provide on the Platform is correct, current, and complete. You agree that all information you provide to register with this Platform or otherwise, including, but not limited to, through the use of any interactive features on the Platform, is governed by our Privacy Policy, available at AppLogo.com/legal/privacy-policy, and you consent to all actions we take with respect to your information consistent with our Privacy Policy.\n\nIf you choose, or are provided with, a username, password, or any other piece of information as part of our security procedures, you must treat such information as confidential, and you must not disclose it to any other person or entity. You agree, confirm and acknowledge that you are responsible for maintaining the confidentiality of your password and any other security information related to your account (collectively “Account Access”). We advise you to change your password frequently and to take extra care in safeguarding your password. You also acknowledge that your account is personal to you and agree not to provide any other person with access to this Platform or portions of it using your username, password, or other security information. You agree to notify us immediately of any unauthorized access to or use of your username or password or any other breach of security. You also agree to ensure that you exit from your account at the end of each session. You should use particular caution when accessing your account from a public or shared computer so that others are not able to view or record your password or other personal information.\n\nYou agree to notify us immediately of any unauthorized use of your Account Access or any other concern for breach of your account security. You also agree, confirm, and acknowledge that we will not be liable for any loss or damage that incurred as a result of someone else using your account, either with or without your consent and/or knowledge.\n\nYou agree, confirm and acknowledge that you are solely and fully liable and responsible for all activities performed using your Account Access. You further acknowledge and agree that we will hold you liable and responsible for any damage or loss incurred as a result of the use of your Account Access by any person whether authorized by you or not, and you agree to indemnify us for any such damage or loss.\n\nYou agree and commit not to use the account or Account Access of any other person for any reason.\n\nYou agree and confirm that your use of the Platform, including the Healthcare Services, are for your own personal use only and that you are not using the Platform or the Healthcare Services for or behalf of any other person or organization.\n\nYou acknowledge and agree that we have the right to disable any username, password, or other identifier, whether chosen by you or provided by us, at any time in our sole discretion for any or no reason, including if, in our opinion, you have violated any provision of these Terms of Use.\n\nYou agree and commit not to interfere with or disrupt, or attempt to interfere with or disrupt, any of our systems, services, servers, networks or infrastructure, or any of the Platform’s systems, services, servers, networks or infrastructure, including without limitation obtaining unauthorized access to the aforementioned.\n\nYou agree and commit not to make any use of the Platform for the posting, sending or delivering of either of the following:"),
          UnorderList(
              "unsolicited email, advertisement, or promotion of goods and services;"),
          UnorderList("malicious software or code;"),
          UnorderList(
              "unlawful, harassing, privacy invading, abusive, threatening, vulgar, obscene, racist or potentially harmful content;"),
          UnorderList(
              "any content that infringes a third party right including intellectual property rights;"),
          UnorderList("any content that may cause damage to a third party;"),
          UnorderList(
              "any content which may constitute, cause or encourage a criminal action or violate any applicable law."),
          verticalSpacing10,
          Paragraph(
              text:
                  "You agree and commit not to violate any applicable local, state, national or international law, statute, ordinance, rule, regulation or ethical code in relation to your use of the Platform and your relationship with the Provider and us."),
          verticalSpacing10,
          Paragraph(
              text:
                  "If you receive any file from us or from a Provider, whether through the Platform or not, you agree to check and scan this file for any virus or malicious software prior to opening or using this file.")
        ],
      );

  Widget providers_healthCareServices() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "THE PROVIDERS AND HEALTHCARE SERVICES"),
          verticalSpacing12,
          Paragraph(
              text:
                  "The Platform may be used to connect you with a healthcare Provider who will provide services to you through the Platform (“Healthcare Services”)."),
          verticalSpacing10,
          Headings(
            text: "Providers",
            italic: true,
            fontsize: 16,
          ),
          verticalSpacing12,
          Paragraph(
              text:
                  "We require every Provider providing Healthcare Services on the Platform to be an accredited, trained, and experienced licensed psychologist (PhD/PsyD), licensed professional counselor (LPC), licensed occupational therapist (OT), licensed physical therapist (PT), licensed dietitian (LD/LDN), licensed pharmacist (R.Ph./Pharm.D./P.D.D.Ph.), licensed marriage and family therapist (LMFT), licensed clinical social worker (LCSW/LICSV), licensed speech language pathologist (SLP/CCC-SLP), licensed registered nurse (RN), licensed nurse practitioner (NP), licensed physician (MD/DO), or similar applicable recognized professional certification based on their state and/or jurisdiction. Providers must have a relevant academic degree in their field, at least three years of experience, at least 1,000 hours of hands-on experience, and have to be qualified and certified by their respective professional board after successfully completing the necessary education, exams, training and practice requirements as applicable."),
          verticalSpacing10,
          Paragraph(
              text:
                  "The Providers are independent contractors who are not employees, agents, or representatives of AppLogo. The Platform’s role is limited to enabling the Healthcare Services. The Providers themselves are responsible for the performance of the Healthcare Services. If you feel the Healthcare Services provided by the Provider do not fit your needs or expectations, you may change to a different Provider who provides services through the Platform. While we have a large database of Providers, you should note that because of licensure requirements that differ from jurisdiction to jurisdiction, not all Providers available on our database will be available for you to match with, or at any particular time, or for any set period of time. If a Provider you have been connected with stops using the Platform at any time after you have been connected, we will send an email to notify you that your Provider is no longer on the Platform and that you have the opportunity to match with a new Provider"),
          verticalSpacing10,
          Paragraph(
              text:
                  "While we hope the Healthcare Services are beneficial to you, you understand, agree and acknowledge that they may not be the appropriate solution for everyone’s needs and that they may not be appropriate for every particular situation and/or may not be a complete substitute for a face-to-face examination and/or care in every particular situation."),
          verticalSpacing10,
          Headings(
            text:
                "IF YOU ARE THINKING ABOUT SUICIDE OR IF YOU ARE CONSIDERING HARMING YOURSELF OR OTHERS OR IF YOU FEEL THAT ANY OTHER PERSON MAY BE IN ANY DANGER OR IF YOU HAVE ANY MEDICAL EMERGENCY, YOU MUST IMMEDIATELY CALL YOUR LOCAL EMERGENCY SERVICES NUMBER AND NOTIFY THE RELEVANT AUTHORITIES. THE PLATFORM IS NOT DESIGNED FOR USE IN ANY OF THE AFOREMENTIONED CASES AND THE PROVIDERS CANNOT PROVIDE THE ASSISTANCE REQUIRED IN ANY OF THE AFOREMENTIONED CASES.",
            fontsize: 14,
          ),
          verticalSpacing10,
          Headings(
            text:
                "THE PLATFORM IS NOT INTENDED FOR THE PROVISION OF CLINICAL DIAGNOSIS REQUIRING AN IN-PERSON EVALUATION AND YOU SHOULD NOT USE IT IF YOU NEED ANY OFFICIAL DOCUMENTATION OR APPROVALS FOR PURPOSES SUCH AS, BUT NOT LIMITED TO, COURTORDERED THERAPY OR EMOTIONAL SERVICE DOG CERTIFICATION.",
            fontsize: 14,
          ),
          Headings(
            text:
                "DO NOT DISREGARD, AVOID, OR DELAY IN OBTAINING IN-PERSON CARE FROM YOUR DOCTOR OR OTHER QUALIFIED PROFESSIONAL BECAUSE OF INFORMATION OR ADVICE YOU RECEIVED THROUGH THE PLATFORM.",
            fontsize: 14,
          ),
        ],
      );

  Widget paymentAndFees() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "PAYMENT AND FEES"),
          verticalSpacing12,
          Paragraph(
              text:
                  "We reserve the right to change our fees or adjust prices of our services. Any changes to your services will only take effect following proper notice to you."),
          verticalSpacing12,
          Headings(
            text: "Customer Fees",
            fontsize: 15,
            italic: true,
          ),
          verticalSpacing10,
          Paragraph(
              text:
                  "By selecting a Healthcare Service from a Provider, you acknowledge that such Service include a 5% fee that goes to AppLogo."),
          verticalSpacing12,
          Headings(
            text: "Provider Fees",
            fontsize: 15,
            italic: true,
          ),
          verticalSpacing10,
          Paragraph(
              text:
                  "By accepting a request for Healthcare Service from a User, you acknowledge that AppLogo charges a 5% fee."),
          verticalSpacing12,
          Headings(
            text: "Payment",
            fontsize: 15,
            italic: true,
          ),
          verticalSpacing10,
          Paragraph(
              text:
                  "You confirm and agree to use only credit cards or other payment means (collectively “Payment Means”) which you are duly and fully authorized to use, and that all payment related information that you provided and will provide in the future, to or through the Platform, is accurate, current and correct and will continue to be accurate, current and correct"),
          verticalSpacing10,
          Paragraph(
              text:
                  "You agree to pay all fees and charges associated with your Account on a timely basis and according to the fees schedule, the terms and the rates as published in the Platform. By providing us with your Payment Means you authorize us to bill and charge you through that Payment Means and you agree to maintain valid Payment Means information in your Account information."),
          verticalSpacing10,
          Paragraph(
              text:
                  "You acknowledge that we use Stripe to help process payments in a secure way. You also acknowledge that Stripe assists us in paying healthcare Providers and issuing tax documents to them."),
        ],
      );

  Widget providerPaymentWithdrawals() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "Provider Payment Withdrawals"),
          verticalSpacing12,
          Paragraph(
              text:
                  "Providers may withdraw funds from their account at anytime for withdrawal request amounts over \$300. Withdrawal request amounts less than \$300 will be charged a 5% processing fee"),
        ],
      );

  Widget intellectualPropertyRights() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "INTELLECTUAL PROPERTY RIGHTS"),
          verticalSpacing12,
          Paragraph(
              text:
                  "The Platform and its entire contents, features, and functionality (including but not limited to all information, software, text, displays, images, video, and audio, and the design, selection, and arrangement thereof) are owned by AppLogo, its licensors, or other providers of such material and are protected by United States and international copyright, trademark, patent, trade secret, and other intellectual property or proprietary rights laws."),
          verticalSpacing10,
          Paragraph(
              text:
                  "These Terms of Use permit you to use the Platform for your personal, noncommercial use only. You must not reproduce, distribute, modify, create derivative works of, publicly display, publicly perform, republish, download, store, or transmit any of the material on our Platform, except as follows:"),
          verticalSpacing10,
          UnorderList(
              "Your computer may temporarily store copies of such materials in RAM incidental to your accessing and viewing those materials."),
          UnorderList(
              "You may store files that are automatically cached by your Web browser for display enhancement purposes."),
          UnorderList(
              "You may print or download one copy of a reasonable number of pages of the Platform for your own personal, non-commercial use and not for further reproduction, publication, or distribution"),
          UnorderList(
              "If we provide desktop, mobile, or other applications for download, you may download a single copy to your computer or mobile device solely for your own personal, non-commercial use, provided you agree to be bound by our end user license agreement for such applications."),
          UnorderList(
              "If we provide social media features with certain content, you may take such actions as are enabled by such features."),
          verticalSpacing10,
          Paragraph(text: "You must not:"),
          verticalSpacing10,
          UnorderList("Modify copies of any materials from this Platform"),
          UnorderList(
              "Use any illustrations, photographs, video or audio sequences, or any graphics separately from the accompanying text."),
          UnorderList(
              "Delete or alter any copyright, trademark, or other proprietary rights notices from copies of materials from this Platform."),
          verticalSpacing10,
          Paragraph(
              text:
                  "You must not access or use for any commercial purposes any part of the Platform or any services or materials available through the Platform."),
          verticalSpacing10,
          Paragraph(
              text:
                  "If you wish to make any use of material on the Platform other than that set out in this section, please address your request to the following email: info@AppLogo.com."),
          verticalSpacing10,
          Paragraph(
              text:
                  "If you print, copy, modify, download, or otherwise use or provide any other person with access to any part of the Platform in breach of the Terms of Use, your right to use the Platform will stop immediately and you must, at our option, return or destroy any copies of the materials you have made. No right, title, or interest in or to the Platform or any content on the Platform is transferred to you, and all rights not expressly granted are reserved by AppLogo. Any use of the Platform not expressly permitted by these Terms of Use is a breach of these Terms of Use and may violate copyright, trademark, and other laws."),
        ],
      );

  Widget trademarks() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "TRADEMARKS"),
          verticalSpacing12,
          Paragraph(
              text:
                  "The Company name, the term AppLogo, and all related names, logos, product and service names, designs, and slogans are trademarks of AppLogo or its affiliates or licensors. You must not use such marks without the prior written permission of AppLogo. All other names, logos, product and service names, designs, and slogans on this Platform are the trademarks of their respective owners."),
        ],
      );

  Widget privacyAndSecurity() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "PRIVACY AND SECURITY"),
          verticalSpacing12,
          Paragraph(
              text:
                  "Protecting and safeguarding any information you provide through the Platform is extremely important to us. Information about our security and privacy practices can be found on our Privacy Policy, available at AppLogo.com/legal/privacy-policy. "),
          verticalSpacing10,
          Headings(
            text:
                "BY AGREEING TO THIS AGREEMENT AND/OR BY USING THE PLATFORM, YOU ARE ALSO AGREEING TO THE TERMS OF THE PRIVACY POLICY. THE PRIVACY POLICY IS INCORPORATED INTO AND DEEMED A PART OF THIS AGREEMENT. THE SAME RULES THAT APPLY REGARDING CHANGES AND REVISIONS OF THIS AGREEMENT ALSO APPLY TO CHANGES AND REVISIONS OF THE PRIVACY POLICY.",
            fontsize: 14,
          )
        ],
      );

  Widget prohibitedUsers() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "PROHIBITED USES"),
          verticalSpacing12,
          Paragraph(
              text:
                  "You may use the Platform only for lawful purposes and in accordance with these Terms of Use. You agree not to use the Platform:"),
          verticalSpacing10,
          UnorderList(
              "In any way that violates any applicable federal, state, local, or international law or regulation (including, without limitation, any laws regarding the export of data or software to and from the US or other countries)"),
          UnorderList(
              "For the purpose of exploiting, harming, or attempting to exploit or harm minors in any way by exposing them to inappropriate content, asking for personally identifiable information, or otherwise."),
          UnorderList(
              "To send, knowingly receive, upload, download, use, or re-use any material that does not comply with the Content Standards set out in these Terms of Use."),
          UnorderList(
              "To transmit, or procure the sending of, any advertising or promotional material without our prior written consent, including any “junk mail,” “chain letter,” “spam,” or any other similar solicitation"),
          UnorderList(
              "To impersonate or attempt to impersonate AppLogo, a Company employee, another user, or any other person or entity (including, without limitation, by using email addresses or screen names associated with any of the foregoing)."),
          UnorderList(
              "To engage in any other conduct that restricts or inhibits anyone’s use or enjoyment of the Platform, or which, as determined by us, may harm AppLogo or users of the Platform, or expose them to liability."),
          verticalSpacing10,
          Paragraph(text: "Additionally, you agree not to:"),
          verticalSpacing10,
          UnorderList(
              "Use the Platform in any manner that could disable, overburden, damage, or impair the Platform or interfere with any other party’s use of the Platform, including their ability to engage in real time activities through the Platform."),
          UnorderList(
              "Use any robot, spider, or other automatic device, process, or means to access the Platform for any purpose, including monitoring or copying any of the material on the Platform."),
          UnorderList(
              "Use any manual process to monitor or copy any of the material on the Platform, or for any other purpose not expressly authorized in these Terms of Use, without our prior written consent."),
          UnorderList(
              "Use any device, software, or routine that interferes with the proper working of the Platform."),
          UnorderList(
              "Introduce any viruses, Trojan horses, worms, logic bombs, or other material that is malicious or technologically harmful."),
          UnorderList(
              "Attempt to gain unauthorized access to, interfere with, damage, or disrupt any parts of the Platform, the server on which the Platform is stored, or any server, computer, or database connected to the Platform."),
          UnorderList(
              "Attack the Platform via a denial-of-service attack or a distributed denial-ofservice attack."),
          UnorderList(
              "Otherwise attempt to interfere with the proper working of the Platform."),
        ],
      );

  Widget userContributions() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "USER CONTRIBUTIONS"),
          verticalSpacing12,
          Paragraph(
              text:
                  "The Platform may contain message boards, chat rooms, personal web pages or profiles, forums, bulletin boards, calendars for scheduling, and other interactive features (collectively, “Interactive Services”) that allow users to post, submit, publish, display, or transmit to other users or other persons (hereinafter, “post”) content or materials (collectively, “User Contributions”) on or through the Platform."),
          verticalSpacing10,
          Paragraph(
              text:
                  "All User Contributions must comply with the Content Standards set out in these Terms of Use."),
          verticalSpacing10,
          Paragraph(
              text:
                  "Any User Contribution you post to the Platform will be considered non-confidential and non-proprietary. By providing any User Contribution on the Platform, you grant us and our affiliates and service providers, and each of their and our respective licensees, successors, and assigns the right to use, reproduce, modify, perform, display, distribute, and otherwise disclose to third parties any such material for any purpose."),
          verticalSpacing10,
          Paragraph(text: "You represent and warrant that:"),
          verticalSpacing10,
          UnorderList(
              "You own or control all rights in and to the User Contributions and have the right to grant the license granted above to us and our affiliates and service providers, and each of their and our respective licensees, successors, and assigns."),
          UnorderList(
              "All of your User Contributions do and will comply with these Terms of Use."),
          verticalSpacing10,
          Paragraph(
              text:
                  "You understand and acknowledge that you are responsible for any User Contributions you submit or contribute, and you, not AppLogo, have full responsibility for such content, including its legality, reliability, accuracy, and appropriateness."),
          verticalSpacing10,
          Paragraph(
              text:
                  "We are not responsible or liable to any third party for the content or accuracy of any User Contributions posted by you or any other user of the Platform.")
        ],
      );

  Widget monitoring_Enforcement_Termination() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "MONITORING AND ENFORCEMENT; TERMINATION"),
          verticalSpacing12,
          Paragraph(
              text:
                  "You understand, agree and acknowledge that we may modify, suspend, disrupt or discontinue the Platform, any part of the Platform or the use of the Platform, whether to all clients or to you specifically, at any time with or without notice to you. You agree and acknowledge that we will not be liable for any of the aforementioned actions or for any losses or damages that are caused by any of the aforementioned actions."),
          verticalSpacing10,
          Paragraph(text: "We have the right to:"),
          verticalSpacing10,
          UnorderList(
              "Remove or refuse to post any User Contributions for any or no reason in our sole discretion."),
          UnorderList(
              "Take any action with respect to any User Contribution that we deem necessary or appropriate in our sole discretion, including if we believe that such User Contribution violates the Terms of Use, including the Content Standards, infringes any intellectual property right or other right of any person or entity, threatens the personal safety of users of the Platform or the public, or could create liability for AppLogo"),
          UnorderList(
              "Disclose your identity or other information about you to any third party who claims that material posted by you violates their rights, including their intellectual property rights or their right to privacy."),
          UnorderList(
              "Take appropriate legal action, including without limitation, referral to law enforcement, for any illegal or unauthorized use of the Platform."),
          UnorderList(
              "Terminate or suspend your access to all or part of the Platform for any or no reason, including without limitation, any violation of these Terms of Use."),
          verticalSpacing10,
          Paragraph(
              text:
                  "Without limiting the foregoing, we have the right to cooperate fully with any law enforcement authorities or court order requesting or directing us to disclose the identity or other information of anyone posting any materials on or through the Platform. YOU WAIVE AND HOLD HARMLESS AppLogo AND ITS AFFILIATES, LICENSEES, AND SERVICE PROVIDERS FROM ANY CLAIMS RESULTING FROM ANY ACTION TAKEN BY ANY OF THE FOREGOING PARTIES DURING, OR TAKEN AS A CONSEQUENCE OF, INVESTIGATIONS BY EITHER SUCH PARTIES OR LAW ENFORCEMENT AUTHORITIES."),
          verticalSpacing10,
          Paragraph(
              text:
                  "However, we cannot and do not undertake to review all material before it is posted on the Platform, and cannot ensure prompt removal of objectionable material after it has been posted. Accordingly, we assume no liability for any action or inaction regarding transmissions, communications, or content provided by any user or third party. We have no liability or responsibility to anyone for performance or nonperformance of the activities described in this section."),
          verticalSpacing10,
          Paragraph(
              text:
                  "The Platform depends on various factors such as software, hardware and tools, either our own or those owned and/or operated by our contractors and suppliers. While we make commercially reasonable efforts to ensure the Platform’s reliability and accessibility, you understand and agree that no platform can be 100% reliable and accessible and so we cannot guarantee that access to the Platform will be uninterrupted or that it will be accessible, consistent, timely or error-free at all times"),
        ],
      );

  Widget contentStandards() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "CONTENT STANDARDS"),
          verticalSpacing12,
          Paragraph(
              text:
                  "These content standards apply to any and all User Contributions and use of Interactive Services. User Contributions must in their entirety comply with all applicable federal, state, local, and international laws and regulations. Without limiting the foregoing, User Contributions must not:"),
          verticalSpacing10,
          UnorderList(
              "Contain any material that is defamatory, obscene, indecent, abusive, offensive, harassing, violent, hateful, inflammatory, or otherwise objectionable"),
          UnorderList(
              " Promote sexually explicit or pornographic material, violence, or discrimination based on race, sex, religion, nationality, disability, sexual orientation, or age"),
          UnorderList(
              " Infringe any patent, trademark, trade secret, copyright, or other intellectual property or other rights of any other person"),
          UnorderList(
              "Violate the legal rights (including the rights of publicity and privacy) of others or contain any material that could give rise to any civil or criminal liability under applicable laws or regulations or that otherwise may be in conflict with these Terms of Use and our Privacy Policy, available at https://AppLogo.com/legal/privacy-policy."),
          UnorderList("Be likely to deceive any person."),
          UnorderList(
              "Promote any illegal activity, or advocate, promote, or assist any unlawful act."),
          UnorderList(
              "Cause annoyance, inconvenience, or needless anxiety or be likely to upset, embarrass, alarm, or annoy any other person."),
          UnorderList(
              "Impersonate any person, or misrepresent your identity or affiliation with any person or organization"),
          UnorderList(
              "Involve commercial activities or sales, such as contests, sweepstakes, and other sales promotions, barter, or advertising."),
          UnorderList(
              "Give the impression that they emanate from or are endorsed by us or any other person or entity, if this is not the case."),
        ],
      );

  Widget copyrightInfringement() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "COPYRIGHT INFRINGEMENT"),
          verticalSpacing12,
          Paragraph(
              text:
                  "If you believe that any User Contributions violate your copyright, please see our Copyright DMCA Policy, available at AppLogo.com/legal/copyright-dmca-policy for instructions on sending us a notice of copyright infringement. It is the policy of AppLogo to terminate the user accounts of repeat infringers."),
        ],
      );

  Widget relianceOnInformationPosted() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "RELIANCE ON INFORMATION POSTED"),
          verticalSpacing12,
          Paragraph(
              text:
                  "The information presented on or through the Platform is made available solely for general information purposes. We do not warrant the accuracy, completeness, or usefulness of this information. Any reliance you place on such information is strictly at your own risk. We disclaim all liability and responsibility arising from any reliance placed on such materials by you or any other visitor to the Platform, or by anyone who may be informed of any of its contents."),
          verticalSpacing10,
          Paragraph(
              text:
                  "This Platform may include content provided by third parties, including materials provided by other users, bloggers, and third-party licensors, syndicators, aggregators, and/or reporting services. All statements and/or opinions expressed in these materials, and all articles and responses to questions and other content, other than the content provided by AppLogo, are solely the opinions and the responsibility of the person or entity providing those materials. These materials do not necessarily reflect the opinion of AppLogo. We are not responsible, or liable to you or any third party, for the content or accuracy of any materials provided by any third parties")
        ],
      );

  Widget changesToPlatform() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "CHANGES TO THE PLATFORM"),
          verticalSpacing12,
          Paragraph(
              text:
                  "We may update the content on this Platform from time to time, but its content is not necessarily complete or up-to-date. Any of the material on the Platform may be out of date at any given time, and we are under no obligation to update such material."),
        ],
      );

  Widget InfoAboutYou_yourVisitToPlatform() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(
              text: "INFORMATION ABOUT YOU AND YOUR VISITS TO THE PLATFORM"),
          verticalSpacing12,
          Paragraph(
              text:
                  "All information we collect on this Platform is subject to our Privacy Policy, available at AppLogo.com/legal/privacy-policy. By using the Platform, you consent to all actions taken by us with respect to your information in compliance with the Privacy Policy."),
        ],
      );

  Widget onlinePuchase_otherTermsAndConditions() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "ONLINE PURCHASES AND OTHER TERMS AND CONDITIONS"),
          verticalSpacing12,
          Paragraph(
              text:
                  "All purchases through our Platform or other transactions for the sale of goods, services, or information formed through the Platform, or resulting from visits made by you, are governed by our Terms of Use."),
          verticalSpacing10,
          Paragraph(
              text:
                  "Additional terms and conditions may also apply to specific portions, services, or features of the Platform. All such additional terms and conditions are hereby incorporated by this reference into these Terms of Use."),
        ],
      );

  Widget linkingPlatform_SocialMediaFeatues() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "LINKING TO THE PLATFORM AND SOCIAL MEDIA FEATURES"),
          verticalSpacing12,
          Paragraph(
              text:
                  "You may link to our homepage, provided you do so in a way that is fair and legal and does not damage our reputation or take advantage of it, but you must not establish a link in such a way as to suggest any form of association, approval, or endorsement on our part without our express written consent."),
          verticalSpacing10,
          Paragraph(
              text:
                  "This Platform may provide certain social media features that enable you to:"),
          verticalSpacing10,
          UnorderList(
              "Link from your own or certain third-party apps or websites to certain content on this Platform"),
          UnorderList(
              "Send emails or other communications with certain content, or links to certain content, on this Platform."),
          UnorderList(
              "Cause limited portions of content on this Platform to be displayed or appear to be displayed on your own or certain third-party apps or websites."),
          verticalSpacing10,
          Paragraph(
              text:
                  "You may use these features solely as they are provided by us, solely with respect to the content they are displayed with, and otherwise in accordance with any additional terms and conditions we provide with respect to such features. Subject to the foregoing, you must not:"),
          verticalSpacing10,
          UnorderList(
              "Establish a link from any app or website that is not owned by you."),
          UnorderList(
              "Cause the Platform or portions of it to be displayed on, or appear to be displayed by, any other app or site, for example, framing, deep linking, or inline linking."),
          UnorderList(
              "Link to any part of the Platform other than the homepage."),
          UnorderList(
              "Otherwise take any action with respect to the materials on this Platform that is inconsistent with any other provision of these Terms of Use."),
          verticalSpacing10,
          Paragraph(
              text:
                  "The app or website from which you are linking, or on which you make certain content accessible, must comply in all respects with the Content Standards set out in these Terms of Use."),
          verticalSpacing10,
          Paragraph(
              text:
                  "You agree to cooperate with us in causing any unauthorized framing or linking immediately to stop. We reserve the right to withdraw linking permission without notice."),
          verticalSpacing10,
          Paragraph(
              text:
                  "We may disable all or any social media features and any links at any time without notice in our discretion.")
        ],
      );

  Widget thirdPartycontent_LinksFromPlatform() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "THIRD PARTY CONTENT; LINKS FROM THE PLATFORM"),
          verticalSpacing12,
          Paragraph(
              text:
                  "The Platform may contain other content, products or services which are offered or provided by third parties (“Third Party Content”), links to Third Party Content (including but not limited to links to other websites) or advertisements which are related to Third Party Content. We have no responsibility for the creation of any such Third Party Content, including, without limitation, any related products, practices, terms or policies, and we will not be liable for any damage or loss caused by any Third Party Content."),
          verticalSpacing10,
          Paragraph(
              text:
                  "If the Platform contains links to other apps or sites and resources provided by third parties or any other Third Party Content, these links and the Third Party Content are provided for your convenience only. This includes links contained in advertisements, including banner advertisements and sponsored links. We have no control over the contents of those apps, sites or resources, and accept no responsibility for them or for any loss or damage that may arise from your use of them. If you decide to access any of the third-party apps or websites or any other Third Party Content linked to this Platform, you do so entirely at your own risk and subject to the terms and conditions of use for such apps or websites."),
        ],
      );

  Widget geographicRistrictions() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "GEOGRAPHIC RESTRICTIONS"),
          verticalSpacing12,
          Paragraph(
              text:
                  "The owner of the Platform is based in the State of Florida in the United States. We provide this Platform for use only by persons located in the United States. We make no claims that the Platform or any of its content is accessible or appropriate outside of the United States. Access to the Platform may not be legal by certain persons or in certain countries. If you access the Platform from outside the United States, you do so on your own initiative and are responsible for compliance with local laws."),
        ],
      );

  Widget disclaimerOfWarranties() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "DISCLAIMER OF WARRANTIES"),
          verticalSpacing12,
          Paragraph(
              text:
                  "TO THE MAXIMUM EXTENT PERMITTED BY LAW, YOU HEREBY RELEASE US AND AGREE TO HOLD US HARMLESS FROM ANY AND ALL CAUSES OF ACTION AND CLAIMS OF ANY NATURE RESULTING FROM THE HEALTHCARE SERVICES OR THE PLATFORM, INCLUDING, WITHOUT LIMITATION, ANY ACT, OMISSION, OPINION, RESPONSE, ADVICE, SUGGESTION, INFORMATION AND/OR SERVICE OF ANY PROVIDER AND/OR ANY OTHER CONTENT OR INFORMATION ACCESSIBLE THROUGH THE PLATFORM."),
          verticalSpacing10,
          Paragraph(
              text:
                  "YOUR USE OF THE PLATFORM, ITS CONTENT, AND ANY SERVICES OR ITEMS OBTAINED THROUGH THE PLATFORM IS AT YOUR OWN RISK. THE PLATFORM, ITS CONTENT, AND ANY SERVICES OR ITEMS OBTAINED THROUGH THE PLATFORM ARE PROVIDED ON AN “AS IS” AND “AS AVAILABLE” BASIS, WITHOUT ANY WARRANTIES OF ANY KIND, EITHER EXPRESS OR IMPLIED. TO THE FULLEST EXTENT PROVIDED BY LAW, AppLogo HEREBY DISCLAIMS ALL WARRANTIES OF ANY KIND, WHETHER EXPRESS OR IMPLIED, STATUTORY, OR OTHERWISE, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT, SECURITY, ACCURACY, TITLE, AND FITNESS FOR PARTICULAR PURPOSE. NEITHER AppLogo NOR ANY PERSON ASSOCIATED WITH AppLogo MAKES ANY WARRANTY OR REPRESENTATION WITH RESPECT TO THE COMPLETENESS, SECURITY, RELIABILITY, QUALITY, ACCURACY, OR AVAILABILITY OF THE PLATFORM. WITHOUT LIMITING THE FOREGOING, NEITHER AppLogo NOR ANYONE ASSOCIATED WITH AppLogo REPRESENTS OR WARRANTS THAT THE PLATFORM, ITS CONTENT, OR ANY SERVICES OR ITEMS OBTAINED THROUGH THE PLATFORM WILL BE ACCURATE, RELIABLE, ERROR-FREE, OR UNINTERRUPTED, THAT DEFECTS WILL BE CORRECTED, THAT OUR PLATFORM OR THE SERVER THAT MAKES IT AVAILABLE ARE FREE OF VIRUSES OR OTHER HARMFUL COMPONENTS, OR THAT THE PLATFORM OR ANY SERVICES OR ITEMS OBTAINED THROUGH THE PLATFORM WILL OTHERWISE MEET YOUR NEEDS OR EXPECTATIONS"),
          verticalSpacing10,
          Paragraph(
              text:
                  "You understand that we cannot and do not guarantee or warrant that files available for downloading from the internet or the Platform will be free of viruses or other destructive code. You are responsible for implementing sufficient procedures and checkpoints to satisfy your particular requirements for anti-virus protection and accuracy of data input and output, and for maintaining a means external to our app for any reconstruction of any lost data. TO THE FULLEST EXTENT PROVIDED BY LAW, WE WILL NOT BE LIABLE FOR ANY LOSS OR DAMAGE CAUSED BY A DISTRIBUTED DENIAL-OF-SERVICE ATTACK, VIRUSES, OR OTHER TECHNOLOGICALLY HARMFUL MATERIAL THAT MAY INFECT YOUR COMPUTER EQUIPMENT, COMPUTER PROGRAMS, DATA, OR OTHER PROPRIETARY MATERIAL DUE TO YOUR USE OF THE PLATFORM OR ANY SERVICES OR ITEMS OBTAINED THROUGH THE PLATFORM OR TO YOUR DOWNLOADING OF ANY MATERIAL POSTED ON IT, OR ON ANY WEBSITE LINKED TO IT."),
          verticalSpacing10,
          Paragraph(
              text:
                  "THE FOREGOING DOES NOT AFFECT ANY WARRANTIES THAT CANNOT BE EXCLUDED OR LIMITED UNDER APPLICABLE LAW.")
        ],
      );

  Widget limitationOnLiability() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "LIMITATION ON LIABILITY"),
          verticalSpacing12,
          Paragraph(
              text:
                  "TO THE FULLEST EXTENT PROVIDED BY LAW, IN NO EVENT WILL AppLogo, ITS AFFILIATES, OR THEIR LICENSORS, SERVICE PROVIDERS, EMPLOYEES, AGENTS, OFFICERS, OR DIRECTORS BE LIABLE FOR DAMAGES OF ANY KIND, UNDER ANY LEGAL THEORY, ARISING OUT OF OR IN CONNECTION WITH YOUR USE, OR INABILITY TO USE, THE PLATFORM, ANY WEBSITES LINKED TO IT, ANY CONTENT ON THE PLATFORM OR SUCH OTHER WEBSITES, INCLUDING ANY DIRECT, INDIRECT, SPECIAL, INCIDENTAL, CONSEQUENTIAL, EXEMPLARY, OR PUNITIVE DAMAGES, INCLUDING BUT NOT LIMITED TO, PERSONAL INJURY, PAIN AND SUFFERING, EMOTIONAL DISTRESS, LOSS OF REVENUE, LOSS OF PROFITS, LOSS OF BUSINESS OR ANTICIPATED SAVINGS, LOSS OF USE, LOSS OF GOODWILL, LOSS OF DATA, AND WHETHER CAUSED BY TORT (INCLUDING NEGLIGENCE), BREACH OF CONTRACT, OR OTHERWISE, EVEN IF FORESEEABLE."),
          verticalSpacing10,
          Paragraph(
              text:
                  "YOU UNDERSTAND, AGREE AND ACKNOWLEDGE THAT OUR AGGREGATE LIABILITY FOR DAMAGES ARISING WITH RESPECT TO THIS AGREEMENT AND ANY AND ALL USE OF THE PLATFORM WILL NOT EXCEED THE TOTAL AMOUNT OF MONEY PAID BY YOU OR ON YOUR BEHALF THROUGH THE PLATFORM IN THE 12 MONTHS PERIOD PRIOR TO THE DATE OF THE CLAIM OR \$10,000, WHICHEVER IS LESS."),
          verticalSpacing10,
          Paragraph(
              text:
                  "The limitation of liability set out above does not apply to liability resulting from our gross negligence or willful misconduct."),
          verticalSpacing10,
          Paragraph(
              text:
                  "THE FOREGOING DOES NOT AFFECT ANY LIABILITY THAT CANNOT BE EXCLUDED OR LIMITED UNDER APPLICABLE LAW."),
          verticalSpacing10,
          Paragraph(
              text:
                  "If the applicable law does not allow the limitation of liability as set forth above, the limitation will be deemed modified solely to the extent necessary to comply with applicable law."),
        ],
      );

  Widget indemnification() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "INDEMNIFICATION"),
          verticalSpacing12,
          Paragraph(
              text:
                  "You agree to defend, indemnify, and hold harmless AppLogo, its affiliates, licensors, and service providers, and its and their respective officers, directors, employees, contractors, agents, licensors, suppliers, successors, and assigns from and against any claims, liabilities, damages, judgments, awards, losses, costs, expenses, or fees (including reasonable attorneys’ fees) arising out of or relating to your violation of these Terms of Use or your use of the Platform, including, but not limited to the following: (a) your access to or use of the Platform; (b) any actions made with your account or Account Access whether by you or by someone else; (c) your violation of any of the provisions of this Agreement; (d) non-payment for any of the services (including Healthcare Services) which were provided through the Platform; (e) your violation of any third party right, including, without limitation, any intellectual property right, publicity, confidentiality, property or privacy right; (f) your User Contributions; (g) any use of the Platform’s content, services, and products other than as expressly authorized in these Terms of Use, or (h) your use of any information obtained from the Platform. This clause shall survive expiration or termination of this Agreement."),
        ],
      );

  Widget governingLawAndJurisdiction() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "GOVERNING LAW AND JURISDICTION"),
          verticalSpacing12,
          Paragraph(
              text:
                  "All matters relating to the Platform and these Terms of Use, and any dispute or claim arising therefrom or related thereto (in each case, including non-contractual disputes or claims), shall be governed by and construed in accordance with the internal laws of the State of Florida without giving effect to any choice or conflict of law provision or rule (whether of the State of Florida or any other jurisdiction)."),
          verticalSpacing10,
          Paragraph(
              text:
                  "Any legal suit, action, or proceeding arising out of, or related to, these Terms of Use or the Platform shall be instituted exclusively in the federal courts of the United States or the courts of the State of Florida, in each case located in the City of Tallahassee and County of Leon, although we retain the right to bring any suit, action, or proceeding against you for breach of these Terms of Use in your country of residence or any other relevant country. You waive any and all objections to the exercise of jurisdiction over you by such courts and to venue in such courts."),
        ],
      );

  Widget Abitration() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "ARBITRATION"),
          verticalSpacing12,
          Paragraph(
              text:
                  "You agree to attempt, in good faith, to resolve all disputes arising from these Terms of Use or use of the Platform by negotiation between representatives with the authority to settle the controversy."),
          verticalSpacing10,
          Paragraph(
              text:
                  "If good faith negotiations do not resolve the dispute and the total amount in controversy is less than \$10,000, you agree that the matter will proceed to mediation to be conducted online through JAMSconnect. If mediation is not successful in resolving the dispute or the matter has a total amount in controversy greater than \$10,000, then you agree that we will proceed to the arbitration procedures in the next paragraph."),
          verticalSpacing10,
          Paragraph(
              text:
                  "At AppLogo’s sole discretion, it may require You to submit any disputes arising from these Terms of Use or use of the Platform, including disputes arising from or concerning their interpretation, violation, invalidity, non-performance, or termination, to final and binding arbitration administered by JAMS in Leon County, Florida, in accordance with the JAMS’ Streamlined Arbitration Rules of Procedure, or, if you do not reside in the United States, in accordance with JAMS International Arbitration Rules, applying Florida law. You also agree that arbitration must be on an individual basis, meaning neither you or AppLogo may join or consolidate claims in arbitration by or against other purchasers or users of the Platform, or litigate in court or arbitrate any claims as a representative or member of a class."),
        ],
      );

  Widget limitationOnTimeOfFileClaims() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "LIMITATION ON TIME TO FILE CLAIMS"),
          verticalSpacing12,
          Paragraph(
              text:
                  "ANY CAUSE OF ACTION OR CLAIM YOU MAY HAVE ARISING OUT OF OR RELATING TO THESE TERMS OF USE OR THE PLATFORM MUST BE COMMENCED WITHIN ONE (1) YEAR AFTER THE CAUSE OF ACTION ACCRUES; OTHERWISE, SUCH CAUSE OF ACTION OR CLAIM IS PERMANENTLY BARRED."),
        ],
      );

  Widget waiver_Severability() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "WAIVER AND SEVERABILITY"),
          verticalSpacing12,
          Paragraph(
              text:
                  "No waiver by AppLogo of any term or condition set out in these Terms of Use shall be deemed a further or continuing waiver of such term or condition or a waiver of any other term or condition, and any failure of AppLogo to assert a right or provision under these Terms of Use shall not constitute a waiver of such right or provision."),
          verticalSpacing10,
          Paragraph(
              text:
                  "If any provision of these Terms of Use is held by a court or other tribunal of competent jurisdiction to be invalid, illegal, or unenforceable for any reason, such provision shall be eliminated or limited to the minimum extent such that the remaining provisions of the Terms of Use will continue in full force and effect.")
        ],
      );

  Widget exportControl_Sanctions() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "EXPORT CONTROLS AND SANCTIONS "),
          verticalSpacing12,
          Paragraph(
              text:
                  "AppLogo products may be subject to US export and re-export control laws and regulations or similar laws applicable in other jurisdictions, including the Export Administration Regulations (“EAR”) maintained by the US Department of Commerce, trade and economic sanctions maintained by the US Treasury Department’s Office of Foreign Assets Control (“OFAC”), and the International Traffic in Arms Regulations (“ITAR”) maintained by the US Department of State. You warrant that you are (1) not located in any country to which the United States has embargoed goods or has otherwise applied any economic sanctions; and (2) not a denied party as specified in any applicable export or re-export laws or regulations or similar laws applicable in other jurisdictions or otherwise listed on any US government list of prohibited or restricted parties."),
          verticalSpacing10,
          Paragraph(
              text:
                  "You agree to comply with all applicable export and reexport control laws and regulations, including without limitation the EAR and trade and economic sanctions maintained by OFAC. Specifically, you agree not to—directly or indirectly—use, sell, export, reexport, transfer, divert, release, or otherwise dispose of any products, software, or technology (including products derived from or based on such technology) received from AppLogo under these Terms to any destination, entity, or person or for any end-use prohibited by the EAR, trade and economic sanctions maintained by OFAC, or any applicable laws or regulations of the United States or any other jurisdiction without obtaining any required prior authorization from the competent government authorities as required by those laws and regulations."),
        ],
      );

  Widget attorneyFees_WaiverJuryTrail_Interpretation() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "ATTORNEYS’ FEES."),
          verticalSpacing12,
          Paragraph(
              text:
                  "In the event that any action, suit, or other legal or administrative proceeding is instituted or commenced by either Party hereto against the other Party arising out of or related to this Agreement, the prevailing Party is entitled to recover its reasonable attorneys’ fees and court costs from the non-prevailing Party"),
          verticalSpacing16,
          Headings(text: "WAIVER OF JURY TRIAL"),
          verticalSpacing12,
          Paragraph(
              text:
                  "Each Party irrevocably and unconditionally waives any right it may have to a trial by jury in respect of any legal action arising out of or relating to this Agreement or the transactions contemplated hereby"),
          verticalSpacing16,
          Headings(text: "INTERPRETATION."),
          verticalSpacing12,
          Paragraph(
              text:
                  "For purposes of these Terms, (a) the words “include,” “includes” and “including” are deemed to be followed by the words “without limitation”; (b) the word “or” is not exclusive; (c) the words “herein,” “hereof,” “hereby,” “hereto” and “hereunder” refer to this Agreement as a whole; (d) words denoting the singular have a comparable meaning when used in the plural, and vice-versa; and (e) words denoting any gender include all genders. Unless the context otherwise requires, references in this Agreement: (x) to sections, exhibits, attachments and appendices mean the sections of, and exhibits, attachments and appendices attached to, this Agreement; (y) to an agreement, instrument or other document means such agreement, instrument or other document as amended, supplemented and modified from time to time to the extent permitted by the provisions thereof; and (z) to a statute means such statute as amended from time to time and includes any successor legislation thereto and any regulations promulgated thereunder. The Parties intend this Agreement to be construed without regard to any presumption or rule requiring construction or interpretation against the Party drafting an instrument or causing any instrument to be drafted. The exhibits, attachments, appendices, agreements, policies, and procedures referred to herein are an integral part of this Agreement to the same extent as if they were set forth verbatim herein"),
        ],
      );

  Widget headings_EntireAgreement_Notices_YouCommentsAndConcerns() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headings(text: "HEADINGS"),
          verticalSpacing12,
          Paragraph(
              text:
                  "The headings in this Agreement are for reference only and shall not affect the interpretation of this Agreement"),
          verticalSpacing16,
          Headings(text: "ENTIRE AGREEMENT"),
          verticalSpacing12,
          Paragraph(
              text:
                  "The Terms of Use, our Privacy Policy, and our Copyright DMCA Policy constitute the sole and entire agreement between you and AppLogo regarding the Platform and supersede all prior and contemporaneous understandings, agreements, representations, and warranties, both written and oral, regarding the Platform."),
          verticalSpacing16,
          Headings(text: "NOTICES"),
          verticalSpacing12,
          Paragraph(
              text:
                  "We may provide notices or other communications to you regarding this agreement or any aspect of the Platform, by email to the email address that we have on record, by regular mail or by posting it online. The date of receipt shall be deemed the date  on which such notice is given. Notices sent to us must be delivered by email to info@AppLogo.com."),
          verticalSpacing10,
          Headings(
            text: "Notice to California Residents:",
            fontsize: 16,
            italic: true,
          ),
          verticalSpacing10,
          Paragraph(
              text:
                  "The Board of Behavioral Sciences receives and responds to complaints regarding services provided within the scope of practice of (marriage and family therapists, clinical social workers, or professional clinical therapists). You may contact the board online at www.bbs.ca.gov, or by calling (916) 574-7830."),
          verticalSpacing16,
          Headings(text: "YOUR COMMENTS AND CONCERNS"),
          verticalSpacing12,
          Paragraph(
              text:
                  "This Platform is operated by AppLogo, a limited liability company registered in Florida."),
          verticalSpacing10,
          Paragraph(
              text:
                  "All notices of copyright infringement claims should be sent to the copyright agent designated in our Copyright DMCA Policy, available at AppLogo.com/legal/copyright-dmca-policy in the manner and by the means set out therein."),
          verticalSpacing10,
          Paragraph(
              text:
                  "All other feedback, comments, requests for technical support, and other communications relating to the Platform should be directed to the following email address: info@AppLogo.com."),
        ],
      );
}
