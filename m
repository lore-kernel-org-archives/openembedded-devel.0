Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O096g-0004sk-FZ for openembedded-devel@lists.openembedded.org;
	Fri, 09 Apr 2010 09:58:27 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O093P-0004OR-Gt for openembedded-devel@lists.openembedded.org;
	Fri, 09 Apr 2010 09:55:03 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Apr 2010 09:55:03 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Apr 2010 09:55:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 09 Apr 2010 09:49:58 +0200
Message-ID: <hpmm79$s8u$1@dough.gmane.org>
References: <1268482329.11170.31.camel@mattotaupa>	<hnj0q5$luv$1@dough.gmane.org>
	<1268608081.3809.6.camel@mattotaupa>
	<1270763612.29502.9.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100329 Shredder/3.0.5pre
In-Reply-To: <1270763612.29502.9.camel@mattotaupa>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
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
X-List-Received-Date: Fri, 09 Apr 2010 07:58:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08-04-10 23:53, Paul Menzel wrote:
> Dear Koen,
> 
> 
> Am Montag, den 15.03.2010, 00:08 +0100 schrieb Paul Menzel:
>> Am Sonntag, den 14.03.2010, 16:53 +0100 schrieb Koen Kooi:
>>> Thanks for the patch! I have a huuuuge stack of changed queued for TI
>>> platforms (beagle, hawk, omap3evm etc) that will be merged next week, so
>>> I recreated your patch on top of that:
>>>
>>> http://gitorious.org/angstrom/openembedded/commit/3891af0d4838f1445ee27f6be4258d558731f3ea
>>
>> Thanks for doing that. I updated the state in Patchwork.
>>
>>     $ ./pwclient update -s accepted 1711
>>
>>> And the branch:
>>>
>>> http://gitorious.org/angstrom/openembedded/commits/ti/staging
> 
> do you have an estimate when you will merge your changes.

"2 weeks ago" was the plan, but of the 3 people involved one had a baby,
one is on-site for a customer rush job and the other had time off for
personal circumstances, so not a lot got done.

The conference call this afternoon should give us the green light,
*fingers crossed*

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLvtwmMkyGM64RGpERAlkbAJ9IZvAlhDIYY5pMEM/pOAVaPyXCuwCeIAvI
g6ISCr7kUM+Ukr4VTCwGv+g=
=B1wg
-----END PGP SIGNATURE-----



