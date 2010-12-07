Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PPzah-0001Ws-9f for openembedded-devel@lists.openembedded.org;
	Tue, 07 Dec 2010 16:36:32 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PPzZI-00045p-Lm for openembedded-devel@lists.openembedded.org;
	Tue, 07 Dec 2010 16:35:04 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Dec 2010 16:35:04 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Dec 2010 16:35:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 07 Dec 2010 16:34:32 +0100
Message-ID: <idlk69$rbg$2@dough.gmane.org>
References: <4cf49384.a26fe50a.019c.ffffed4d@mx.google.com>
	<20101207113857.GG20482@excalibur.local>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.15) Gecko/20101031 Shredder/3.0.11pre
In-Reply-To: <20101207113857.GG20482@excalibur.local>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCHv3 1/5] u-boot_git:add patch for am3517-crane board support
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
X-List-Received-Date: Tue, 07 Dec 2010 15:36:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 07-12-10 12:38, Stefan Schmidt wrote:
> Hello.
> 
> On Tue, 2010-11-30 at 11:32, Anil Kumar wrote:
>>     * Patch Version updated for latest git tree.
>>
>>     * This patch adds u-boot support for am3517-crane board.
>>
>>     * CraneBoard is a hardware development platform based
>>       on the Sitara AM3517 ARM Cortex - A8 microprocessor
>>       device. This is a low cost reference design.
>>
>>     * You can find more about CraneBoard here:
>>            [1] http://www.ti.com/arm
>>            [2] http://www.mistralsolutions.com/products/craneboard.php
>>
>> Signed-off-by: Anil Kumar <anilm@mistralsolutions.com>
> 
> I only reviewd the OE part, not the u-boot patch itself.
> 
> Acked-by: Stefan Schmidt <stefan@datenfreihafen.org>
> 
> Who is going to take this one? On some earlier iterations I have seen Koen
> stating that he will take them. Still the case?

It is. My craneboard should be arriving this week, so I'm waiting for
that :)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFM/lQIMkyGM64RGpERApXJAJwJI8k0tfAMSTcYbLro6oWRSwm/owCfXwpl
aeA1LnJ3ZIQPBciOPX0Jdjw=
=OKVC
-----END PGP SIGNATURE-----



