Received: from db3ehsobe002.messaging.microsoft.com ([213.199.154.140]
	helo=DB3EHSOBE002.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Soumya.R@kpitcummins.com>) id 1OUWRF-0005Ka-8W
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 04:57:19 +0200
Received: from mail7-db3-R.bigfish.com (10.3.81.254) by
	DB3EHSOBE002.bigfish.com (10.3.84.22) with Microsoft SMTP Server id
	8.1.436.0; Fri, 2 Jul 2010 02:52:13 +0000
Received: from mail7-db3 (localhost.localdomain [127.0.0.1])	by
	mail7-db3-R.bigfish.com (Postfix) with ESMTP id 5A7A51760369	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jul 2010 02:52:13 +0000 (UTC)
X-SpamScore: -36
X-BigFish: VPS-36(zz1432N98dN14ffO1447R9371Pzz1202hzzz32i2a8h)
Received: from mail7-db3 (localhost.localdomain [127.0.0.1]) by mail7-db3
	(MessageSwitch) id 1278039133149341_9431;
	Fri,  2 Jul 2010 02:52:13 +0000 (UTC)
Received: from DB3EHSMHS009.bigfish.com (unknown [10.3.81.254])	by
	mail7-db3.bigfish.com (Postfix) with ESMTP id 186651AD004E	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jul 2010 02:52:13 +0000 (UTC)
Received: from Kcinpunhjhc01.kpit.com (203.197.93.240) by
	DB3EHSMHS009.bigfish.com (10.3.87.109) with Microsoft SMTP Server (TLS)
	id 14.0.482.44; Fri, 2 Jul 2010 02:52:11 +0000
Received: from Kcinpunhjcms01.kpit.com ([169.254.1.87]) by
	Kcinpunhjhc01.kpit.com ([172.10.16.123]) with mapi;
	Fri, 2 Jul 2010 08:22:08 +0530
From: Soumya R <Soumya.R@kpitcummins.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 2 Jul 2010 08:20:16 +0530
Thread-Topic: [oe] (no subject)
Thread-Index: AcsZUGlCfMNCjubER2a60L0tqFgg9AAQOPu3
Message-ID: <76E258664B189C4CBEF125491CA11ECC9445E0CFE5@KCINPUNHJCMS01.kpit.com>
References: <76E258664B189C4CBEF125491CA11ECC9445E0CFE2@KCINPUNHJCMS01.kpit.com>,
	<AANLkTinTVmPf0NBVfHwS-VjuEPn5J-WfJMG0fAlXZvKs@mail.gmail.com>
In-Reply-To: <AANLkTinTVmPf0NBVfHwS-VjuEPn5J-WfJMG0fAlXZvKs@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-Reverse-DNS: Kcinpunhjhc01.kpit.com
X-SA-Exim-Connect-IP: 213.199.154.140
X-SA-Exim-Mail-From: Soumya.R@kpitcummins.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: (No subject)
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
X-List-Received-Date: Fri, 02 Jul 2010 02:57:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks for the reply.. Yes ofcourse i forgot it will not repeat again sorry=
..

Regards,
Soumya
________________________________________
From: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel=
-bounces@lists.openembedded.org] On Behalf Of Khem Raj [raj.khem@gmail.com]=

Sent: Friday, July 02, 2010 12:34 AM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] (no subject)

On Thu, Jul 1, 2010 at 3:19 AM, Soumya R <Soumya.R@kpitcummins.com> wrote:
> Hi All,
>
>      I need to include root file system in my uImage how can i
> do that in OpenEmbedded.

look into initramfs.
Dont you think adding subject to email makes sense.?

>
> Regards,
> Soumya
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




