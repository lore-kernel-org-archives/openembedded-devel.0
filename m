Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <openembedded@haerwu.biz>) id 1J8DAo-0001kE-1Q
	for openembedded-devel@openembedded.org; Fri, 28 Dec 2007 12:14:42 +0100
Received: (qmail 32229 invoked by uid 813007); 28 Dec 2007 11:08:47 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 28 Dec 2007 11:08:47 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Dec 2007 12:08:42 +0100
User-Agent: KMail/1.9.7
References: <4774C182.20501@gmail.com>
In-Reply-To: <4774C182.20501@gmail.com>
MIME-Version: 1.0
Message-Id: <200712281208.44069.openembedded@haerwu.biz>
Cc: angstrom-distro-devel@linuxtogo.org
Subject: Re: Tosa kernel bloat
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
X-List-Received-Date: Fri, 28 Dec 2007 11:14:45 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia pi=B1tek, 28 grudnia 2007, Junqian Gordon Xu napisa=B3:
> Tosa kernel is bloated with the recent patch and change to
> defconfig-tosa
>
> |`/home/gordon/oe/build/tmp/work/tosa-angstrom-linux-gnueabi/linux-rp-2
> |.6.23-r14/linux-2.6.23' Size is 1296464
> | FATAL: This kernel is too big for your PXA Zaurus and will destroy
>
> data if you flash it. Please reduce the size of the kernel by making
> more of it modular.

Same on Poodle:

| make[1]: Leaving directory=20
`/home/hrw/devel/build/angstrom/tmp/work/poodle-angstrom-linux-gnueabi/linu=
x-rp-2.6.23-r14/linux-2.6.23'
| Size is 1306384
| FATAL: This kernel is too big for your PXA Zaurus and will destroy data=20
if you flash it. Please reduce the size of the kernel by making more of=20
it modular.



=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

           Q:      What's a light-year?
           A:      One-third less calories than a regular year.




