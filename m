Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=TX2EHSOBE004.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Soumya.R@kpitcummins.com>) id 1ORHEi-0000vD-Vn
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 06:06:54 +0200
Received: from mail37-tx2-R.bigfish.com (10.9.14.241) by
	TX2EHSOBE004.bigfish.com (10.9.40.24) with Microsoft SMTP Server id
	8.1.340.0; Wed, 23 Jun 2010 04:02:15 +0000
Received: from mail37-tx2 (localhost.localdomain [127.0.0.1])	by
	mail37-tx2-R.bigfish.com (Postfix) with ESMTP id 79B59DA032B	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jun 2010 04:02:15 +0000 (UTC)
X-SpamScore: -47
X-BigFish: VPS-47(zz1432N98dN14ffO936eM1447R1443N9371Pzz1202hzzz32i2a8h43h61h)
Received: from mail37-tx2 (localhost.localdomain [127.0.0.1]) by mail37-tx2
	(MessageSwitch) id 1277265734925275_29352;
	Wed, 23 Jun 2010 04:02:14 +0000 (UTC)
Received: from TX2EHSMHS015.bigfish.com (unknown [10.9.14.237])	by
	mail37-tx2.bigfish.com (Postfix) with ESMTP id D50F4B004C	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jun 2010 04:02:14 +0000 (UTC)
Received: from kcinpunhjhc02.kpit.com (220.225.38.51) by
	TX2EHSMHS015.bigfish.com (10.9.99.115) with Microsoft SMTP Server (TLS)
	id 14.0.482.44; Wed, 23 Jun 2010 04:02:12 +0000
Received: from Kcinpunhjcms01.kpit.com ([169.254.1.87]) by
	kcinpunhjhc02.kpit.com ([172.10.16.124]) with mapi;
	Wed, 23 Jun 2010 09:32:10 +0530
From: Soumya R <Soumya.R@kpitcummins.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 23 Jun 2010 09:32:09 +0530
Thread-Topic: [oe] Qt-4.7.0.beta1 Missing or unbuildable dependency chain
	was: ['qt4-embedded-mkspecs']
Thread-Index: AcsSG7vSmJc/DSc0QliU9AJvRDKLogAa+fTl
Message-ID: <76E258664B189C4CBEF125491CA11ECC9445E0CFBC@KCINPUNHJCMS01.kpit.com>
References: <76E258664B189C4CBEF125491CA11ECC9445E0CFB6@KCINPUNHJCMS01.kpit.com>,
	<20100622145537.GC32544@gmail.com>
In-Reply-To: <20100622145537.GC32544@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-Reverse-DNS: unknown
X-SA-Exim-Connect-IP: 65.55.88.12
X-SA-Exim-Mail-From: Soumya.R@kpitcummins.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Qt-4.7.0.beta1 Missing or unbuildable dependency chain was: ['qt4-embedded-mkspecs']
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
X-List-Received-Date: Wed, 23 Jun 2010 04:06:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

 Khem,
   =

    Thanks for the reply.. Its my own recipe.. How do i resolve it??

Regards,
Soumya
________________________________________
From: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel=
-bounces@lists.openembedded.org] On Behalf Of Khem Raj [raj.khem@gmail.com]=

Sent: Tuesday, June 22, 2010 8:25 PM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] Qt-4.7.0.beta1 Missing or unbuildable dependency chain wa=
s: ['qt4-embedded-mkspecs']

On (22/06/10 11:35), Soumya R wrote:
> Hi All,
>
>       I am trying to build Qt Embedded SDK for Qt-4.7.0.beta1.. when i ru=
n
> bitbake meta-toolchain-avn-qte i got the following error
>
>
> NOTE: Handling BitBake files: - (0169/0169) [100 %]
> NOTE: Parsing finished. 163 cached, 5 parsed, 1 skipped, 0 masked.
> NOTE: Resolving any missing task queue dependencies
> ERROR: '['/home/likewise-open/KPIT/soumyar/openembedded/recipes/tasks/tas=
k-avn-qte-toolchain-target.bb']' RDEPENDS/RRECOMMENDS or otherwise requires=
 the runtime entity 'qt4-embedded-mkspecs' but it wasn't found in any PACKA=
GE or RPROVIDES variables
> NOTE: Runtime target 'qt4-embedded-mkspecs' is unbuildable, removing...

I dont see this recipe in oe repo. Is it your own recipe ?

> Missing or unbuildable dependency chain was: ['qt4-embedded-mkspecs']
> NOTE: Runtime target 'task-avn-qte-toolchain-target' is unbuildable, remo=
ving...
> Missing or unbuildable dependency chain was: ['task-avn-qte-toolchain-tar=
get', 'qt4-embedded-mkspecs']
> ERROR: Required build target 'meta-toolchain-avn-qte' has no buildable pr=
oviders.
> Missing or unbuildable dependency chain was: ['meta-toolchain-avn-qte', '=
task-avn-qte-toolchain-target', 'qt4-embedded-mkspecs']
>
>      It is asking for runtime dependencies  'qt4-embedded-mkspecs' how do=
 I get these packages???
>
> Thanks in advance:-)
>
>
> Regards,
> Soumya
>
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Cummins Infosystems Ltd. It is intended onl=
y for the person to whom it is addressed. If you are not the intended recip=
ient, you are not authorized to read, print, retain copy, disseminate, dist=
ribute, or use this message or any part thereof. If you receive this messag=
e in error, please notify the sender immediately and delete all copies of t=
his message. KPIT Cummins Infosystems Ltd. does not accept any liability fo=
r virus infected mails.
>
>

Crap. You are talking on public mailing lists and these are archived. These=
 notices dont make sense and in future make
sure that you strip them off when sending emails to public mailing lists.

>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

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




