Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OcFHe-0001Od-UJ for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 12:15:15 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OcFHT-0000fB-NV for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 12:15:03 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jul 2010 12:15:03 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jul 2010 12:15:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 23 Jul 2010 12:09:56 +0200
Message-ID: <i2bppk$m42$1@dough.gmane.org>
References: <201007230134.59343.david.lanzendoerfer@o2s.ch>	<59B9E304-2B14-4D9F-80F7-8AB7A234D404@vanille-media.de>
	<AANLkTinjBZ6TOcDYvoeeAbqKjA19Roh6XQwvg9=u006s@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <AANLkTinjBZ6TOcDYvoeeAbqKjA19Roh6XQwvg9=u006s@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Adding maxima recipe (tool for algebraic calculation)
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
X-List-Received-Date: Fri, 23 Jul 2010 10:15:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 23-07-10 11:23, Frans Meulenbroeks wrote:
> 2010/7/23 Dr. Michael Lauer <mickey@vanille-media.de>
> 
>>> +DESCRIPTION="Free computer algebra environment based on Macsyma"
>>> +HOMEPAGE="http://maxima.sourceforge.net/"
>>> +SRC_URI="http://www.sfr-fresh.com/unix/misc/${P}.tar.gz<http://www.sfr-fresh.com/unix/misc/$%7BP%7D.tar.gz>
>> "
>>> +LICENSE="GPLv2"
>>
>> Whitespace, please.
>>
>> Thanks.
>>
>> Mssed that one, but yes, you are right. For the author, Mickey means having
> spaces around the =
> 
> Linebreaks also crossed my mind, but frankly speaking I'm not too sure about
> the policy there.
> Also typically LICENSE is before SRC_URI (that should be fixed too)

there's contrib/oe-stylize.py for that. It's not 100% correct, but it
will give you a good idea what to fix.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMSWpzMkyGM64RGpERAmkdAJ4vQmOwn1RnMIX9Tf8vL6amjCcqMwCgucbx
Kl6YxNlZVXxNc/ZUDlxoJtc=
=1HX6
-----END PGP SIGNATURE-----



