Received: from outbound-va3.frontbridge.com ([216.32.180.16]
	helo=VA3EHSOBE010.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Soumya.R@kpitcummins.com>) id 1OP87M-0000VB-EE
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jun 2010 07:58:25 +0200
Received: from mail104-va3-R.bigfish.com (10.7.14.237) by
	VA3EHSOBE010.bigfish.com (10.7.40.12) with Microsoft SMTP Server id
	8.1.340.0; Thu, 17 Jun 2010 05:53:52 +0000
Received: from mail104-va3 (localhost.localdomain [127.0.0.1])	by
	mail104-va3-R.bigfish.com (Postfix) with ESMTP id A6399B98517	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jun 2010 05:53:52 +0000 (UTC)
X-SpamScore: -41
X-BigFish: VPS-41(zz1432N98dN14ffO936eM1447R9371Pzz1202hzzz32i2a8h43h61h)
Received: from mail104-va3 (localhost.localdomain [127.0.0.1]) by mail104-va3
	(MessageSwitch) id 1276754032365945_5459;
	Thu, 17 Jun 2010 05:53:52 +0000 (UTC)
Received: from VA3EHSMHS016.bigfish.com (unknown [10.7.14.250])	by
	mail104-va3.bigfish.com (Postfix) with ESMTP id 500688F804C	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jun 2010 05:53:52 +0000 (UTC)
Received: from kcinpunhjhc02.kpit.com (220.225.38.51) by
	VA3EHSMHS016.bigfish.com (10.7.99.26) with Microsoft SMTP Server (TLS)
	id 14.0.482.44; Thu, 17 Jun 2010 05:53:51 +0000
Received: from Kcinpunhjcms01.kpit.com ([169.254.1.87]) by
	kcinpunhjhc02.kpit.com ([172.10.16.124]) with mapi;
	Thu, 17 Jun 2010 11:23:48 +0530
From: Soumya R <Soumya.R@kpitcummins.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Jun 2010 11:20:29 +0530
Thread-Topic: [oe] OpenEmbedded SDK
Thread-Index: AcsN3/J2m7RDn/TRS7uwo6MezS0iXgAAQuXG
Message-ID: <76E258664B189C4CBEF125491CA11ECC9445E0CFB0@KCINPUNHJCMS01.kpit.com>
References: <76E258664B189C4CBEF125491CA11ECC9445E0CFAF@KCINPUNHJCMS01.kpit.com>,
	<4C19B59F.70008@freyther.de>
In-Reply-To: <4C19B59F.70008@freyther.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-Reverse-DNS: unknown
X-SA-Exim-Connect-IP: 216.32.180.16
X-SA-Exim-Mail-From: Soumya.R@kpitcummins.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OpenEmbedded SDK
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Jun 2010 05:58:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
  =

   Thanks for the reply.. I have created our own image for mipsel in openem=
bedded..
I know to write own machine ,distro and kernel compilation..SDK is new to m=
e so can you =

guide how can i start with that..

Thanks & Regards,
Soumya
________________________________________
From: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel=
-bounces@lists.openembedded.org] On Behalf Of Holger Freyther [holger+oe@fr=
eyther.de]
Sent: Thursday, June 17, 2010 11:11 AM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] OpenEmbedded SDK

On 06/17/2010 01:25 PM, Soumya R wrote:
> Hi All,
>
>    I am new to this OpenEmbedded SDK.. I am using Ubuntu 10.4 for the hos=
t machine
> and mips DB1300 for the target.. Please send me some useful links which I=
 can follow
> and start with openEmbedded SDK..

Hi,

what have you done so far? what information have you read so far? Have
you seen the wiki? Have you seen docs.openembedded.org?

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


This message contains information that may be privileged or confidential an=
d is the property of the KPIT Cummins Infosystems Ltd. It is intended only =
for the person to whom it is addressed. If you are not the intended recipie=
nt, you are not authorized to read, print, retain copy, disseminate, distri=
bute, or use this message or any part thereof. If you receive this message =
in error, please notify the sender immediately and delete all copies of thi=
s message. KPIT Cummins Infosystems Ltd. does not accept any liability for =
virus infected mails.




