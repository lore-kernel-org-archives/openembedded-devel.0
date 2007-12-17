Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <openembedded@haerwu.biz>) id 1J4OjE-0001HW-M2
	for openembedded-devel@openembedded.org; Mon, 17 Dec 2007 23:46:28 +0100
Received: (qmail 18235 invoked by uid 813007); 17 Dec 2007 22:41:36 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 17 Dec 2007 22:41:36 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Dec 2007 23:41:15 +0100
User-Agent: KMail/1.9.7
References: <4765E992.2040805@protium.com> <4766EAC5.10906@student.utwente.nl>
	<335513874.20071218001912@gmail.com>
In-Reply-To: <335513874.20071218001912@gmail.com>
MIME-Version: 1.0
Message-Id: <200712172341.18894.openembedded@haerwu.biz>
Subject: Re: RFC: Renaming uboot-utils
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
X-List-Received-Date: Mon, 17 Dec 2007 22:46:28 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia poniedzia=B3ek, 17 grudnia 2007, Paul Sokolovsky napisa=B3:
> Hello Koen,

> > And witness the joys of using linux.inc: automagic dependency on
> > mkimage for machines that need it!
>
>   Actually, that magic is pretty dumb ;-) :

Please refresh your metadata ;)

Koen merged my code from Poky which adds mkimage dependency ONLY for=20
uImage devices.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

           time is what keeps things from happening all at once




