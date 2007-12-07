Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <openembedded@haerwu.biz>) id 1J0mQc-0007BO-Hv
	for openembedded-devel@openembedded.org; Sat, 08 Dec 2007 00:16:18 +0100
Received: (qmail 24504 invoked by uid 813007); 7 Dec 2007 23:12:25 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 7 Dec 2007 23:12:25 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 8 Dec 2007 00:12:23 +0100
User-Agent: KMail/1.9.7
References: <145452892.20071207195745@vanille-media.de>
	<4759AE61.2070803@student.utwente.nl>
In-Reply-To: <4759AE61.2070803@student.utwente.nl>
MIME-Version: 1.0
Message-Id: <200712080012.24035.openembedded@haerwu.biz>
Subject: Re: monotone merge flood
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
X-List-Received-Date: Fri, 07 Dec 2007 23:16:18 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia pi=B1tek, 7 grudnia 2007, Koen Kooi napisa=B3:
> Michael 'Mickey' Lauer schreef:

> > I have seen a monotone merge flood these days. Let me please remind
> > you to mtn pull && mtn update before mtn push'ing.
>
> That doesn't help to avoid merges, since you already committed the
> changes. The safest way to avoid a merge flood is to leave merging to
> the OE automerger.

Safest but not needed. Monotone is distributed so it is safe to commit=20
offline. It is just important to do pull/merge/update before push.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

               How many calories are there in a light year?




