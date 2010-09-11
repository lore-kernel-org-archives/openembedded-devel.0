Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OuK8n-0008KM-OZ for openembedded-devel@lists.openembedded.org;
	Sat, 11 Sep 2010 09:04:50 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OuK85-0001Ad-6v for openembedded-devel@lists.openembedded.org;
	Sat, 11 Sep 2010 09:04:05 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Sep 2010 09:04:05 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Sep 2010 09:04:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 11 Sep 2010 09:03:57 +0200
Message-ID: <i6f9kt$1e3$1@dough.gmane.org>
References: <1284010137-15488-1-git-send-email-raj.khem@gmail.com>	<i6a71i$2tv$1@dough.gmane.org>	<AANLkTin-FbqWWLQE+ZJ9TA3zF70U=GBy5cbVm_DHqW5J@mail.gmail.com>
	<20100910192456.GL28148@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100729 Shredder/3.0.7pre
In-Reply-To: <20100910192456.GL28148@denix.org>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libgles-omap3_3.01.00.07.bb: Add recipe
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
X-List-Received-Date: Sat, 11 Sep 2010 07:04:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 10-09-10 21:24, Denys Dmytriyenko wrote:
> On Thu, Sep 09, 2010 at 06:04:28AM -0700, Steve Sakoman wrote:
>> n Thu, Sep 9, 2010 at 1:48 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>>> -----BEGIN PGP SIGNED MESSAGE-----
>>> Hash: SHA1
>>>
>>> On 09-09-10 07:28, Khem Raj wrote:
>>>> * Fix omap3-sgx-modules_1.4.14.2616.bb to use new SDK
>>>
>>> Khem, the .07 release was made to get the license and distribution
>>> changes through, it can now be downloaded with wget without filling in a
>>> form.
>>
>> Koen:  does the .07 release build against recent linux-omap kernels or
>> is it still broken in the same way as the .06 version?
> 
> Steve, the .07 release is exactly the same as .06 from the code perspective, 
> the only change is in licensing.

We talked Prabu into applying the texture patch to make life easier for
customers :) So the .07 release is the same as what OE previously built
as .06.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMiyndMkyGM64RGpERAiwuAKCO62rX++TzOwob/f9tuu/lklVkFACeI43p
8iuOcwlUgOPHJ3IpdD3tNsU=
=zqvs
-----END PGP SIGNATURE-----



