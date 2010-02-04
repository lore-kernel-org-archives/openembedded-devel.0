Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NcwTi-0005l1-Ac for openembedded-devel@lists.openembedded.org;
	Thu, 04 Feb 2010 08:50:21 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NcwRJ-0005dT-Na for openembedded-devel@lists.openembedded.org;
	Thu, 04 Feb 2010 08:47:49 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Feb 2010 08:47:49 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Feb 2010 08:47:49 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 04 Feb 2010 08:47:25 +0100
Message-ID: <hkdu2c$cfg$1@ger.gmane.org>
References: <1265189276.5591.40.camel@mattotaupa>
	<ac9c93b11002031422t18df39f6m77de57c50241227@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100114 Shredder/3.0.2pre
In-Reply-To: <ac9c93b11002031422t18df39f6m77de57c50241227@mail.gmail.com>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: =?UTF-8?B?UmU6IEFzdXMgRWVlIFBDIDcwMSA0RywgcGVyZm9ybWFuY2UgYW5kIGluY2x1c2lvbiBpbnRvIMOFbmdzdHLDtm0=?=
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
X-List-Received-Date: Thu, 04 Feb 2010 07:50:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03-02-10 23:22, Frans Meulenbroeks wrote:
> 2010/2/3 Paul Menzel <paulepanter@users.sourceforge.net>:
>> Dear Denis and OE developers,
>>
>>
>> Denis committed support for Asus Eee PC 701 4G [2] some days ago [1].
>>
>> 1. Denis, could tell us something about the performance of OE on this
>> netbook compared to the distribution you ran on there before.
>>
>> 2. Is it possible to include this machine in the Ångström online builder
>> [3]?
>>
> 
> Here is a patch for narcissus
> Sorry that it is an attachment but had to beat gmails line wrapping.
> 
> Koen, can you review and apply if ok?

Applied with one small changes (unstable/*.ipk -> configs/unstable/*.ipk).

Thanks for the patch!
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD4DBQFLanuNMkyGM64RGpERAqK/AJ9u5jzu3RJ+/RAqybaFznmsALOlsACWNW/A
kgneMzqXaEqpmKpE7nF1fg==
=FH0k
-----END PGP SIGNATURE-----



