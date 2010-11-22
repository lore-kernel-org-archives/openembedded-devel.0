Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PKSC5-00051W-FD for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 09:56:14 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PKSAx-0007mf-MN for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 09:55:03 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 09:55:03 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 09:55:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 22 Nov 2010 09:52:50 +0100
Message-ID: <icdb12$llq$1@dough.gmane.org>
References: <E1PJRde-0007Xb-3l@melo.openembedded.org>	<4CE69FC7.2040607@mistralsolutions.com>
	<20101119210551.GD8017@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.15) Gecko/20101031 Shredder/3.0.11pre
In-Reply-To: <20101119210551.GD8017@gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: am3517/05 : Add am3517-crane machine type
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
X-List-Received-Date: Mon, 22 Nov 2010 08:56:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 19-11-10 22:05, Khem Raj wrote:
> On (19/11/10 21:33), Anil wrote:
>> Hi All,
>>
>> Adding support for AM3517/05-Craneboard machine type to openembedded.
>>
>> Craneboard is a hardware development platform based on the Sitara
>> AM3517 ARM Cortex - A8 microprocessor device. This is a low cost
>> reference design.
>>
>> These patches adds support for craneboard  x-load,  u-boot and
>> kernel along with configuration file for openembedded.
> 
> Thanks for patches. Could you break them up into individual patches
> and send them to ml so people can look at the parts they are interested in
> http://wiki.openembedded.org/index.php/How_to_submit_a_patch_to_OpenEmbedded

I've also said internally at TI that these patches need more work and
have to go through a different path, I'll take care of merging these
patches that way.

regards,

Koen


> 
> 
>>
>>     [1] http://www.ti.com/arm
>>     [2] http://www.mistralsolutions.com/products/craneboard.php
>>
>> Please review and let me know your comments.
>>
>> .--
>> Thanks and regards
>> Anil kumar .M
>>
>>
>>
>> Please do not print this email unless it is absolutely necessary. Spread environmental awareness.
>>
>> -------------------------------------------------------DISCLAIMER------------------------------------------------------
>> The information transmitted herewith is confidential and proprietary information intended only for use by the individual or entity to which it is addressed. If the reader of this message is not the intended recipient, you are hereby notified that any review, retransmission, dissemination, distribution, copying or other use of, or taking of any action in reliance upon this information is strictly prohibited. If you have received this communication in error, please contact the sender and delete the material from your computer.
>> ---------------------------------------------------------------------------------------------------------------------------
> 
> 
> and cut such crap out in future. You are sending stuff to public mailing
> lists. 
> 
> -Khem

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFM6i9iMkyGM64RGpERAu8SAJ9OWe0H09eMGrtysgmlYGa+aczyWQCfXQqv
FU9EV59wd8vM4d/X7zPhNuU=
=bihj
-----END PGP SIGNATURE-----



