Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1N68br-00054F-07
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 21:07:10 +0100
Received: from [192.168.1.105] (e180132129.adsl.alicedsl.de [85.180.132.129])
	by drlauer-research.com (Postfix) with ESMTP id 84848128000C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2009 21:51:21 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200910302130.17290.david.lanzendoerfer@o2s.ch>
References: <200910302130.17290.david.lanzendoerfer@o2s.ch>
Organization: Vanille-Media
Date: Thu, 05 Nov 2009 21:05:50 +0100
Message-ID: <1257451550.4676.8.camel@andromeda>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] htc-msm7.inc
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
X-List-Received-Date: Thu, 05 Nov 2009 20:07:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 30.10.2009, 21:30 +0100 schrieb David Lanzend=C3=B6rfer:
> For htcdream (for example) is an yaffs2-image needed for flashing into=20
> internal memory.

I'd like to see a sane default here, should we patch it to
IMAGE_FSTYPES =3D "yaffs2 tar.gz" ?

Cheers,

--=20
:M:



