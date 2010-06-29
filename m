Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OTgFz-0001TF-Gd for openembedded-devel@lists.openembedded.org;
	Tue, 29 Jun 2010 21:14:08 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OTgBS-0007FG-2P for openembedded-devel@lists.openembedded.org;
	Tue, 29 Jun 2010 21:09:26 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jun 2010 21:09:26 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jun 2010 21:09:26 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 29 Jun 2010 21:09:14 +0200
Message-ID: <i0dgcq$5bd$1@dough.gmane.org>
References: <i0db6m$i2r$1@dough.gmane.org>
	<AANLkTinUYu9iA2hbr7F6j1qFyIV9jF-pQWH4lsMneTmc@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <AANLkTinUYu9iA2hbr7F6j1qFyIV9jF-pQWH4lsMneTmc@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: realpath build breakage
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
X-List-Received-Date: Tue, 29 Jun 2010 19:14:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 29-06-10 20:04, Khem Raj wrote:
> On Tue, Jun 29, 2010 at 10:40 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Hi,
>>
>> ERROR: QA Issue with realpath: No GNU_HASH in the elf binary:
>> '/OE/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/realpath-1.15-r0/packages-split/realpath/usr/bin/realpath'
>> FATAL: QA run found fatal errors. Please consider fixing them.
>>
>> Khem, would you please consider fixing that?
> 
> my bad. I tested it on mips and mips does not use gnuhash the arm
> build was still running overnight
> and it stopped at the very same error this morning.
> fixed now with c86e303133eb530ea12a4e57cec5d3af62d141a0

Thanks!
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMKkTaMkyGM64RGpERAsAFAJwKRjqpneNySHVofKRBjzUS2ujXIgCfViMt
Bt/dIzgwUz/VzZql+codmzE=
=Mkag
-----END PGP SIGNATURE-----



