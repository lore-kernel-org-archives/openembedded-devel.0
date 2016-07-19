Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CF589607A5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jul 2016 01:59:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6J1xEMx009400
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 18:59:15 -0700
Received: from [128.224.163.140] (128.224.163.140) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Mon, 18 Jul 2016 18:59:14 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1468561844-10190-1-git-send-email-mingli.yu@windriver.com>
	<CA+chaQf6a6n-89735f5tuiFYdocWy30AycpDKth72bUG6Wun2A@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <578D88EF.7080604@windriver.com>
Date: Tue, 19 Jul 2016 09:57:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQf6a6n-89735f5tuiFYdocWy30AycpDKth72bUG6Wun2A@mail.gmail.com>
X-Originating-IP: [128.224.163.140]
Subject: Re: [meta-oe][PATCH] grubby: add grubby with version 8.40-1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jul 2016 01:59:15 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2016年07月15日 20:37, Martin Jansa wrote:
> FFS, squash all 4 together, the first is already using all 3 files anyway..
Thanks! Already send v2 version to squash all 4 together.

Thanks,
Grace
>
> On Fri, Jul 15, 2016 at 7:50 AM, <mingli.yu@windriver.com> wrote:
>
>> 1, Add grubby bb
>>
>> 2, Fix the grub-editenv name
>>
>> 3, Add ptest support
>>
>> 4, Remove bashisms in test.sh
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>

