Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mickey@vanille-media.de>) id 1QM0MH-00029H-C2
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 18:09:25 +0200
Received: from [192.168.2.2] (e180160125.adsl.alicedsl.de [85.180.160.125])
	by phalanx.drlauer-research.com (Postfix) with ESMTPSA id 6626358410E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 18:32:50 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4DD112EA.6090803@eukrea.com>
References: <1305541323-19773-1-git-send-email-sgh@sgh.dk>
	<02AB4574-909D-46A2-98E2-585E7A72BEE5@vanille-media.de>
	<4DD112EA.6090803@eukrea.com>
Organization: Vanille-Media
Date: Mon, 16 May 2011 18:06:50 +0200
Message-ID: <1305562010.11918.15.camel@saphir>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH 3/3] angstrom: Prefer Qt 4.7.3
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
X-List-Received-Date: Mon, 16 May 2011 16:09:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 16.05.2011, 14:04 +0200 schrieb Eric B=C3=A9nard:
> On 16/05/2011 13:38, Dr. Michael Lauer wrote:
> > I reckon you tested Qt 4.7.3 with PyQt before deleting 4.7.2...
>=20
> oops, I just launched bitbake python-pyqt, sorry I'll revert 4.7.2 dele=
tion if=20
> pyqt compilation fails.

No problem, usually I don't care too much about minor updates,
however PyQt is _very_ finnicky when it comes to the matching Qt version
-- and I just repaired it after it broke by a Qt delete some months
ago ;)

Thanks,
--=20
:M:



