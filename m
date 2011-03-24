Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q2p8f-00083U-QO for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 19:20:06 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q2p6p-0000es-Fo for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 19:18:11 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 19:18:11 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 19:18:11 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 24 Mar 2011 19:17:58 +0100
Message-ID: <img1sm$q20$1@dough.gmane.org>
References: <1300971676-31774-1-git-send-email-heroor@gmail.com>
	<1300974563.3795.29.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1300974563.3795.29.camel@mattotaupa>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 1/3] TI IPC: Fix License field.
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
X-List-Received-Date: Thu, 24 Mar 2011 18:20:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 24-03-11 14:49, Paul Menzel wrote:
> Am Donnerstag, den 24.03.2011, 18:31 +0530 schrieb Siddharth Heroor:
>> From: Siddharth Heroor <heroor@ti.com>
>>
>> * The correct license for TI IPC is BSD and not TI.
> 
> Was the original license a mistake or was it relicensed?
> 
>> Signed-off-by: Siddharth Heroor <heroor@ti.com>
>> ---
>>  recipes/ti/ti-ipc.inc |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/recipes/ti/ti-ipc.inc b/recipes/ti/ti-ipc.inc
>> index cd6ad6e..fc9b908 100644
>> --- a/recipes/ti/ti-ipc.inc
>> +++ b/recipes/ti/ti-ipc.inc
>> @@ -1,7 +1,7 @@
>>  DESCRIPTION = "TI Inter Process Ccommunication (IPC) Mechanisms (for Uni- and Multi- Processor Configurations)"
>>  HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ipc/index.html"
>>  SECTION = "devel"
>> -LICENSE = "TI" 
>> +LICENSE = "BSD" 
>>  
>>  require ti-paths.inc
>>  require ti-staging.inc
> 
> All Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>. I would
> push them or do the TI people want to push these?

Please don't push any TI patches without my or Denys' Ack/SOB.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNi4rWMkyGM64RGpERAu2LAJ9x+/eqEk+5Dh5Ae68O8GuSRYQhngCfcMco
4DpChXARi7jlI9jDXSZWKJs=
=cXET
-----END PGP SIGNATURE-----



