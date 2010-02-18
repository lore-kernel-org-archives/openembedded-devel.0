Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ni4B9-0000ec-5E for openembedded-devel@lists.openembedded.org;
	Thu, 18 Feb 2010 12:04:24 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ni48a-0000Hh-Ce for openembedded-devel@lists.openembedded.org;
	Thu, 18 Feb 2010 12:01:40 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2010 12:01:40 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2010 12:01:40 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 18 Feb 2010 12:01:13 +0100
Message-ID: <hlj6lo$tug$1@ger.gmane.org>
References: <E1Nhfko-0005L8-Mc@melo.openembedded.org>	<20100217104816.GJ3233@jama>
	<hlgk42$774$1@ger.gmane.org>	<201002172046.30607.holger+oe@freyther.de>	<hlhhfs$ik1$1@ger.gmane.org>
	<20100218102048.GO3233@jama>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100212 Shredder/3.0.2pre
In-Reply-To: <20100218102048.GO3233@jama>
X-Enigmail-Version: 1.0.1
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Koen Kooi : qt4: add 4.6.2
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
X-List-Received-Date: Thu, 18 Feb 2010 11:04:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 18-02-10 11:20, Martin Jansa wrote:
> On Wed, Feb 17, 2010 at 08:53:34PM +0100, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 17-02-10 20:46, Holger Hans Peter Freyther wrote:
>>> On Wednesday 17 February 2010 12:32:20 Koen Kooi wrote:
>>> for me.. but if it's right way, then it should be
>>>>> integrated to .inc files instead.
>>>>
>>>> Your patch looks good to me, but I'd like zecke to comment on it. Holger?
>>>
>>> Can't hurt..
>>>
>>> Acked-by: Holger Hans Peter Freyther <zecke@selfish.org>
>>
>> Acked-by: Koen Kooi <koen@openembedded.org>
> 
> Does both ACKs still hold for this integrated patch?

- From a quick look my ack still holds

> 
> Tested only on 4.6.2, only change for 4.3 and 4.5 should be added -I -L
> options as I didn't want to copy EXTRA_OECONF to those recipes just to
> remove them there (if they are not supported I guess only warning about
> unrecognized option will be emited).
> 
> Regards,
> 
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLfR35MkyGM64RGpERAnv2AJ9Y89RMz/koCwZqdYbuWARAVY/27gCeMPDz
fZU/pYbt2wtw0/mtgolCQCI=
=C7md
-----END PGP SIGNATURE-----



