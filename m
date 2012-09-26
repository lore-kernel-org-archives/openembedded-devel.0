Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1TGo4f-000187-0K
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Sep 2012 11:38:33 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8Q9Pg40012123
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 26 Sep 2012 02:25:42 -0700 (PDT)
Received: from [128.224.162.158] (128.224.162.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Wed, 26 Sep 2012 02:25:41 -0700
Message-ID: <5062CA13.8090104@windriver.com>
Date: Wed, 26 Sep 2012 17:25:39 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <1348631669-22341-1-git-send-email-jackie.huang@windriver.com>
	<k3uap8$evl$1@ger.gmane.org> <5062C8B1.1080901@windriver.com>
	<2DD337DC-F013-4F8A-8BAE-6E7BCB4F4991@dominion.thruhere.net>
In-Reply-To: <2DD337DC-F013-4F8A-8BAE-6E7BCB4F4991@dominion.thruhere.net>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking] [PATCH] ptpd: migrate from meta-oe into meta-networking and uprev to ptpd 2.2.0
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
X-List-Received-Date: Wed, 26 Sep 2012 09:38:33 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 9/26/2012 5:20 PM, Koen Kooi wrote:
>
> Op 26 sep. 2012, om 11:19 heeft jhuang0 <jackie.huang@windriver.com> het volgende geschreven:
>
>>
>>
>> On 9/26/2012 3:27 PM, Koen Kooi wrote:
>>> -----BEGIN PGP SIGNED MESSAGE-----
>>> Hash: SHA1
>>>
>>> Op 26-09-12 05:54, jackie.huang@windriver.com schreef:
>>>> From: Jackie Huang <jackie.huang@windriver.com>
>>>>
>>>
>>>> meta-networking/recipes-daemons/ptpd/ptpd_1.0.0.bb |   20 +++++++
>>>> meta-networking/recipes-daemons/ptpd/ptpd_2.2.0.bb |   32 ++++++++++
>>>
>>> First: why do we need 2 versions?
>>
>> I thought we need to keep the versions we ever had. I will remove the old one.
>
> That would be 2 patches: 1 move, 1 update

ok, so I will still keep the old one, but just make 2 patches.

Thanks,
Jackie

>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745


