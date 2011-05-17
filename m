Received: from cpe.ge-0-2-0-951.faaqnqu1.customer.tele.dk ([93.167.193.22]
	helo=mail.mikrofyn.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgh@sgh.dk>) id 1QMFlB-0005k9-Hl
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 10:36:09 +0200
Received: from koontz.localnet ([10.115.1.246]) by mail.mikrofyn.com with
	Microsoft SMTPSVC(6.0.3790.3959); Tue, 17 May 2011 10:38:17 +0200
From: =?iso-8859-1?q?S=F8ren_Holm?= <sgh@sgh.dk>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 May 2011 10:33:16 +0200
User-Agent: KMail/1.13.6 (Linux/2.6.38-9-generic; KDE/4.6.3; i686; ; )
References: <201105051150.06842.sgh@sgh.dk> <4DCFD20A.9090907@atmel.com>
	<4DD01047.6000007@mlbassoc.com>
In-Reply-To: <4DD01047.6000007@mlbassoc.com>
MIME-Version: 1.0
Message-Id: <201105171033.16751.sgh@sgh.dk>
X-OriginalArrivalTime: 17 May 2011 08:38:17.0109 (UTC)
	FILETIME=[C4B50450:01CC146D]
Subject: Re: perl-native fails on Ubuntu 11.04
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
X-List-Received-Date: Tue, 17 May 2011 08:36:09 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

S=F8ndag 15 maj 2011 19:41:27 skrev Gary Thomas:
>=20
> No, the glob will be expanded in the assignment (globs inside of "" strin=
gs
> are expanded by the shell)
>=20

This is still not fixed. I have the change from  https://gist.github.com/ra=
w/925006/4217f358fb00b5b7f1dfbd1ce5f4afa4f64b0bb0/0001-perl-native-multilib=
=2Dpatch-for-ubuntu-11.04.patch
running and it works great. Why do we not apply that?

=2D-=20
S=F8ren Holm


