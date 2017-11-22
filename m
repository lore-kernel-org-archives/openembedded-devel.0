Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 136117859F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Nov 2017 08:58:01 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Nov 2017 00:58:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,436,1505804400"; 
   d="scan'208";a="8189203"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 22 Nov 2017 00:58:01 -0800
To: Hongxu Jia <hongxu.jia@windriver.com>, akuster808 <akuster808@gmail.com>, 
	Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>
References: <bfbfad0b-af40-5448-4aed-fc70eeb95c6c@windriver.com>
	<7bdd24ea-febf-86b4-e770-6f7533205d73@windriver.com>
	<37b787d0-ef5a-d821-0c09-a8547c58c52d@gmail.com>
	<e9e12bfb-1b89-d9f1-619e-1896e83837cb@windriver.com>
	<23178b55-e416-a67f-f90f-041f2ab21080@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <fef8df4e-613a-2baa-398c-f137ce4f8dd1@linux.intel.com>
Date: Wed, 22 Nov 2017 10:58:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <23178b55-e416-a67f-f90f-041f2ab21080@windriver.com>
Cc: +lpd-cdc-core-dev <lpd-cdc-core-dev@windriver.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [yocto] Contribute meta-installer to yocto
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
X-List-Received-Date: Wed, 22 Nov 2017 08:58:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/22/2017 04:26 AM, Hongxu Jia wrote:
>> If it is OK, I will send pull request to OE for review, and
>> my opinion is to suggest to create meta-installer sub layer in OE.
>>
> 
> To clarify, I mean to create sub dir meta-installer in
> git://git.openembedded.org/meta-openembedded

Should the directory be called meta-anaconda then? There are many 
available installers, and this would make it clear what the directory 
contains, I think.


Alex

