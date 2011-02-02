Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PkeAr-0001Xo-T8
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Feb 2011 15:59:13 +0100
Received: by wyb40 with SMTP id 40so51706wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Feb 2011 06:58:18 -0800 (PST)
Received: by 10.227.146.85 with SMTP id g21mr8659857wbv.113.1296658698329;
	Wed, 02 Feb 2011 06:58:18 -0800 (PST)
Received: from [192.168.200.146]
	(LMontsouris-156-26-29-15.w80-14.abo.wanadoo.fr [80.14.188.15])
	by mx.google.com with ESMTPS id w25sm5970634wbd.23.2011.02.02.06.58.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 02 Feb 2011 06:58:16 -0800 (PST)
References: <201102012002.49849.schnitzeltony@gmx.de>
	<4D496DBC.6030709@opendreambox.org>
In-Reply-To: <4D496DBC.6030709@opendreambox.org>
Mime-Version: 1.0 (iPhone Mail 8C148)
Message-Id: <1F887C9B-2BD1-436C-8B7B-4162CA51857C@dominion.thruhere.net>
X-Mailer: iPhone Mail (8C148)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 2 Feb 2011 15:57:33 +0100
To: Andreas Oberritter <obi@opendreambox.org>
Cc: Koen Kooi <koen@openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: latest clutter-recipe
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
X-List-Received-Date: Wed, 02 Feb 2011 14:59:14 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

I checked patchwork first and that didn't show any clutter patches. I'll add=
 the gtk and gst ones after fosdem

Op 2 feb. 2011 om 15:44 heeft Andreas Oberritter <obi@opendreambox.org> het v=
olgende geschreven:

> Hello Andreas,
>=20
> I can't answer your technical questions regarding the recipe, because
> I'm not using a clutter/gtk/x11 based distro. I'd like to comment the
> rest of your mail, though.
>=20
> On 02/01/2011 08:02 PM, Andreas Mueller wrote:
>> it surprised me to see that Koen committed a new recipe for clutter 1.4.2=
. As you might know I was also working on this and sent some pre-release ver=
sion here of this (1). What makes me not running in happy mode:
>>=20
>> - Many of my previous patches were rejected first because of some commit m=
essage. Here we read 'clutter: add 1.4.2' - cool. Which tests were performed=
?
>=20
> In general, contrary to patches which modify existing files, I think
> that patches adding new recipes don't need a detailed commit message.
> Still, a message should describe the content of a commit in a suitable
> and understandable way. In my opinion, "<name>: add <version>"
> sufficiently describes any new recipe, unless there's anything special
> about it.
>=20
> In this case, I would have preferred glib-gettextize getting mentioned,
> which was added to clutter.inc.
>=20
>> Please don't tell me I am invited to change this situation:  Many patches=
 send by non-commit guys are nit-picked at least for commit message - and th=
en I read 'clutter: add 1.4.2' for a recipe breaking lots of others.
>=20
> Well, shit happens, unfortunately. Hopefully it was tested and worked in
> a different environment. Bug reports like this are needed to make it
> work for as many environments as possible. I've added Koen to CC to
> decrease the chance that your bug report gets lost without Koen
> noticing. I think he didn't mean to offend you in any way with his commit.=

>=20
> Nit-picking happens frequently, and personally I prefer getting negative
> feedback over no feedback at all. Usually it's not very hard to address
> the complaints, although it can be very frustrating to get only a short
> comment on something you've put a lot of time into. My guess is that
> this has occurred at least once to everybody who contributed to open
> source projects.
>=20
>> Sorry for this, but to me the this should have been a hobby for having fu=
n - but at the moment it's far from
>=20
> So let's try to regain some fun after this problem gets solved! You
> shouldn't take it personally.
>=20
>> Andreas
>>=20
>> (1) http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-January/=
029260.html
>=20
> Regards,
> Andreas
>=20


