Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1Ga8xP-0001di-7t
	for openembedded-devel@openembedded.org; Wed, 18 Oct 2006 12:47:31 +0200
Received: (qmail 1429 invoked by uid 813007); 18 Oct 2006 10:40:32 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO ?192.168.1.90?)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 18 Oct 2006 10:40:32 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
Organization: OpenEmbedded
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Oct 2006 12:40:30 +0200
User-Agent: KMail/1.9.5
References: <b9481e140610180154r5a3c5c0do543863a9b0b4c059@mail.gmail.com>
In-Reply-To: <b9481e140610180154r5a3c5c0do543863a9b0b4c059@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200610181240.31042.openembedded@hrw.one.pl>
Subject: Re: Bitbake: say who you are cooking
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Oct 2006 10:47:31 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia =B6roda, 18 pa=BCdziernika 2006 10:54, Nicolas FR napisa=B3:

> When we start to bitbake a recipe, let's say "bitbake foo", bitbakes
> starts compiling dependencies without telling which version of foo he
> will finally compile.
>
> I find this frustating, because quite often (wrong preferred provider,
> ...) I end up bitbaking the wrong version of a recipe, and bb won't
> tell you this before having successfully compiled all the
> dependencies.
>
> It would be nice to have bitbake print which version he will bitbake
> before actually compiling the dependencies.

"bitbake --dry-run foo" do what you seek for.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant




