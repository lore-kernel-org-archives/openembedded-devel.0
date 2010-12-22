Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PVUwA-0006k2-1R
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 21:05:26 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PVUw1-0007k1-5u from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 12:05:17 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 22 Dec 2010 12:05:16 -0800
Received: from [172.30.80.150] ([172.30.80.150]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 22 Dec 2010 13:05:16 -0700
Message-ID: <4D1259F7.9030905@mentor.com>
Date: Wed, 22 Dec 2010 13:05:11 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1293016481-703-1-git-send-email-koen@openembedded.org>
	<ietk2q$jdr$1@dough.gmane.org>
In-Reply-To: <ietk2q$jdr$1@dough.gmane.org>
X-OriginalArrivalTime: 22 Dec 2010 20:05:16.0145 (UTC)
	FILETIME=[8CDB4610:01CBA213]
Subject: Re: [PATCH] sanity: release 2010.12 is out, so bump minimum bitbake to 1.10.0 per TSC decision
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
X-List-Received-Date: Wed, 22 Dec 2010 20:05:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/22/2010 12:38 PM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 22-12-10 12:14, Koen Kooi wrote:
>> Signed-off-by: Koen Kooi<koen@openembedded.org>
>> ---
>>   conf/sanity.conf |    2 +-
>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/conf/sanity.conf b/conf/sanity.conf
>> index 0f53cb2..1c83c14 100644
>> --- a/conf/sanity.conf
>> +++ b/conf/sanity.conf
>> @@ -3,7 +3,7 @@
>>   # See sanity.bbclass
>>   #
>>   # Expert users can confirm their sanity with "touch conf/sanity.conf"
>> -BB_MIN_VERSION = "1.8.18"
>> +BB_MIN_VERSION = "1.10.0"
>>
>>   SANITY_ABIFILE = "${TMPDIR}/abi_version"
>>   SANITY_PRFILE = "${TMPDIR}/distro_pr"
>
> If people are agreeing, can I get some Acked-by lines please?

I agree with the concept but I want a patch that says 1.10.2 once Chris 
releases that hopefully later today.

-- 
Tom Rini
Mentor Graphics Corporation


