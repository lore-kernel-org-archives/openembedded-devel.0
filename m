Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NSoti-0007nG-SR for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jan 2010 10:43:22 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NSorh-0006lz-Lk
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jan 2010 10:41:13 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jan 2010 10:41:13 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jan 2010 10:41:13 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 07 Jan 2010 10:40:51 +0100
Message-ID: <hi4a73$gpt$2@ger.gmane.org>
References: <201001060507.31754.holger+oe@freyther.de>	<hi31m7$hc3$1@ger.gmane.org>	<20100107084341.GB1950@xora-vm2.xora.org.uk>	<ac9c93b11001070050i67af2caem7ac6d7164b130c@mail.gmail.com>	<20100107092121.GC1950@xora-vm2.xora.org.uk>
	<ac9c93b11001070135v3ec3e542m892c8a0fc014f4f6@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.5) Gecko/20091222 Shredder/3.0.1pre
In-Reply-To: <ac9c93b11001070135v3ec3e542m892c8a0fc014f4f6@mail.gmail.com>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: QA Goals for OpenEmbedded
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
X-List-Received-Date: Thu, 07 Jan 2010 09:43:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 07-01-10 10:35, Frans Meulenbroeks wrote:
> 2010/1/7 Graeme Gregory <dp@xora.org.uk>:
>> On Thu, Jan 07, 2010 at 09:50:36AM +0100, Frans Meulenbroeks wrote:
>>> 2010/1/7 Graeme Gregory <dp@xora.org.uk>:
>>>> On Wed, Jan 06, 2010 at 11:09:10PM +0100, Rolf Leggewie wrote:
>>>>> allergic to COMPATIBLE_MACHINE for no particular reason).  Bitbake can't
>>>>> do versioned depends and so we can't say that $bb2-$version does not
>>>>> compile with gcc less than 3.4.x, for example.  Those are just two
>>>>> examples.  XorA "solved" this in a hackish way with angsstrom.bbclass.
>>>>>
>>>> No he didnt and no its not a hack. Its a blacklist of packages that for
>>>> various reasons Angstrom NEVER wants built.
>>>
>>> Should we have such a blacklist per machine?
>>> My sheevaplug rungs angstrom, but as it has no display it has no need
>>> for an X server, nor for ide or pci or sata tools.
>>>
>> It follows the standard overide rules (or should do) so you should
>> be able to blacklist per machine.
>>
>> Of course you chose a bad example as I know quite a few people are using
>> the sheeva with usb displaylink adapters.
> 
> Ah ok, I don't know any of them, but let's stay on safe grounds and
> take pci or sata tools as an example ;-)

You don't like usb2sata adaptors?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLRawjMkyGM64RGpERAoFSAKCds8QU/tPv0gOIpDIshm1FZ/cJVQCgnoMl
3J3CPrd7P7UyYBDhCOebPfQ=
=cmr3
-----END PGP SIGNATURE-----



