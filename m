Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D469478706
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Nov 2017 12:32:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vANCWHvT015482
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 23 Nov 2017 04:32:17 -0800
Received: from [128.224.162.147] (128.224.162.147) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 23 Nov 2017 04:32:16 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1511437793.git.hongxu.jia@windriver.com>
	<CAJTo0La5+dpVjgmDnkqP3wX+M2L-1sk11-wxreL1+7xR1anYfg@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <8613c3e6-e95a-1a67-ebb3-2ac6761093a0@windriver.com>
Date: Thu, 23 Nov 2017 20:34:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0La5+dpVjgmDnkqP3wX+M2L-1sk11-wxreL1+7xR1anYfg@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 00/15] create meta-installer layer
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
X-List-Received-Date: Thu, 23 Nov 2017 12:32:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2017年11月23日 20:15, Burton, Ross wrote:
> I honestly don't see why this has to belong in meta-openembedded and 
> can't live in a standalone repository.
>

Yes, as a standalone repository is OK, but
previously I submitted all required recipes to OE,
with anacodna, it is complete as a whole.

It is convenience to maintain all of them in one place.

//Hongxu

> Ross
>


