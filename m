Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SSExt-0005kJ-0r
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 May 2012 00:02:33 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 09D2EEA040;
	Thu, 10 May 2012 00:05:36 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 2B41264387; Wed,  9 May 2012 23:52:38 +0200 (CEST)
Date: Wed, 9 May 2012 23:52:38 +0200
From: Apelete Seketeli <apelete@seketeli.net>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20120509215237.GR3781@hermes>
References: <1334180792-20535-1-git-send-email-apelete@seketeli.net>
	<20120411125503.GB3637@jama.jama.net>
	<20120412204417.GD3256@hermes>
	<20120412210108.GA3945@jama.jama.net>
	<20120502210040.GB3781@hermes> <20120509191656.GP3781@hermes>
	<20120509210020.GI12898@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120509210020.GI12898@jama.jama.net>
X-Operating-System: Debian GNU/Linux wheezy/sid
X-URL: http://www.seketeli.net/~apelete
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] opkg-utils: Update SRC_URI to git.yoctoproject.org
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
X-List-Received-Date: Wed, 09 May 2012 22:02:33 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le 09-May-12, Martin Jansa a =E9crit:
> On Wed, May 09, 2012 at 09:16:56PM +0200, Apelete Seketeli wrote:
> > Hi,
> >=20
> > Le 02-May-12, Apelete Seketeli a =E9crit:
> > >=20
> > > Okay, I finally got some time to works on this.
> > > I asked on the yocto ML to get the original patches applied, and th=
ey
> > > actually got applied (thanks to Richard Purdie).
> > >=20
> > > Please find attached the patch to get the changes into oe-classic. =
I
> > > don't know if I should create a new thread to submit it, I would
> > > gladly do so if asked to.
> >=20
> > The patch has just been applied in oe-classic, thanks to Kristoffer
> > Ericson.
> >=20
> > http://cgit.openembedded.org/openembedded/commit/?id=3D1ff63aa26e3088=
ba2d30e491d74a31caf25c3d83
> >=20
> > I am new to the list, so I am not used to the process, but would you
> > please tell me what the rule for the author and committer field is ?
> > I would have naively expect to see my name there.
>=20
> You did it almost right and Kristoffer's name should be only in committ=
er=20
> field and yours in author.
>=20
> Next time when sending new version use PATCHv2 prefix and don't send
> your patch in reply as inline. If you download mbox version from
> patchwork
> http://patchwork.openembedded.org/patch/26863/
> you'll see that e.g. my reply to you get's included in commit message o=
f
> such patch which doesn't belong there and committer needs to use=20
> git commit --amend  -s
> to strip unwanted text..

Thanks for the detailed explanation. I get your point, I will follow
these instructions next time and submit the patch as a separate mail
in a thread.

Cheers.
--=20
        Apelete


