Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 74F5A6012C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Apr 2016 01:18:43 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 591A568A01C; Sat, 23 Apr 2016 02:18:42 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_40,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 0C9B568A019;
	Sat, 23 Apr 2016 02:18:42 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id BBA0E67400E4;
	Sat, 23 Apr 2016 03:18:41 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <20160418183719.GA7939@vctlabs.com>
	<20160422172327.GA32568@linux-yxv0>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <571ACD71.4040100@mlbassoc.com>
Date: Sat, 23 Apr 2016 03:18:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <20160422172327.GA32568@linux-yxv0>
Subject: Re: [meta-browsser] chromium issues
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
X-List-Received-Date: Sat, 23 Apr 2016 01:18:43 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-04-22 19:23, Trevor Woerner wrote:
> On Mon 2016-04-18 @ 11:37:19 AM, S. Lockwood-Childs wrote:
>> If you just plan on using chromium as a normal browser without such
>> bells and whistles, don't worry about the keys and get rid of the
>> warning by setting them as blank when you start up chromium
>>
>> export GOOGLE_API_KEY=" "
>> export GOOGLE_DEFAULT_CLIENT_ID=" "
>> export GOOGLE_DEFAULT_CLIENT_SECRET=" "
>
> Yes, that works. Or you could use the 'disable-api-keys-info-bar'
> packageconfig option too.
>

Thanks, that's good to know.

Any ideas on what to do about the SSL error (all https:// pages fail)?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

