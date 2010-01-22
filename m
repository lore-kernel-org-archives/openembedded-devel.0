Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1NYMD6-0007DF-D4
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 17:18:15 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 2813C1D3607A; Fri, 22 Jan 2010 17:15:53 +0100 (CET)
Date: Fri, 22 Jan 2010 17:15:52 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100122161552.GN18793@ibawizard.net>
References: <1264067024.3695.14.camel@mattotaupa.wohnung.familie-menzel.net>
	<201001211102.11252.holger+oe@freyther.de>
	<883120D4-C490-4713-B872-F02376E88CEE@vanille-media.de>
	<hj9giu$mfp$1@ger.gmane.org> <1264111223.7697.31.camel@utx.utx.cz>
	<hjan00$419$1@ger.gmane.org> <20100122114443.GL18793@ibawizard.net>
	<hjce4p$nsr$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hjce4p$nsr$1@ger.gmane.org>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Getting patches committed
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
X-List-Received-Date: Fri, 22 Jan 2010 16:18:15 -0000
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Rolf Leggewie <no2spam@nospam.arcornews.de> [2010-01-22 15:53:06]:

> Petr =A9tetiar wrote:
> > What's wrong with public Git hostings?
>=20
> Nothing.  In fact, it would be preferred for various reasons.  But I
> haven't yet found anything that works the way I was envisioning this to
> work.  The mob branch concept of repo.or.cz comes close.  But it's just
> one branch, I'd prefer to have several.

Well, I meant, that everyone without r/w to OE would create his own accou=
nt on
preffered Git hosting and there his own OE fork. He'll just send pull req=
uest
to mailing list with URL to repository or branch on his own box or somewh=
ere
on public Git hosting, let the contributor decide. This way you don't nee=
d to
maintain anything, you'll just cherry-pick what you like or understand fr=
om
those branches.

Well, to not overload those public hostings it would be nice/necessary to
mirror OE repo on few of them so the contributors can just fork it, which=
 is
always cheaper and preffered way I think.

-- ynezz


