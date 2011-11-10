Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <david.thomas@microbee-systems.com>)
	id 1ROTwz-0004xN-Aj for openembedded-devel@lists.openembedded.org;
	Thu, 10 Nov 2011 13:41:49 +0100
Received: by yenm3 with SMTP id m3so1847229yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Nov 2011 04:35:32 -0800 (PST)
Received: by 10.100.49.27 with SMTP id w27mr179622anw.134.1320928532199;
	Thu, 10 Nov 2011 04:35:32 -0800 (PST)
Received: from [192.168.0.225] ([24.214.175.85])
	by mx.google.com with ESMTPS id t62sm6412173yht.0.2011.11.10.04.35.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 Nov 2011 04:35:31 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: David Thomas <david.thomas@microbee-systems.com>
In-Reply-To: <1389840.j5gWQFZ9u1@helios>
Date: Thu, 10 Nov 2011 06:35:45 -0600
Message-Id: <D1FB05D7-71E3-4B22-8A8B-594B38FE09D1@microbee-systems.com>
References: <CALJpqJwD0FPCUiD1FRCKR4e=ZTRJb-Lko1nBAC-gLPp057EKpg@mail.gmail.com>
	<1389840.j5gWQFZ9u1@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: SRC_URI = "svn://svn.o-hand.com/repos/matchbox/trunk
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
X-List-Received-Date: Thu, 10 Nov 2011 12:41:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

I appreciate the response. Yes, I found this but it would seem this is =
related to the patches listed in that file I included.

I will press on. =20

Dave


On Nov 10, 2011, at 3:58 AM, Paul Eggleton wrote:

> On Wednesday 09 November 2011 16:32:48 David Thomas wrote:
>> Since svn.o-hand.com is dead does anyone have a different repository?
>=20
> Most if not all o-hand repositories have been converted to git and =
moved to=20
> git.yoctoproject.org. A list of what's available:
>=20
> http://git.yoctoproject.org/cgit/cgit.cgi/
>=20
>> SRC_URI =3D =
"git://git.yoctoproject.org/matchbox-keyboard;protocol=3Dgit \
>=20
> This works for me... ?
>=20
>> I am unable to find any source for these. It sure seems to me that OE
>> is overly dependent upon links that come and go.
>=20
> It is if you don't use a mirror. Realistically with the wide range of =
software=20
> from hundreds of different providers built in OE there's no way you =
can expect=20
> all of them to not change their download locations, remove old =
versions, etc.=20
> over time. That's why we have mirror support, and both Angstrom and =
the Yocto=20
> Project provide mirrors already.
>=20
> If you really want to ensure long-term support you may want to =
consider=20
> setting up your own local mirror; it's fairly easy to do.
>=20
> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre



