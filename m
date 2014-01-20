Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1425A6CCF4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2014 14:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 616543148A20;
	Mon, 20 Jan 2014 15:59:32 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id WgyDWxHOrV-K; Mon, 20 Jan 2014 15:59:29 +0100 (CET)
Received: from [172.22.22.61] (unknown [212.255.40.44])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 211C63148A1F;
	Mon, 20 Jan 2014 15:59:29 +0100 (CET)
Message-ID: <52DD39CF.5040401@opendreambox.org>
Date: Mon, 20 Jan 2014 15:59:27 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <1382009929-6537-1-git-send-email-obi@opendreambox.org>
	<1382010620-6944-1-git-send-email-obi@opendreambox.org>
	<52A075E3.5020707@opendreambox.org>
	<644C5C58-7C6F-4D66-AAB0-BA7C3A0099A2@dominion.thruhere.net>
In-Reply-To: <644C5C58-7C6F-4D66-AAB0-BA7C3A0099A2@dominion.thruhere.net>
Cc: "openembedded-devel@lists.openembedded.org List"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-filesystems][PATCH v2] xfsprogs: change DESCRIPTION to SUMMARY
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Jan 2014 14:59:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Ping. :-)

This trivial patch is still waiting for inclusion.

Regards,
Andreas

On 05.12.2013 15:12, Koen Kooi wrote:
> Acked-by: Koen Kooi <koen@dominion.thruhere.net>
> 
> Op 5 dec. 2013, om 13:47 heeft Andreas Oberritter <obi@opendreambox.org> het volgende geschreven:
> 
>> Ping.
>>
>> On 17.10.2013 13:50, Andreas Oberritter wrote:
>>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>>> ---
>>> meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.1.11.bb | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.1.11.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.1.11.bb
>>> index ceb0ddf..1dc6f09 100644
>>> --- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.1.11.bb
>>> +++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.1.11.bb
>>> @@ -1,4 +1,4 @@
>>> -DESCRIPTION = "XFS Filesystem Utilities"
>>> +SUMMARY = "XFS Filesystem Utilities"
>>> HOMEPAGE = "http://oss.sgi.com/projects/xfs"
>>> SECTION = "base"
>>> LICENSE = "GPLv2"
>>>
>>
>>
> 


