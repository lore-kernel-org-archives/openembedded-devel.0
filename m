Return-Path: <prvs=756920f33=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 385507453A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 20:53:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.53,235,1531778400"; 
   d="scan'208";a="1605491"
To: Henning Heinold <henning@itconsulting-heinold.de>
References: <20180813152021.29931-1-richard.leitner@skidata.com>
	<20180813155313.GA10693@mail.itconsulting-heinold.de>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <2eaabc2c-efce-0c56-cb13-7ec07f8daf16@skidata.com>
Date: Mon, 13 Aug 2018 22:53:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180813155313.GA10693@mail.itconsulting-heinold.de>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][PATCH] openjdk-7: clarify a bitbake warning
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
X-List-Received-Date: Mon, 13 Aug 2018 20:53:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit


On 08/13/2018 05:53 PM, Henning Heinold wrote:
> On Mon, Aug 13, 2018 at 05:20:21PM +0200, Richard Leitner wrote:
>> We get a bitbake warning during recipe building complaining about
>> unsupported architectures unconditionally. That check is relevant
>> only for shark builds, so it is quite confusing for non-shark
>> builds.
>>
>> Make the warning conditional on whether shark builds are enabled
>> or not.
>>
>> This is the same patch as the one for openjdk-8 by André Draszik
>> (commit 86c729cb51f880fd5a1ec6485baddfa2bedaa998)
>>
>> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
>> ---
...
>> -- 
>> 2.11.0
> 
> Looks good to me.

Thanks!

fyi: I "converted" this to an Acked-by for the patch.

> 
> Bye Henning
> 

regards;Richard.L

