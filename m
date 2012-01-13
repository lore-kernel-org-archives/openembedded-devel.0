Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RlbKa-0007lF-Pt
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jan 2012 08:13:44 +0100
Received: by eekd17 with SMTP id d17so737266eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2012 23:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:rom:user-agent;
	bh=wAj5AZhjxI5l3f24mee4PONNJPDquzr512vAuMfZilI=;
	b=rgq+3Nvl+gF0TqHnqIMfOhx3Fd4xyBQnSf70R1vtq6ZATMo4ejkc19l2zIbPTpoYK/
	tAPnhZMn5m9oa57w9f/eBIav+wCfvyRk6EMMVRhhSy7M7leOBUOSM7IooS9mDak9Iwst
	Sci4I0LId4l2Qmh4Oz2f8DJvXIepq4pwtyp7Y=
Received: by 10.213.8.69 with SMTP id g5mr329486ebg.88.1326438373021;
	Thu, 12 Jan 2012 23:06:13 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a60sm25843910eeb.4.2012.01.12.23.06.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jan 2012 23:06:11 -0800 (PST)
From: martin.jansa@gmail.com
Date: Fri, 13 Jan 2012 08:06:00 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120113070559.GA3483@jama.jama.net>
References: <jemqcg$1q0$1@dough.gmane.org>
	<CAPOJ94ND1+KeABgs-v_m07L3pZDJg+7kReTKNEvLe27rngNGeA@mail.gmail.com>
	<CAEsOVNevm9gf7xvXSyQBeuxA-GmSeco1FVTVejyEYLk_dtp76Q@mail.gmail.com>
	<CAPOJ94NPC1CQJKSXTyyV93HTyaRrDYNRO7bFjXR+1Wd1oxJaBg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPOJ94NPC1CQJKSXTyyV93HTyaRrDYNRO7bFjXR+1Wd1oxJaBg@mail.gmail.com>
rom: Martin Jansa <Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: meta-oe post holiday patchwork cleanup
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
X-List-Received-Date: Fri, 13 Jan 2012 07:13:44 -0000
X-Groupsio-MsgNum: 36493
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Content-Disposition: inline

--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 12, 2012 at 06:47:29PM -0600, Peter Bigot wrote:
> On Thu, Jan 12, 2012 at 6:06 PM, McClintock Matthew-B29882
> <B29882@freescale.com> wrote:
> > On Thu, Jan 12, 2012 at 5:26 PM, Peter Bigot <bigotp@acm.org> wrote:
> >> On Thu, Jan 12, 2012 at 8:23 AM, Koen Kooi <koen@dominion.thruhere.net=
> wrote:
> >>> -----BEGIN PGP SIGNED MESSAGE-----
> >>> Hash: SHA1
> >>>
> >>> tl;dr version: get your subject-prefix right
> >>>
> >>> Hi,
> >>>
> >>> I've cleaned up patchwork by marking every meta-oe patch as archived,=
 minus
> >>> the one Martin just sent.
> >>>
> >>> This means all the pending patches for meta-oe are listed here:
> >>>
> >>> http://patches.openembedded.org/project/oe/list/?q=3Dmeta-oe
> >>>
> >>> If your patches are missing, resend them using the method outlined in=
 the
> >>> README of the respective meta-openembedded layer.
> >>>
> >>> I'll include the meta-oe one below, since too many patches still don'=
t comply:
> >>>
> >>> - -------------------------------------------------------------------=
--------
> >>>
> >>> This layer depends on:
> >>>
> >>> URI: git://git.openembedded.org/openembedded-core
> >>> branch: master
> >>> revision: HEAD
> >>>
> >>> Send pull requests to openembedded-devel@lists.openembedded.org with
> >>> '[meta-oe]' in the subject'
> >>>
> >>> When sending single patches, please use something like 'git send-emai=
l -1
> >>> - --to openembedded-devel@lists.openembedded.org --subject-prefix met=
a-oe'
> >>>
> >>> You are encouraged to fork the mirror on github
> >>> https://github.com/openembedded/meta-oe/ to share your patches, this =
is
> >>> preferred for patch sets consisting of more than one patch. Other ser=
vices
> >>> like gitorious, repo.or.cz or self hosted setups are of course accept=
ed as
> >>> well, 'git fetch <remote>' works the same on all of them. We recommend
> >>> github because it is free, easy to use, has been proven to be reliabl=
e and
> >>> has a really good web GUI.
> >>>
> >>> Main layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
> >>>
> >>> - -------------------------------------------------------------------=
--------
> >>>
> >>> The most important thing of that is the subject prefix. I only read e=
mails
> >>> with a [meta-<foo>] subject prefix on oe-devel nowadays and I look at
> >>> http://patches.openembedded.org/project/oe/list/?q=3Dmeta- more often=
 than
> >>> oe-devel.
> >>>
> >>> So: Get your subject-prefix right
> >>>
> >>> And kudos to Andreas, Martin and Otavio for getting their pull reques=
ts
> >>> right pretty much all the time.
> >>
> >> While I appreciate that a blanket "throw it out; if they care they'll
> >> resend it" approach is an effective way to deal with the backlog
> >> resulting from an absence, I don't appreciate that in addition to the
> >> time I spent crafting patches to improve oe-core and submitting them
> >> (with the right prefix AFAIK), I am now expected to do so again.
> >> Further, the archived discussion of one of my patches included a
> >> request for clarification on how to address a licensing issue which
> >> was never answered, and which now presumably never will be.
> >>
> >> This sort of practice discourages people (well, me at least) from
> >> contributing to this project.
> >
> > Perhaps you can just mark them correctly in patchworks again instead
> > of resubmitting? Somewhat easier, you can even keep a list of patch
> > id's and do this automatically via the pwclient.
>=20
> Maybe; the only one I can see in the archive is the one that has an
> unanswered question.  If I request a patchwork account, would I be
> able to do this?  (I don't have/use/know anything about pwclient.)

If it still works the same, then create patchwork account yourself with
same e-mail address you're using when sending patches and you should be
able to update your patches.

> The others don't appear to be there; maybe they got merged in since I
> last looked, in which case I apologize for grumbling prematurely.  (My
> oe-core effort is unfunded so I only get a chance to poke at it for a
> couple days every couple weeks, and only see the emails during the off
> times.)

Be aware that oe-core patches are not really tracked on patchwork,
patchwork is used mostly for meta-* patches.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8P19cACgkQN1Ujt2V2gByZKACdHXwO5MKp0CIWrt1zshYjLTQQ
ASgAnjC9abjaePkLP1hAlLql+PRs5SrQ
=AqSb
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--
