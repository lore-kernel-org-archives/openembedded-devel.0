Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5844D727D4
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Jan 2015 23:30:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t03NUT8H022384
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 3 Jan 2015 15:30:30 -0800 (PST)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Sat, 3 Jan 2015 15:30:29 -0800
Message-ID: <54A87B94.5020906@windriver.com>
Date: Sun, 4 Jan 2015 07:30:28 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1420326829-43562-1-git-send-email-liezhi.yang@windriver.com>
	<E1F36200-A2A9-419D-8B12-1324D2F493DE@gmail.com>
In-Reply-To: <E1F36200-A2A9-419D-8B12-1324D2F493DE@gmail.com>
Subject: Re: [meta-networking] [PATCH] dnrd: fix SRC_URI
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
X-List-Received-Date: Sat, 03 Jan 2015 23:30:34 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/04/2015 07:21 AM, Khem Raj wrote:
>
>> On Jan 3, 2015, at 3:13 PM, Robert Yang <liezhi.yang@windriver.com> wrote:
>>
>>
>> -SRC_URI = "http://ncu.dl.sourceforge.net/project/${BPN}/${BPN}/${PV}/${BP}.tar.gz \
>> +SRC_URI = "http://sourceforge.net/projects/${BPN}/files/${BPN}/${PV}/${BP}.tar.gz \
>
> while at it, can we use SOURCEFORGE_MIRROR as well ?

Yes:-), V2 is coming.

// Robert

>

