Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QRgnH-0003PS-3u for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jun 2011 10:28:47 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QRgQM-00014m-Sm for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jun 2011 10:05:06 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jun 2011 10:05:06 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jun 2011 10:05:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 01 Jun 2011 10:04:53 +0200
Message-ID: <is4rr7$4t9$1@dough.gmane.org>
References: <BANLkTi=qZLnR+PJX7yV+=MnD=rkNJAh9Cw@mail.gmail.com>	<is31co$63t$1@dough.gmane.org>	<BANLkTimE2Y=zrWtyWPKekDeUpcmdfFNENA@mail.gmail.com>	<is38b0$k1j$1@dough.gmane.org>
	<BANLkTi=C56_ztMy5NnWv9KyOgL2VbVrN7Q@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <BANLkTi=C56_ztMy5NnWv9KyOgL2VbVrN7Q@mail.gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe] udev 171 is broken
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
X-List-Received-Date: Wed, 01 Jun 2011 08:28:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 31-05-11 20:19, Otavio Salvador wrote:
> On Tue, May 31, 2011 at 17:25, Koen Kooi <koen@dominion.thruhere.net> wrote:
> ...
>> I was thinking of putting it back in, could you try creating a rule with
> ...
> 
> I didn't try it yet but seems logical to support it out of box.
> Otherwise udev could rrecomends udev-extra-rules so it also works by
> default. If someone put it on bad-recomendation then he/she can handle
> it.

On a c3 beagleboard the rule made booting 0.2 seconds slower with
systemd, which seems a good trade-off, so it's pack in the main udev
package now.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN5fKlMkyGM64RGpERAmAYAJ0TOboii9+7T521ei4kZbjeKjUYmQCfd3nR
LdA/Td+u5bhsIHl02bzcmFw=
=9gtz
-----END PGP SIGNATURE-----



