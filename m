Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MEF5j-0006Ws-LE
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Jun 2009 06:07:11 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KL000K0E71XY4P0@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	09 Jun 2009 22:29:58 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 183BE14AF5F; Tue,
	09 Jun 2009 23:29:57 -0400 (EDT)
Date: Tue, 09 Jun 2009 23:29:57 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <20090610024002.GR26065@smtp.west.cox.net>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090610032957.GA6080@denix.org>
MIME-version: 1.0
References: <20090603151754.GI26065@smtp.west.cox.net>
	<1244043442-3868-1-git-send-email-ihar.hrachyshka@gmail.com>
	<20090603161035.GL26065@smtp.west.cox.net>
	<fce2a370906031027y1e28cc6cre5aad0a1465c806b@mail.gmail.com>
	<fce2a370906070940i3f5d7faud81d010af727b66a@mail.gmail.com>
	<20090610024002.GR26065@smtp.west.cox.net>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH 00/12] different qt4 related patches
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
X-List-Received-Date: Wed, 10 Jun 2009 04:07:12 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

On Tue, Jun 09, 2009 at 07:40:03PM -0700, Tom Rini wrote:
> On Sun, Jun 07, 2009 at 07:40:52PM +0300, Ihar Hrachyshka wrote:
> > On Wed, Jun 3, 2009 at 8:27 PM, Ihar
> > Hrachyshka<ihar.hrachyshka@gmail.com> wrote:
> > > On Wed, Jun 3, 2009 at 7:10 PM, Tom Rini <trini@embeddedalley.c=
om> wrote:
> > >> On Wed, Jun 03, 2009 at 06:37:10PM +0300, Ihar Hrachyshka wrot=
e:
> > >>
> > >>> This patchset:
> > >>> - adds meta-toolchain-qte.bb to install toolchain with Qt/Emb=
edded and
> > >>> =A0 all the needed tools ready to use for qt4-embedded develo=
pment;
> > >>> - adds directfb support for qt4-embedded;
> > >>> - includes missing files to qt4 packages;
> > >>> - fixes code style, generalize qt4 recipes and classes, rewor=
ked directory
> > >>> =A0 layout;
> > >>> - occasionally ports pkg-config to INC_PR.
> > >>
> > >> What machine / distro combinations have you tested all of this=
 with, and
> > >> what recipes (other than meta-toolchain-qte) have you explicit=
ly built
> > >> after? =A0ie have you built / run some QtE images or similar t=
oo? =A0Thanks.
> > >
> > > I built and tested qt4-embedded (with directfb and linuxfb), me=
ta-toolchain-qte.
> > > I also built (but not tested) qt4-x11-free.
> > > My machine is beagleboard.
> >=20
> > What's the status of the patchset? Is there any problems pending =
before commit?
>=20
> I have no problem and Acked-by the whole series.  I do not however,=
 have
> time to commit this right now, sorry.  But anyone else, please feel=
 free
> to add:
> Acked-by: Tom Rini <trini@embeddedalley.com>
>=20
> And push.

Acked and pushed. Patchwork updated. Thanks.

--=20
Denys



