Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q07uz-0000ZP-98 for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 08:46:49 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q07tL-0004uP-GF for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 08:45:07 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 08:45:07 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 08:45:07 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 17 Mar 2011 08:44:56 +0100
Message-ID: <ilse5o$fd4$1@dough.gmane.org>
References: <1300296140-7275-1-git-send-email-Chase.Maupin@ti.com>	<ilqv4v$66u$1@dough.gmane.org>
	<131E5DFBE7373E4C8D813795A6AA7F080340AC3EC2@dlee06.ent.ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F080340AC3EC2@dlee06.ent.ti.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH][2011.003-maintenance] ti-pru-sw-example: fix building with new toolchain sysroot
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
X-List-Received-Date: Thu, 17 Mar 2011 07:46:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 16-03-11 20:02, Maupin, Chase wrote:
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>> Koen Kooi
>> Sent: Wednesday, March 16, 2011 1:22 PM
>> To: openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] [PATCH][2011.003-maintenance] ti-pru-sw-example: fix
>> building with new toolchain sysroot
>>
> On 16-03-11 18:22, Chase Maupin wrote:
>>>> * Patch taken from Arago overlay where it was added by
>>>>   Denys Dmytriyenko
>>>> * PR incremented by two to align recipe PR values between Arago
>>>>   and OE.
>>>>
>>>> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> 
> NAK, this hasn't been thru .dev yet.
> 
>> Just submitted all 4 of my patches for .dev.  Thanks.

I've staged them here:
http://dominion.thruhere.net/git/cgit.cgi/openembedded/log/?h=2011.03-maintenance
(subject to rebasing).

Do you want to would for the pull request to go out tomorrow, or do you
want Tom to pick up your patches seperately?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNgbv3MkyGM64RGpERAhAuAJ4iE8FFf/ZNqHJF06GSeOEhum9y+wCeOeMO
drixfFNicVpKY2l05LPSynw=
=NAy9
-----END PGP SIGNATURE-----



