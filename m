Return-Path: <prvs=826889cc9=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 9BBA6744F2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Oct 2018 13:14:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.54,412,1534802400"; 
   d="scan'208";a="1743681"
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>, Andreas Obergschwandtner
	<andreas.obergschwandtner@skidata.com>
References: <20180925085538.24188-1-andreas.obergschwandtner@skidata.com>
	<706876eeb67589b7a04d0243b91156ac480c6434.camel@andred.net>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <515ae35f-d56a-571e-44b4-bcd3cb0133c4@skidata.com>
Date: Mon, 22 Oct 2018 15:14:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <706876eeb67589b7a04d0243b91156ac480c6434.camel@andred.net>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][PATCH] openjdk-8-native: hotspot: handle format-overflow error for gcc >= 7
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
X-List-Received-Date: Mon, 22 Oct 2018 13:14:51 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: de-AT
Content-Transfer-Encoding: 8bit

Hi André,

On 10/18/18 3:47 PM, André Draszik wrote:
> Hi (Richard),
> 
> 
> On Tue, 2018-09-25 at 10:55 +0200, Andreas Obergschwandtner wrote:
>> fixed the format-overflow warnings by patch affected files in
>> openjdk-8-hotspot
>>
>> Signed-off-by: Andreas Obergschwandtner <
>> andreas.obergschwandtner@skidata.com>
>> ---
>>   .../hotspot-handle-gcc7-format-overflow.patch | 25 +++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>   create mode 100644 recipes-core/openjdk/patches-openjdk-8/hotspot-handle-
>> gcc7-format-overflow.patch
> 
> This patch seems to have been staged to master-next, but the patch is not
> actually being used / referenced by the recipe.

Thanks for that catch!
I also faced this problem now during the test build.

Therefore: Anreas, may you please send a v2? Thanks!

Until then I'll remove it from master-next.

regards;Richard.L

