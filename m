Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DD3CE6AC7B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Sep 2014 02:45:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s822j79r010629
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Sep 2014 19:45:07 -0700 (PDT)
Received: from [128.224.162.141] (128.224.162.141) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 1 Sep 2014 19:45:07 -0700
Message-ID: <54052F3C.6090006@windriver.com>
Date: Tue, 2 Sep 2014 10:45:16 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1406686961-21142-1-git-send-email-rongqing.li@windriver.com>
	<20140730072555.GF16445@jama>
In-Reply-To: <20140730072555.GF16445@jama>
Subject: Re: [PATCH v2][meta-networking] tcpslice: add recipe under tcpdump
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
X-List-Received-Date: Tue, 02 Sep 2014 02:45:14 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/30/2014 03:25 PM, Martin Jansa wrote:
> On Wed, Jul 30, 2014 at 10:22:41AM +0800,rongqing.li@windriver.com  wrote:
>> >From: Roy Li<rongqing.li@windriver.com>
>> >
>> >tcpslice is a tool for extracting parts of a tcpdump packet trace,
>> >so put it under tcpdump dir
>> >
>> >Signed-off-by: Roy Li<rongqing.li@windriver.com>
>> >---


Hi Martin:

I see this recipes has been merged into master-next for a long time,
Could you cherry-pick it to master?


-Roy


-- 
Best Reagrds,
Roy | RongQing Li

