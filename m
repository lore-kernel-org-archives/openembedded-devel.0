Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qyti9-0004EL-M7
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 00:56:45 +0200
Received: (qmail invoked by alias); 31 Aug 2011 22:51:48 -0000
Received: from p4FDF0F36.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.15.54]
	by mail.gmx.net (mp015) with SMTP; 01 Sep 2011 00:51:48 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19J/pZGs1FJ8ukxqLV4W8o0pq9C9h2ouVztMQs2es
	hg6N72LhzAxgRI
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 1 Sep 2011 00:55:14 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-95.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <201108310825.16407.schnitzeltony@gmx.de>
In-Reply-To: <201108310825.16407.schnitzeltony@gmx.de>
MIME-Version: 1.0
Message-Id: <201109010055.14620.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: meta-oe: midori build fails with linker error
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
X-List-Received-Date: Wed, 31 Aug 2011 22:56:45 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wednesday, August 31, 2011 08:25:16 AM Andreas M=FCller wrote:
[...]
> angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.5.4/ld: note:
> 'JSContextGetGlobalObject' is defined in DSO /home/Superandy/tmp/oe-core-
> eglibc/sysroots/overo/usr/lib/libjavascriptcoregtk-1.0.so.0 so try adding
> it to the linker command line
>=20
> | /home/Superandy/tmp/oe-core-
>=20
> eglibc/sysroots/overo/usr/lib/libjavascriptcoregtk-1.0.so.0: could not re=
ad
> symbols: Invalid operation
>=20
> | collect2: ld returned 1 exit status
we are not alone [1]...

Andreas

[1] https://bugs.launchpad.net/midori/+bug/799196


