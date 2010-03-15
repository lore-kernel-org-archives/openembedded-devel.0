Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nr5tv-0005eM-Eh for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 09:43:55 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nr5r1-0000hn-57 for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 09:40:51 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 09:40:51 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 09:40:51 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 15 Mar 2010 09:40:39 +0100
Message-ID: <hnkrq7$igh$1@dough.gmane.org>
References: <1268482329.11170.31.camel@mattotaupa>	<hnj0q5$luv$1@dough.gmane.org>
	<1268608081.3809.6.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100223 Shredder/3.0.3pre
In-Reply-To: <1268608081.3809.6.camel@mattotaupa>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] linux-omap*/beagleboard/defconfig: Compile Ext4 support into Linux.
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
X-List-Received-Date: Mon, 15 Mar 2010 08:43:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 15-03-10 00:08, Paul Menzel wrote:
> Dear Koen,
> 
> 
> Am Sonntag, den 14.03.2010, 16:53 +0100 schrieb Koen Kooi:
>> Thanks for the patch! I have a huuuuge stack of changed queued for TI
>> platforms (beagle, hawk, omap3evm etc) that will be merged next week, so
>> I recreated your patch on top of that:
>>
>> http://gitorious.org/angstrom/openembedded/commit/3891af0d4838f1445ee27f6be4258d558731f3ea
> 
> Thanks for doing that. I updated the state in Patchwork.
> 
>     $ ./pwclient update -s accepted 1711
> 
>> And the branch:
>>
>> http://gitorious.org/angstrom/openembedded/commits/ti/staging
>>
>> Please let me know if that commit matches your intent.
> 
> Yes it is. Besides that you shortened the commit message a little bit
> XorA told me on IRC to formulate. ;-) Since you are in the TSC I am ok
> with this.

The change in commit message is due to me not having access to OE mail
on the computer I committed this on, so I had to type it in from memory.
There was nothing wrong with yours, just with my memory :)

regards,

KOen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLnfKHMkyGM64RGpERAmg2AJwMG4VHDU0dt8OupSTELccJHTfdfACgi8Zv
VsjNUhf2cWA2HZ66xDyn39I=
=Pdav
-----END PGP SIGNATURE-----



