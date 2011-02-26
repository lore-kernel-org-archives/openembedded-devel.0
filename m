Received: from ibawizard.net ([82.208.49.253] helo=mengele.ibawizard.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1PtP4u-0008QC-J4
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Feb 2011 19:41:16 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id A4BD91D360AA; Sat, 26 Feb 2011 19:39:49 +0100 (CET)
Date: Sat, 26 Feb 2011 19:39:49 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20110226183949.GB10042@ibawizard.net>
References: <1298742255-23389-1-git-send-email-ynezz@true.cz>
	<AANLkTimdkiR3Kf_1980OZ5tn9SfDVCnz0=tzkQvpwxw8@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTimdkiR3Kf_1980OZ5tn9SfDVCnz0=tzkQvpwxw8@mail.gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: openembedded-devel@openembedded.org,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] micro-uclibc: add xattr to distro features to	fix build failure of libcap2
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
X-List-Received-Date: Sat, 26 Feb 2011 18:41:16 -0000
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Khem Raj <raj.khem@gmail.com> [2011-02-26 10:06:31]:

> On Sat, Feb 26, 2011 at 9:44 AM, Petr =A9tetiar <ynezz@true.cz> wrote:
> > cap_file.c:8:23: fatal error: sys/xattr.h: No such file or directory
> >
> > Signed-off-by: Petr =A9tetiar <ynezz@true.cz>
>=20
> looks good although I dont know if enabling this is intended as micro
> should be small

I see and agree, but what do you propose as the way to fix the libcap2 bu=
ild
failure with uclibc? Thanks.

-- ynezz


