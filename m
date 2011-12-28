Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RfijU-0003Ml-9E
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Dec 2011 02:55:09 +0100
Received: from mail72-ch1-R.bigfish.com (10.43.68.254) by
	CH1EHSOBE018.bigfish.com (10.43.70.68) with Microsoft SMTP Server id
	14.1.225.23; Wed, 28 Dec 2011 01:32:11 +0000
Received: from mail72-ch1 (localhost [127.0.0.1])	by mail72-ch1-R.bigfish.com
	(Postfix) with ESMTP id CECE6700082	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2011 01:32:34 +0000 (UTC)
X-SpamScore: -14
X-BigFish: VS-14(z21eN98bRz9371I98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3hbe9n)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail72-ch1 (localhost.localdomain [127.0.0.1]) by mail72-ch1
	(MessageSwitch) id 1325035952164989_31501;
	Wed, 28 Dec 2011 01:32:32 +0000 (UTC)
Received: from CH1EHSMHS016.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.250])	by mail72-ch1.bigfish.com (Postfix) with ESMTP id
	C101B480050 for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2011 01:32:31 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS016.bigfish.com
	(10.43.70.16) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 28 Dec 2011 01:32:06 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.86]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0355.003; Tue, 27 Dec 2011 19:32:25 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH v2 meta-oe 1/7] xmlto: add version 0.0.25
Thread-Index: AQHMxQCNB5tU42ylrkWXcGiVmmVOhA==
Date: Wed, 28 Dec 2011 01:32:24 +0000
Message-ID: <CAEsOVNc05t2eoOqYo8U1Ktz4O4cKNgnve2qMLgB0_qn+7H4JDA@mail.gmail.com>
References: <1324447304-4874-1-git-send-email-b19537@freescale.com>
	<20111223100335.GO12791@jama.jama.net>
In-Reply-To: <20111223100335.GO12791@jama.jama.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH v2 meta-oe 1/7] xmlto: add version 0.0.25
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
X-List-Received-Date: Wed, 28 Dec 2011 01:55:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <D804A5A56563D64FB9845ED743E9BC0F@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 23, 2011 at 4:03 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> Is there plan to provide native stylesheets too? Because after building
> xmlto-native some packages are failing because they detect xmlto-native
> available but don't check if all needed stylesheets are installed.

Can you help us out here and tell us what package would provide these?

-M=



