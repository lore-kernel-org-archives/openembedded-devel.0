Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1PLw3r-0001fT-DQ
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Nov 2010 12:01:51 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 21E941D36171; Fri, 26 Nov 2010 12:00:34 +0100 (CET)
Date: Fri, 26 Nov 2010 12:00:34 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101126110034.GF10755@ibawizard.net>
References: <1290768432-13366-1-git-send-email-ynezz@true.cz>
	<AANLkTi=SB9wuO4wcTXz3M5fYb2WyO09_pK3ooA+i4xgo@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=SB9wuO4wcTXz3M5fYb2WyO09_pK3ooA+i4xgo@mail.gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] angstrom-2008.1: bump uclibc to 0.9.30.3 which	unbreaks x264
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
X-List-Received-Date: Fri, 26 Nov 2010 11:01:51 -0000
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Andrea Adami <andrea.adami@gmail.com> [2010-11-26 11:53:50]:

> > -PREFERRED_VERSION_uclibc =A0 =A0 =A0 =A0 =A0 =A0 =A0 ?=3D "0.9.30.2"
> > -PREFERRED_VERSION_uclibc-initial =A0 =A0 =A0 ?=3D "0.9.30.2"
> > +PREFERRED_VERSION_uclibc =A0 =A0 =A0 =A0 =A0 =A0 =A0 ?=3D "0.9.30.3"
> > +PREFERRED_VERSION_uclibc-initial =A0 =A0 =A0 ?=3D "0.9.30.3"
>=20
> Hi,

Hi,

> Unfortunately build will fail on e2fsprogs afterwards.
> See http://lists.linuxtogo.org/pipermail/angstrom-distro-devel/2010-Nov=
ember/004257.html

ok, so then I'll fix e2fsprogs :-)

> So I suppose we should do a combined upgrade of uclibc and binutils.
> I'll test with current gcc-4.3.3 and let you know.

Ok, I don't mind how, just fix it please, it's all errors on release-2010=
.12
branch...

-- ynezz


