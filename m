Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E955F6B06C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Mar 2019 09:28:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2C9R9Kk023593
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Mar 2019 02:27:40 -0700
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Tue, 12 Mar 2019 02:27:23 -0700
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
References: <20190312083415.87524-1-mingli.yu@windriver.com>
	<20190312083415.87524-2-mingli.yu@windriver.com>
	<C0207330DF60C5409302EC78C3FE68F30230FEA0@PGSMSX105.gar.corp.intel.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5C877CFA.2070704@windriver.com>
Date: Tue, 12 Mar 2019 17:33:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <C0207330DF60C5409302EC78C3FE68F30230FEA0@PGSMSX105.gar.corp.intel.com>
X-Originating-IP: [128.224.162.194]
Subject: Re: [meta-oe][PATCH 2/3] librelp: Upgrade to 1.4.0
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
X-List-Received-Date: Tue, 12 Mar 2019 09:28:22 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2019年03月12日 17:10, Mittal, Anuj wrote:
>>   .../rsyslog/{librelp_1.2.18.bb => librelp_1.4.0.bb}               | 0
>>   1 file changed, 0 insertions(+), 0 deletions(-)  rename meta-oe/recipes-
>> extended/rsyslog/{librelp_1.2.18.bb => librelp_1.4.0.bb} (100%)
>>
>> diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.2.18.bb b/meta-oe/recipes-
>> extended/rsyslog/librelp_1.4.0.bb
>> similarity index 100%
>> rename from meta-oe/recipes-extended/rsyslog/librelp_1.2.18.bb
>> rename to meta-oe/recipes-extended/rsyslog/librelp_1.4.0.bb
>
> You forgot to bump SRCREV to point to this revision.

Sorry, the change exists locally in my env, will send V2 to fix it.

>

