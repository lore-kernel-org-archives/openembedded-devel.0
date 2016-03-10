Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 3976D6FFC7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 12:19:02 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 9591668A019; Thu, 10 Mar 2016 12:19:00 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_40,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id E7EA368A019;
	Thu, 10 Mar 2016 12:18:59 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id A0B5B6740554;
	Thu, 10 Mar 2016 13:18:59 +0100 (CET)
To: openembedded-devel@lists.openembedded.org
References: <56E14145.4040706@mlbassoc.com> <20160310105506.GB2573@jama>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <56E16633.4010800@mlbassoc.com>
Date: Thu, 10 Mar 2016 13:18:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20160310105506.GB2573@jama>
Subject: Re: [meta-webserver] modphp
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
X-List-Received-Date: Thu, 10 Mar 2016 12:19:03 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-03-10 11:55, Martin Jansa wrote:
> On Thu, Mar 10, 2016 at 10:41:25AM +0100, Gary Thomas wrote:
>> Anyone know what happened to the recipe for modphp which was
>> in meta-oe (maybe before meta-webserver) circa 2013?  I can't
>> find a recipe for this anywhere.
>
> Why not try git log?

Of course!  I don't often search logs for things I don't know where
to find though.

An aside - doesn't this change make meta-oe depend on meta-webserver
(which doesn't seem like a positive relationship)?

>
> commit f81961ff20d669e0f472f45b9922d6f62ee0d330
> Author: Paul Eggleton <paul.eggleton@linux.intel.com>
> Date:   Mon Jan 5 10:24:53 2015 +0000
>
>      README: update for modphp merging into php
>
>      Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>
> commit 06af52095b5be1cb21a7dc9a6a6e05d01f6e7a00
> Author: Paul Eggleton <paul.eggleton@linux.intel.com>
> Date:   Thu Jan 1 23:34:29 2015 +0000
>
>      modphp: remove
>
>      This is now built out of the standard php recipe.
>
>      Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

