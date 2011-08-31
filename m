Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qyk6o-0000M5-Uz
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 14:41:34 +0200
Received: by wwe32 with SMTP id 32so571468wwe.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2011 05:36:40 -0700 (PDT)
Received: by 10.216.229.144 with SMTP id h16mr360502weq.32.1314794200605;
	Wed, 31 Aug 2011 05:36:40 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id y31sm4258595weq.16.2011.08.31.05.36.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 31 Aug 2011 05:36:39 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <201108311327.01907.paul.eggleton@linux.intel.com>
Date: Wed, 31 Aug 2011 14:36:37 +0200
Message-Id: <62BBB5B2-363D-49EA-AD5D-B67123C0F908@dominion.thruhere.net>
References: <1314745564-3331-1-git-send-email-schnitzeltony@gmx.de>
	<20110831115548.GB3273@chargestorm.se>
	<j3l8ni$kr3$1@dough.gmane.org>
	<201108311327.01907.paul.eggleton@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1244.3)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: `PR = "r0"`: Add or not to add?
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
X-List-Received-Date: Wed, 31 Aug 2011 12:41:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 31 aug. 2011, om 14:27 heeft Paul Eggleton het volgende geschreven:

> On Wednesday 31 August 2011 13:16:50 Koen Kooi wrote:
>> Op 31-08-11 13:55, Anders Darander schreef:
>>> To sad. It's a lot easier to remember to bump the PR, when PR =
actually is
>>> in the recipe. Thus, including PR=3D0 will often remove one issue =
with
>>> patches.
>>=20
>> That's what review is for, no?
>=20
> Surely you'd rather people have a better chance of getting it right =
the first=20
> time rather than you having to remind them for every patch? The almost=20=

> insignificant burden of a PR =3D "r0" in each recipe seems worthwhile =
to me if it=20
> even helps a single person remember.

I've found that in .dev having PR =3D r0 in recipes is a bigger burden =
than not having them, especially when using shared .inc files like xorg. =
And there have been enough patches where people don't get PR bumps right =
even if there's a PR already in the recipe. So I'm unconvinced that it =
makes a real difference in "getting it right".

Even in the extreme case that every packaging patch is missing a PR bump =
that, for me,  is less annoying than issues I faced in .dev with PR =3D =
r0 sprinkled throughout the metadata.=


