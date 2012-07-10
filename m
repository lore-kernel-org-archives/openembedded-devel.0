Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1Sog4e-0007FL-Dv
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Jul 2012 21:26:16 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id C460AEA042
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2012 21:20:07 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 14AD260297; Tue, 10 Jul 2012 21:15:04 +0200 (CEST)
Date: Tue, 10 Jul 2012 21:15:04 +0200
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120710191504.GC6220@hermes>
References: <1341759929-32341-1-git-send-email-apelete@seketeli.net>
	<CAK18fxF6azr6-4B-=AQOYTe2hkXpQ52P4D12y0O2hx8y6z5=9g@mail.gmail.com>
	<20120709170052.GA6220@hermes>
	<CAK18fxHkfTTtHNv=vU_L3_VwCmoa3r9e30L=LSd4uYgGWHg0VQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK18fxHkfTTtHNv=vU_L3_VwCmoa3r9e30L=LSd4uYgGWHg0VQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 10 Jul 2012 19:26:16 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le 09-Jul-12, Andrei Gherzan a =E9crit:
> On Mon, Jul 9, 2012 at 8:00 PM, Apelete Seketeli <apelete@seketeli.net>=
wrote:
>=20
> > Le 09-Jul-12, Andrei Gherzan a =E9crit:
> > > On Sun, Jul 8, 2012 at 6:05 PM, Apelete Seketeli <apelete@seketeli.=
net
> > >wrote:
> > >
> > > > Update the SRC_URI of libpng.inc to ftp.lfs-matrix.net since
> > > > ftp.simplesystems.org seems to be down.
> > > >
> > > >
> > > Now it's up and running. Could have been a temporary server problem=
 or a
> > > local one.
> >
> > ftp.simplesystems.org is up and running indeed, but libpng1.2.44 is n=
o
> > longer available on it. It is still available at ftp.lfs-matrix.net
> > though; maybe I should have explained it better on the commit message=
.
> >
> >
> ftp://ftp.simplesystems.org/pub/libpng/libpng-canonical-test01/gz/libpn=
g-1.2.44.tar.gz
> So it is here. :)
>=20
> Indeed the path is changed.

According to the README file sitting on the same level on the ftp
server, the libpng-canonical-test01 directory has been created for
test purposes. However, the file is available at
ftp://ftp.simplesystems.org/pub/libpng/png/src/history/libpng12/libpng-1.=
2.44.tar.bz2,
which seems to be a more permanent directory.
I will submit another patch, using that path instead.

Thanks.
--=20
        Apelete


