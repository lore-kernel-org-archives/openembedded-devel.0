Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PhOM9-0004M2-4m
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 16:29:25 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PhOLP-0004Y8-Gj from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 07:28:39 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 24 Jan 2011 07:28:38 -0800
Received: from [172.30.80.64] ([172.30.80.64]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 24 Jan 2011 08:28:38 -0700
Message-ID: <4D3D9AA4.9030608@mentor.com>
Date: Mon, 24 Jan 2011 08:28:36 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295834629-3974-1-git-send-email-raj.khem@gmail.com>	<ihjf6u$c5u$1@dough.gmane.org>	<AANLkTin6h0bLj=s=ngGQrJMEQx2PBfK3hbm54nsmXari@mail.gmail.com>	<ihjhd3$n1e$1@dough.gmane.org>	<AANLkTikqMQ8_xZZUjrm3Cu2GVJ5COM0u5PFuGAvyst+2@mail.gmail.com>
	<4D3D9777.6060109@balister.org>
In-Reply-To: <4D3D9777.6060109@balister.org>
X-OriginalArrivalTime: 24 Jan 2011 15:28:38.0551 (UTC)
	FILETIME=[5F8D2A70:01CBBBDB]
Subject: Re: [PATCH] angstrom-2010.x.conf: Prefer binutils 2.21	and	uclibc-git
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
X-List-Received-Date: Mon, 24 Jan 2011 15:29:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/24/2011 08:15 AM, Philip Balister wrote:
> On 01/24/2011 01:59 AM, Frans Meulenbroeks wrote:
>> 2011/1/24 Koen Kooi<k.kooi@student.utwente.nl>:
>>> -----BEGIN PGP SIGNED MESSAGE-----
>>> Hash: SHA1
>>>
>> Pushing distro changes without review is against the policy:
>>
>>> From http://www.openembedded.org/index.php/Commit_Policy:
>>
>> * Distro config changes should be reviewed by the distro maintainers
>> where known
>>
>> Reveting changes from others is also against the policy:
>>
>> http://www.openembedded.org/index.php/Revert_Policy
>>
>> (and imho equally bad (or insulting if you prefer))
>>
>>
>> Do unto others as you would have them do unto you
>>
>> My two eurocents. Frans.
>
> Frans, as noted this change intoduces serious issues with some Angstrom
> targets. The Angstrom devs know what is best for Angstrom. I'm not sure
> what Khem was thinking by pushing this change without consulting with
> Angstrom devs.

Not to put too many words into Khem's mouth, but I imagine it was that 
he checked this in on the same branch as the other changes he pushed 
last night and forgot (time for some 'git stash'ing Khem :))

-- 
Tom Rini
Mentor Graphics Corporation


