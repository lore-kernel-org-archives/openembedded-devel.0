Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NVQVe-00064Q-QE for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jan 2010 15:17:17 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NVQTY-0002fC-Hu
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jan 2010 15:15:04 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2010 15:15:04 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2010 15:15:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 14 Jan 2010 15:12:24 +0100
Message-ID: <hin8o7$2ml$2@ger.gmane.org>
References: <hill5g$ll0$1@ger.gmane.org>	<1263426466.457.286.camel@lenovo.internal.reciva.com>	<1263427123.15954.6.camel@dax.rpnet.com>
	<hilp2s$ag$1@ger.gmane.org>	<himn94$8ui$1@ger.gmane.org>
	<1263477134.22868.65.camel@andromeda>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100112 Shredder/3.0.2pre
In-Reply-To: <1263477134.22868.65.camel@andromeda>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: RFC: Sane default for SPLASH
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
X-List-Received-Date: Thu, 14 Jan 2010 14:17:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 14-01-10 14:52, Michael 'Mickey' Lauer wrote:
> Am Donnerstag, den 14.01.2010, 10:14 +0100 schrieb Koen Kooi:
>> NAK, the needless SPLASH -> BOOTSPLASH will create too much work for
>> people to catch up to, and it messes up the docs on the subject.
> 
> Could you expand on that reason? I find the patch quite a useful
> refactoring. If we don't allow patches like this going in, we're
> doomed into living with misnomers forever -- and we all know that
> there are quite a few in OE metadata.

If you want to fix such misnomers it needs to be done with more thought
and publicity to allow external repos to catch up. No need to stab
people in the eye to make 2 people feel better.
And FWIW, psplash runs at shutdown as well, so it isn't really a
bootsplash ;)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLTyZIMkyGM64RGpERAqUXAKCsvCCu4AtWzl7ksBhuCzSKVhGaDgCfdKn6
GGBVwWvHLQGeyvYAe820rE0=
=K0dG
-----END PGP SIGNATURE-----



