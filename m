Received: from [82.208.49.253] (helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1N8wBn-0004O9-NH
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 14:27:50 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 9B0C61D36078; Fri, 13 Nov 2009 14:19:26 +0100 (CET)
Date: Fri, 13 Nov 2009 14:19:26 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezzor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091113131926.GE32004@ibawizard.net>
References: <alpine.LFD.2.00.0911130443520.1157@localhost>
	<4AFD4DD6.70509@balister.org>
	<alpine.LFD.2.00.0911130732220.17745@localhost>
	<4AFD5440.6080202@balister.org>
MIME-Version: 1.0
In-Reply-To: <4AFD5440.6080202@balister.org>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: build breakage: python-native-2.6.1
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
X-List-Received-Date: Fri, 13 Nov 2009 13:27:51 -0000
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Philip Balister <philip@balister.org> [2009-11-13 07:42:40]:

> I'm on F11 fwiw.
>
> I got this from gsb and a core file:
>
> http://pastebin.ca/1669812
>
> Philip

I had problems building lot of native packages on Ubuntu 8.10, so I've tr=
ied
to update to 9.04 and voal=E1, beagleboard-demo-image builds now without =
any
problem.

What I'm trying to say here, is that there should be some prebuilt chroot
environment with sane host tools everyone can use. Or we can build everyt=
hing
from scratch using OE, so we don't need to use anything from the host sys=
tem.

It's simply impossible to have same result on different systems,
distributions.

-- ynezz


