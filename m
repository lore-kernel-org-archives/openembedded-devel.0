Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OhKh4-00083A-CN for openembedded-devel@lists.openembedded.org;
	Fri, 06 Aug 2010 13:02:31 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OhKgv-0005IG-1x for openembedded-devel@lists.openembedded.org;
	Fri, 06 Aug 2010 13:02:21 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Aug 2010 13:02:21 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Aug 2010 13:02:21 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 06 Aug 2010 13:02:10 +0200
Message-ID: <i3gq3i$sop$1@dough.gmane.org>
References: <i3f3gm$5lu$1@dough.gmane.org> <1281085422.3809.7.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100718 Shredder/3.0.7pre
In-Reply-To: <1281085422.3809.7.camel@mattotaupa>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: patchwork, please keep patches up to date
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
X-List-Received-Date: Fri, 06 Aug 2010 11:02:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 06-08-10 11:03, Paul Menzel wrote:
> Dear OE folks,
> 
> 
> Am Donnerstag, den 05.08.2010, 21:30 +0200 schrieb Koen Kooi:
> 
> […]
> 
>> I had a look around patchwork and I noticed lots of duplicates and
>> already applied patches are still in the queue, so I have a small request:
>>
>> Could the people sending patches to this mailinglist update their status
>> in patchwork? And can people applying patches also update the status?
> 
> there is also `pwclient` for the command line. Please take a look at the
> Wiki page [1] for more information.
> 
> By the way, there are some examples in the Patchwork repository for post
> commit hooks to mark those patches automatically as applied. (Since the
> Patchwork repository is not browsable take a look at [2] for example.)

That would be nice to have once patchwork will live on the same server
as the git repo. Maybe someone from the infrastructure team can give an
update on that situation.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMW+uyMkyGM64RGpERAoUDAJ9eNHSM/EYamBCJC8I/jR27FyjpaQCgoiiW
fGPUbahE2rPSmpOCfyQFR8A=
=FSPp
-----END PGP SIGNATURE-----



