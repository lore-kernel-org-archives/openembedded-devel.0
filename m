Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qmu0s-0002fe-S1
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jul 2011 22:50:30 +0200
Received: (qmail invoked by alias); 29 Jul 2011 20:46:13 -0000
Received: from p4FDF15A5.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.21.165]
	by mail.gmx.net (mp039) with SMTP; 29 Jul 2011 22:46:13 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18HBPQ4uG4HsD6O+3NihqfdcyiVNYuDQ9G+eOUw2q
	P81umnYqwTPv/k
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Jul 2011 22:48:49 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-92.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <1311966065.3882.90.camel@mattotaupa>
In-Reply-To: <1311966065.3882.90.camel@mattotaupa>
MIME-Version: 1.0
Message-Id: <201107292248.49790.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH 2/2] iceauth: Add `LICENSE = "MIT-X"`
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
X-List-Received-Date: Fri, 29 Jul 2011 20:50:31 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Friday, July 29, 2011 09:01:05 PM Paul Menzel wrote:
> Date: Fri, 29 Jul 2011 20:47:22 +0200
>=20
> This license is listed online for example at the Web site of XFree86 [1],
> Debian [2]. No name of the license is mentioned there. Gentoo just uses
> =BBMIT=AB [3].
>=20
> There are some packages in OpenEmbedded using `MIT-X` and I guess they
> refer to the same license. I prefer =BBX/MIT=AB derived from the chapter =
name
> of [1] =BBMIT/X Licenses=AB.
>=20
> [1] http://www.xfree86.org/current/LICENSE5.html
> [2]
> http://packages.debian.org/changelogs/pool/main/x/x11-xserver-utils/x11-xs
> erver-utils_7.6+3/x11-xserver-utils.copyright [3]
> http://gpo.zugaina.org/x11-apps/iceauth/euscan
oe-core seems to prefer MIT too [1]. iceauth license looks same but appends=
=20
additional sentence. So if no objections I will coose MIT in next version o=
f=20
patch for meta-oe.

Andreas

[1] http://cgit.openembedded.org/cgit.cgi/openembedded-
core/tree/meta/files/common-licenses/MIT


