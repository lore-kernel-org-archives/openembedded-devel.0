Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mickey@vanille-media.de>) id 1T9xnl-0005Xw-1q
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Sep 2012 14:36:49 +0200
Received: from granit.localdomain (e182221015.adsl.alicedsl.de [85.182.221.15])
	by phalanx.drlauer-research.com (Postfix) with ESMTPSA id 6C3FD584076
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Sep 2012 15:22:16 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
In-Reply-To: <CACW_hTYFeqSYx5R9rgf9vV0GG-iTcnjKx+czrVXX=rUTx2z_xw@mail.gmail.com>
Date: Fri, 7 Sep 2012 14:16:03 +0200
Message-Id: <C719E0F2-0095-4A37-83E7-A65E065E880B@vanille-media.de>
References: <CACW_hTYFeqSYx5R9rgf9vV0GG-iTcnjKx+czrVXX=rUTx2z_xw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1486)
Subject: Re: oe classic: eglibc
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
X-List-Received-Date: Fri, 07 Sep 2012 12:36:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Am 07.09.2012 um 13:27 schrieb Frans Meulenbroeks =
<fransmeulenbroeks@gmail.com>:
> Not sure if anyone is still interested in oe classic, but while =
rebuilding
> some sw using oe classic I noticed the eglibc recipes did not build =
any
> more as upstream changed things in the repo.
> I've locally fixed this by changing SRC_URI from
> SRC_URI =3D =
"svn://svn.eglibc.org/branches;module=3D${EGLIBC_BRANCH};proto=3Dsvn \
> into
> SRC_URI =3D "svn://
> www.eglibc.org/svn/branches;module=3D${EGLIBC_BRANCH};proto=3Dhttp \
>=20
> builds and tests fine. If anyone is tempted, feel free to author a =
patch.

Thanks!

:M:=


