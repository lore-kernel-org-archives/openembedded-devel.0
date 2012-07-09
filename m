Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SoHVG-0005tH-8P
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jul 2012 19:12:06 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 5BE2CEA042
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2012 19:06:07 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 6BBC3604C9; Mon,  9 Jul 2012 19:00:52 +0200 (CEST)
Date: Mon, 9 Jul 2012 19:00:52 +0200
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120709170052.GA6220@hermes>
References: <1341759929-32341-1-git-send-email-apelete@seketeli.net>
	<CAK18fxF6azr6-4B-=AQOYTe2hkXpQ52P4D12y0O2hx8y6z5=9g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK18fxF6azr6-4B-=AQOYTe2hkXpQ52P4D12y0O2hx8y6z5=9g@mail.gmail.com>
X-Operating-System: Debian GNU/Linux wheezy/sid
X-URL: http://www.seketeli.net/~apelete
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe-classic][PATCH] libpng: update SRC_URI
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
X-List-Received-Date: Mon, 09 Jul 2012 17:12:06 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le 09-Jul-12, Andrei Gherzan a =E9crit:
> On Sun, Jul 8, 2012 at 6:05 PM, Apelete Seketeli <apelete@seketeli.net>=
wrote:
>=20
> > Update the SRC_URI of libpng.inc to ftp.lfs-matrix.net since
> > ftp.simplesystems.org seems to be down.
> >
> >
> Now it's up and running. Could have been a temporary server problem or =
a
> local one.

ftp.simplesystems.org is up and running indeed, but libpng1.2.44 is no
longer available on it. It is still available at ftp.lfs-matrix.net
though; maybe I should have explained it better on the commit message.

Cheers.
--=20
        Apelete


