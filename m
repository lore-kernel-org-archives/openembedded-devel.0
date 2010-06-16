Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OOuOh-0001fA-IT for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 17:19:24 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OOuKO-0005uQ-6y for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 17:14:56 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 17:14:56 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 17:14:56 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 16 Jun 2010 17:14:39 +0200
Message-ID: <hvapp0$9vs$1@dough.gmane.org>
References: <1276625727-22991-1-git-send-email-stefan@datenfreihafen.org>	<1276625727-22991-2-git-send-email-stefan@datenfreihafen.org>	<hva6if$vtv$1@dough.gmane.org>
	<20100616150958.GC20969@excalibur.local>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100524 Shredder/3.0.6pre
In-Reply-To: <20100616150958.GC20969@excalibur.local>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][STABLE 1/4] bug20/xorg.conf: update to use tslib driver for touchscreen input device.
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
X-List-Received-Date: Wed, 16 Jun 2010 15:19:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 16-06-10 17:09, Stefan Schmidt wrote:
> Hello.
> 
> On Wed, 2010-06-16 at 11:46, Koen Kooi wrote:
>>
>> On 15-06-10 20:15, Stefan Schmidt wrote:
>>> From: Ken Gilmer <ken@buglabs.net>
>>>
>>>
>>> Signed-off-by: Ken Gilmer <ken@buglabs.net>
>>> Signed-off-by: Stefan Schmidt <stefan@buglabs.net>
>>
>> Acked-by: Koen Kooi <koen@openembedded.org>
> 
> Just to make sure I understand the stable process correctly. As this patches
> don't touch anything in the core system I'm fine apply them to stable myself
> after fetching them with the ACK form patchwork, right?

Not quite, you need 2 acks from maintainers of the stable branch (which
I think includes Marcin, Denys and me).
But given the low impact of these patches and the general stagnation of
stable/2009, I think it's safe to apply these.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMGOpfMkyGM64RGpERApKsAJ9gkmjjGb9ugl/agc3lU78eqgUBpwCbBjFe
6XU8hNhiXbmfEZyCHxSJvHg=
=/M81
-----END PGP SIGNATURE-----



