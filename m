Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OdSZp-0002PH-Pg for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 20:39:02 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OdSZY-0000IU-0i for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 20:38:44 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 20:38:44 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 20:38:44 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 26 Jul 2010 20:38:34 +0200
Message-ID: <i2kkna$3o5$1@dough.gmane.org>
References: <4C4D586A.5040202@kernelconcepts.de>	<i2jrnl$4j3$2@dough.gmane.org>	<AANLkTimRxtBib-WUkcm75eNLQvws8Rw-Nf-Z6uQvFetR@mail.gmail.com>	<i2julr$fbh$1@dough.gmane.org>	<FABAFD53-F00E-4D6E-811E-4249C9853C8C@vanille-media.de>	<4C4D862E.2050202@kernelconcepts.de>
	<4C4DC285.3070201@mentor.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <4C4DC285.3070201@mentor.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: native preferences
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
X-List-Received-Date: Mon, 26 Jul 2010 18:39:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 26-07-10 19:14, Tom Rini wrote:
> Florian Boor wrote:
>> Hi,
>>
>> Dr. Michael Lauer schrieb:
>>> Of course the preferred way - rather than switching distros - is to
>>> fix this obvious bug
>>> in the OE metadata.
>>
>> yes I see it like this. Switching to a distribution that pins more
>> versions is
>> not really what I would call a fix. It is a workaround but should not
>> become the
>> default way to deal with such issues in OE.
>> What we introduced here is clearly a bug in OE and not the
>> distributions fault.
> 
> Except that it's a bitbake issue, not a metadata issue, iirc (which is
> why it's fixed in the 1.10 branch, but not 1.8).

Yes, that's why I said "the bug has been fixed
in bitbake 1.10" earlier in the thread :)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMTdYqMkyGM64RGpERAnN3AKCdCvwWQhKF8Ta4A4x/vpctt45XGgCcC66C
7swo93nDkqCt95K4OPWbTxY=
=ENxb
-----END PGP SIGNATURE-----



