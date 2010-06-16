Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OOpPE-0006Nv-FH for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 11:59:36 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OOpKp-0006Ag-Dw for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 11:55:03 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 11:55:03 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 11:55:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 16 Jun 2010 11:49:00 +0200
Message-ID: <hva6mc$vtv$4@dough.gmane.org>
References: <4C187CF6.5010401@gmx.net> <hva2qe$jco$1@dough.gmane.org>
	<20100616091709.GA20969@excalibur.local>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100524 Shredder/3.0.6pre
In-Reply-To: <20100616091709.GA20969@excalibur.local>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] add ubuntu patch which adds atomic builtin support to gcc 4.3.[3 but also other microversions]
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
X-List-Received-Date: Wed, 16 Jun 2010 09:59:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 16-06-10 11:17, Stefan Schmidt wrote:
> Hello.
> 
> On Wed, 2010-06-16 at 10:42, Koen Kooi wrote:
>>
>> My second question: When is all that openjdk stuff you keep talking
>> about ending up in OE? I know Henning keeps handwaving about it not
>> being ready, but after after waiting a year, is it ever going to be
>> deemed ready by the jalimo crew? Just merge it into OE now :)
> 
> I can't speak for the jalimo crew but I can tell you that Tarent is currently
> hired by BugLabs to bring in openjdk-6 and different other things to OE dev and
> stable for our upcoming BugLabs stuff.
> 
> It seems to me that Robert is right now trying to bring in all the needed deps
> for some parts. Talking LLVM, and therefor this patch, for JIT and others. If
> nothing problematics happens we should have this stuff in dev (and hopefully
> also stable) withing the next weeks.

That's great news! I did beat nss from the jalimo repo into shape and
pushed it into OE, but I couldn't get any other java bits to work,
sadly. Henning said I was missing the magic java incantations in
angstrom and after adding those I could build things like jamvm :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMGJ4MMkyGM64RGpERAsk2AJ9fs3AgcT+B2XYy0rIk68fsItoJxwCfc7C1
LeDL3aiZlMcXcYCPYcMHMw8=
=3esD
-----END PGP SIGNATURE-----



