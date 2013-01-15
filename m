Received: from mail-pa0-f42.google.com ([209.85.220.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TvGUR-0007EG-5j
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jan 2013 01:04:30 +0100
Received: by mail-pa0-f42.google.com with SMTP id rl6so417852pac.29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jan 2013 15:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/f5LntFKGbkGOucVmp/+pe0i8+W2Xi+IenhcgSV+kGA=;
	b=SFjqUm3yZVnFwKaMz84Djyv6JmFtO8OLJ17fI9ANmPUsCebYgDg8uSgdH/iPJSXB7e
	BC6sdaboTdTow9sc7c64Y4tdUdUg0wDbKEmIqJyCYa3z/p0Ty3yOZ9Fqf+3yo9fMjtSZ
	JGjJadY786GUVC+sd5UDUKgwIpL354rgIQthc1Dtq60er8Z68NdTXJQUaa7t7SyL4S0+
	KMD6bowtmsntzYfu5N0SP6hRpZOjYP9bmjKkWJSjWC2GA6i362iJMB1q16Au2+Go70kP
	xfbTftJYSeXLdgIqnZEdmJyCphWVY0zWLM2fNSUkkJsEUTKvmdERknrnJO5G898qIl19
	SvhA==
X-Received: by 10.68.254.137 with SMTP id ai9mr266921955pbd.21.1358293741283; 
	Tue, 15 Jan 2013 15:49:01 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id w5sm11703518pax.28.2013.01.15.15.48.58
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 15 Jan 2013 15:49:00 -0800 (PST)
Date: Wed, 16 Jan 2013 00:49:02 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130115234902.GC3002@jama>
References: <3145293.jEgb7vZ7zI@helios> <20121213232058.GA5567@jama.jama.net>
	<20121214110507.GB8699@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20121214110507.GB8699@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Archived patchwork entries Was: OE-Classic patches in patchwork
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
X-List-Received-Date: Wed, 16 Jan 2013 00:04:31 -0000
X-Groupsio-MsgNum: 42709
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pQhZXvAqiZgbeUkD"
Content-Disposition: inline

--pQhZXvAqiZgbeUkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 14, 2012 at 12:05:07PM +0100, Martin Jansa wrote:
> On Fri, Dec 14, 2012 at 12:20:58AM +0100, Martin Jansa wrote:
> > On Tue, Dec 04, 2012 at 06:11:22PM +0000, Paul Eggleton wrote:
> > > Hi all,
> > >=20
> > > There is a significant volume of patches in the OE patchwork [1] that=
 are=20
> > > intended to apply to OE-Classic. Apart from the 2011.3-maintenance br=
anch, OE-
> > > Classic is no longer maintained in favour of OE-Core + layers, so the=
 question=20
> > > is what should we do with these patches? At the moment I'm thinking w=
e should=20
> > > just mark them as "archived" so that they disappear from the queue; p=
eople can=20
> > > still get access to them if needed.
> > >=20
> > > Thoughts?
> >=20
> > There is also 70 patches from chase maupin just updating LICENSE to
> > contain also version.
> >=20
> > I'm not using oe-classic anymore, but I believe he prepared them
> > carefully and it's worth merging.
> >=20
> > I'll create bundle from it and apply it tomorrow if nobody objects.
>=20
> Can we fix patchwork to show bundles marked as public to public users?
>=20
> I've few bundles
> Name	Project	Public Link	Patches	Download	Delete
> in-test		oe	http://patches.openembedded.org/bundle/jama/in-test/	21	=09
> oe-classic	oe 	http://patches.openembedded.org/bundle/jama/oe-classic/	61=
	=09
> oe-classic-lic	oe 	http://patches.openembedded.org/bundle/jama/oe-classic=
-lic/	70	=09
> 2011.03-maintenance oe	http://patches.openembedded.org/bundle/jama/2011.0=
3-maintenance/	1	=09
> denzil		oe	http://patches.openembedded.org/bundle/jama/denzil/	6	=09
> danny		oe	http://patches.openembedded.org/bundle/jama/danny/	5	=09
> meta-handheld	oe	http://patches.openembedded.org/bundle/jama/meta-handhel=
d/	1	=09
> meta-java	oe	http://patches.openembedded.org/bundle/jama/meta-java/	15	=
=09
> meta-opie	oe	http://patches.openembedded.org/bundle/jama/meta-opie/	1	=09
>=20
> But without sharing link to bundle, nobody will find it (AFAIK) maybe
> there is newer version of Patchwork which shows public bundles
> somewhere?
>=20
> oe-classic bundle is now marked as archived - so not listed by default.
> oe-classic-lic also marked as archived and I'll apply it later today.
>=20
> It would be great if we agree to mark patches as archived when they get a=
ssigned=20
> to some bundle to keep main patchwork list relatively clean and layer/rel=
ease=20
> maintainers can still see all patches with "New" state in corresponding b=
undle.
>=20
> I've also marked some patches with review comments without reply as
> "Changes requested" + archived. Pity that some patches had rather
> trivial issues, but submitter never responded with v2..
>=20
> And there were some patches for oe-core already applied in oe-core.. so
> marked as "Not applicable" + archived.

Andrea just asked about this, so if someone missed this information:

There are some bundles:
2011.03-maintenance oe	http://patches.openembedded.org/bundle/jama/2011.03-=
maintenance/	1	=09
danny		oe	http://patches.openembedded.org/bundle/jama/danny/			9	=09
denzil		oe	http://patches.openembedded.org/bundle/jama/denzil/			10	=09
in-test		oe	http://patches.openembedded.org/bundle/jama/in-test/			161	=09
meta-browser	oe	http://patches.openembedded.org/bundle/jama/meta-browser/		=
7	=09
meta-handheld	oe	http://patches.openembedded.org/bundle/jama/meta-handheld/=
		2	=09
meta-initramfs	oe	http://patches.openembedded.org/bundle/jama/meta-initramf=
s/		1	=09
meta-java	oe	http://patches.openembedded.org/bundle/jama/meta-java/			15	=
=09
meta-kde	oe	http://patches.openembedded.org/bundle/jama/meta-kde/			1	=09
meta-networking	oe	http://patches.openembedded.org/bundle/jama/meta-network=
ing/		12	=09
meta-opie	oe	http://patches.openembedded.org/bundle/jama/meta-opie/			2	=09
meta-systemd	oe	http://patches.openembedded.org/bundle/jama/meta-systemd/		=
25	=09
meta-webserver	oe	http://patches.openembedded.org/bundle/jama/meta-webserve=
r/		2	=09
oe-classic	oe	http://patches.openembedded.org/bundle/jama/oe-classic/			62	=
=09
oe-classic-lic	oe	http://patches.openembedded.org/bundle/jama/oe-classic-li=
c/		70	=09

I'm adding patches to right bundle when I'm sorting patches to=20
test them on jenkins (in-test bundle, contrib/jansa/in-test branch).

In the process I'm marking them as "Archived" (to see what's not sorted in =
main page),=20
but because their state stays "New" you can still find them in bundles, e.g.
http://patches.openembedded.org/bundle/jama/meta-webserver/?archive=3Dboth

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pQhZXvAqiZgbeUkD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD16u4ACgkQN1Ujt2V2gByzHwCgljtjd6+JnTp/YWHa62NY9W3j
G+gAnivdhLna6OUpEmNRPdv+7aHJs3Vl
=XBpC
-----END PGP SIGNATURE-----

--pQhZXvAqiZgbeUkD--
