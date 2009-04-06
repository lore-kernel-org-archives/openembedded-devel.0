Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Lqoue-0004FP-HX
	for openembedded-devel@openembedded.org; Mon, 06 Apr 2009 15:31:26 +0200
Received: (qmail 27640 invoked by uid 813007); 6 Apr 2009 13:28:05 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 6 Apr 2009 13:28:05 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 6 Apr 2009 15:28:04 +0200
User-Agent: KMail/1.11.0 (Linux/2.6.29; KDE/4.2.1; x86_64; ; )
References: <49D9FE37.9040005@bolloretelecom.eu>
In-Reply-To: <49D9FE37.9040005@bolloretelecom.eu>
MIME-Version: 1.0
Message-Id: <200904061528.05390.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_20,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Package "pine" has multiple issues
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
X-List-Received-Date: Mon, 06 Apr 2009 13:31:33 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia poniedzia=C5=82ek, 6 kwietnia 2009 o 15:05:59 Jeremy Lain=C3=A9 napisa=
=C5=82(a):
> While doing some QA work I came up with the following problems:
>
> * RDEPENDS_pine =3D "pico" : this looks wrong, should probably be a
> "+=3D" * pine embeds a copy of libc-client, which is already available
> as a separate package
> * LDFLAGS are ignored, resulting in a QA error

I think that we should drop it totally and use Alpine instead. Why?

=2D Pine is not developed anymore
=2D Pine has license which do not allows to distribute changed binaries
=2D Alpine replaced Pine
=2D Alpine uses Apache License 2.0

> As I can't find "pine" in the MAINTAINERS file, could someone step
> forward and fix it please?

IIRC Mickeyl added it long time ago.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




