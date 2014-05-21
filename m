Return-Path: <nick.lewis@usa.g4s.com>
Received: from mail1.bemta14.messagelabs.com (unknown [193.109.254.120])
	by mail.openembedded.org (Postfix) with ESMTP id C149865EB4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 15:26:17 +0000 (UTC)
Received: from [85.158.140.195:20731] by server-16.bemta-14.messagelabs.com id
	A7/56-16986-995CC735; Wed, 21 May 2014 15:26:17 +0000
X-Env-Sender: nick.lewis@usa.g4s.com
X-Msg-Ref: server-9.tower-193.messagelabs.com!1400685947!13532445!3
X-Originating-IP: [89.206.228.155]
X-StarScan-Received: 
X-StarScan-Version: 6.11.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15817 invoked from network); 21 May 2014 15:26:15 -0000
Received: from unallocated.star.net.uk (HELO gbtwk10s038.Technology.local)
	(89.206.228.155)
	by server-9.tower-193.messagelabs.com with RC4-SHA encrypted SMTP;
	21 May 2014 15:26:15 -0000
Received: from GBTWK10E001.Technology.local ([10.234.1.29]) by
	gbtwk10s038.Technology.local ([10.234.1.40]) with mapi; Wed, 21 May 2014
	16:25:50 +0100
From: "Lewis, Nick" <nick.lewis@usa.g4s.com>
To: 'Paul Eggleton' <paul.eggleton@linux.intel.com>
Date: Wed, 21 May 2014 16:25:50 +0100
Thread-Topic: [oe] [poky]: libusb1_1.0.18.bb: configure: error: "udev
	support	requested but libudev not installed"
Thread-Index: AQHPdNRL/HXxS8hkOU2Kuiqo8aJf7ptLJzmQ
Message-ID: <AAE0766F5AF36B46BAB7E0EFB927320633FFF45D6C@GBTWK10E001.Technology.local>
References: <5d1edcab304d4fbb8e6349d49bb62e98@BL2PR04MB852.namprd04.prod.outlook.com>
	<AAE0766F5AF36B46BAB7E0EFB927320633FFF45D6A@GBTWK10E001.Technology.local>
	<58fd9e7d667447b3833cf3cb855f66dd@BL2PR04MB852.namprd04.prod.outlook.com>
In-Reply-To: <58fd9e7d667447b3833cf3cb855f66dd@BL2PR04MB852.namprd04.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [poky]: libusb1_1.0.18.bb: configure: error: "udev support	requested but libudev not installed"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 May 2014 15:26:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> FYI the fix for this issue is now merged as of yesterday.
Thx - our autobuilder worked fine last night
--
Nick

The details of this company are as follows:
G4S Technology Limited, Registered Office: Challenge House, International D=
rive, Tewkesbury, Gloucestershire GL20 8UQ, Registered in England No. 23823=
38.

This communication may contain information which is confidential, personal =
and/or privileged.

It is for the exclusive use of the intended recipient(s).
If you are not the intended recipient(s), please note that any distribution=
, forwarding, copying or use of this communication or the information in it=
 is strictly prohibited.

Any personal views expressed in this e-mail are those of the individual sen=
der and the company does not endorse or accept responsibility for them.

Prior to taking any action based upon this e-mail message, you should seek =
appropriate confirmation of its authenticity.

This e-mail has been scanned for all viruses by MessageLabs.

