Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1PtOMs-0006zU-Lp
	for openembedded-devel@openembedded.org; Sat, 26 Feb 2011 18:55:46 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 5D80D1D360AA; Sat, 26 Feb 2011 18:46:16 +0100 (CET)
Date: Sat, 26 Feb 2011 18:46:16 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
Message-ID: <20110226174616.GA10042@ibawizard.net>
References: <1298742255-23389-1-git-send-email-ynezz@true.cz>
	<1298742255-23389-2-git-send-email-ynezz@true.cz>
MIME-Version: 1.0
In-Reply-To: <1298742255-23389-2-git-send-email-ynezz@true.cz>
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH] minimal-uclibc: add xattr to distro features to fix	build failure of libcap2
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
X-List-Received-Date: Sat, 26 Feb 2011 17:55:46 -0000
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Petr =A9tetiar <ynezz@true.cz> [2011-02-26 18:44:14]:

> cap_file.c:8:23: fatal error: sys/xattr.h: No such file or directory
>=20
> Signed-off-by: Petr =A9tetiar <ynezz@true.cz>

Sent this one accidentaly twice, sorry.

-- ynezz


