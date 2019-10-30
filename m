Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 749207FA4C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 00:05:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x9U0532d021202
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 Oct 2019 17:05:03 -0700 (PDT)
Received: from [128.224.22.69] (128.224.22.69) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 29 Oct 2019 17:05:02 -0700
To: Ross Burton <ross.burton@intel.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20191029211554.17609-1-trevor.gamblin@windriver.com>
	<c9b5681b-f125-0c01-928f-7224269deeab@intel.com>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <825724d2-7856-c6e0-3594-8d6ff46893e4@windriver.com>
Date: Tue, 29 Oct 2019 20:05:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c9b5681b-f125-0c01-928f-7224269deeab@intel.com>
Subject: Re: [meta-oe] inotify-tools: remove recipe (migrate to oe-core)
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
X-List-Received-Date: Wed, 30 Oct 2019 00:05:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 10/29/19 7:55 PM, Ross Burton wrote:
> On 29/10/2019 21:15, Trevor Gamblin wrote:
>> Remove inotify-tools recipe. Remove reference to recipe in
>> packagegroup-meta-oe.bb.
>
> There's a good chance that the recipe won't be added to oe-core so 
> please verify the removal there before merging this to meta-oe!
>
> Ross
>
Right, hold off on this for now. Was hoping to migrate it to support a 
new ptest being added to oe-core, but I will review my strategy first...

