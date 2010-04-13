Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O1fb1-0008S1-OI for openembedded-devel@lists.openembedded.org;
	Tue, 13 Apr 2010 14:52:04 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O1fXg-0007dh-HV for openembedded-devel@lists.openembedded.org;
	Tue, 13 Apr 2010 14:48:36 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Apr 2010 14:48:36 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Apr 2010 14:48:36 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 13 Apr 2010 14:48:28 +0200
Message-ID: <hq1p6s$gnd$1@dough.gmane.org>
References: <hq16p2$e9c$1@dough.gmane.org> <1271158854.15813.137.camel@rex>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100406 Shredder/3.0.5pre
In-Reply-To: <1271158854.15813.137.camel@rex>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Python 2.6 for bitbake?
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
X-List-Received-Date: Tue, 13 Apr 2010 12:52:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 13-04-10 13:40, Richard Purdie wrote:
> On Tue, 2010-04-13 at 09:33 +0200, Koen Kooi wrote:
>> I just noticed bitbake master is using python 2.6, which means I can't
>> use it at work when the official linux is still ubuntu 8.04LTS :(
>>
>> Can we please keep bitbake working with 8.04LTS? I suspect not only TI
>> is on the LTS bandwagon....
> 
> I thought we'd make the bits that were 2.6 optional? Which bits are
> breaking and I assume you do have python 2.5 a least?

Ubuntu 8.04LTS has 2.5.2 and it could that I'm blaming the brokenness in
master on python, but it's broken nevertheless....
When I finish doing the build I'll send the error message (was something
with "Exception as e:").

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLxGgcMkyGM64RGpERAkNQAKCcWroIjrMbjxRywD6aTtwBtPCBNgCfT5n4
xtuqHWY2NHiIJNN4KlaRt0g=
=SqMt
-----END PGP SIGNATURE-----



