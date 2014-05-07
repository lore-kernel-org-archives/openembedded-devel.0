Return-Path: <nick.lewis@usa.g4s.com>
Received: from mail1.bemta14.messagelabs.com (mail1.bemta14.messagelabs.com
	[193.109.254.105])
	by mail.openembedded.org (Postfix) with ESMTP id 070BF60559
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 12:07:23 +0000 (UTC)
Received: from [85.158.140.195:32459] by server-1.bemta-14.messagelabs.com id
	00/85-00839-BF12A635; Wed, 07 May 2014 12:07:23 +0000
X-Env-Sender: nick.lewis@usa.g4s.com
X-Msg-Ref: server-6.tower-193.messagelabs.com!1399464443!11122000!1
X-Originating-IP: [89.206.228.155]
X-StarScan-Received: 
X-StarScan-Version: 6.11.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5570 invoked from network); 7 May 2014 12:07:23 -0000
Received: from unallocated.star.net.uk (HELO gbtwk10s038.Technology.local)
	(89.206.228.155)
	by server-6.tower-193.messagelabs.com with RC4-SHA encrypted SMTP;
	7 May 2014 12:07:23 -0000
Received: from GBTWK10E001.Technology.local ([10.234.1.29]) by
	gbtwk10s038.Technology.local ([10.234.1.40]) with mapi; Wed, 7 May 2014
	13:07:23 +0100
From: "Lewis, Nick" <nick.lewis@usa.g4s.com>
To: "'openembedded-devel@lists.openembedded.org'"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 7 May 2014 13:07:22 +0100
Thread-Topic: [oe] Fix for libxml++_ptest.patch with out-of-source build
Thread-Index: Ac9pK4mbW4sFdOQsQFSIp5+yt9wqjgAI8dsAACW+3fA=
Message-ID: <AAE0766F5AF36B46BAB7E0EFB92732063397EB4BC6@GBTWK10E001.Technology.local>
References: <AAE0766F5AF36B46BAB7E0EFB92732063397EB4BC0@GBTWK10E001.Technology.local>
	<2c12c9ff705a424c99db08f7cfa57c0a@BL2PR04MB852.namprd04.prod.outlook.com>
In-Reply-To: <2c12c9ff705a424c99db08f7cfa57c0a@BL2PR04MB852.namprd04.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: Fix for libxml++_ptest.patch with out-of-source build
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
X-List-Received-Date: Wed, 07 May 2014 12:07:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>thanks for the note. However I would encourage you to submit a patch for m=
eta-oe if you can guidelines are here
>
>http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
>
>Thanks

Khem

I cannot use git send-email as only MAPI email is supported here . However =
I have redone the patch using git format-patch -s and pasted it into an ema=
il under the title "libxml plus plus ptest with B noteq S". I hope this can=
 be applied in a similar way

Please let me know if there are any problems with it

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

