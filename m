Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@hrw.one.pl>) id 1IPai5-0000TQ-Cb
	for openembedded-devel@openembedded.org; Mon, 27 Aug 2007 11:16:37 +0200
Received: (qmail 14493 invoked by uid 813007); 27 Aug 2007 09:15:03 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 27 Aug 2007 09:15:03 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Aug 2007 11:15:01 +0200
User-Agent: KMail/1.9.7
References: <1188204435.2137.46.camel@localhost.localdomain>
In-Reply-To: <1188204435.2137.46.camel@localhost.localdomain>
MIME-Version: 1.0
Message-Id: <200708271115.03336.openembedded@hrw.one.pl>
Subject: Re: Why Not Remove Src after Install
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Aug 2007 09:16:37 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia poniedzia=C5=82ek, 27 sierpnia 2007, =E6=9D=A8=E5=90=8C=E5=B3=B0 napis=
a=C5=82:

Please configure your mailer to create readable mails.

> when I use OE to build OpenMoko , I found my disk has not enough
> space .and the project has cost 13 G. we know that when finish of
> do_fetch ,the source will unpack to tmp dir .  My question is why not
> remove the dir which uppack create to save usr's disk space ?

INHERIT +=3D "rm_work" in local.conf handle this for few years

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

  Alcohol may not solve any problems, but then again, neither does milk.




