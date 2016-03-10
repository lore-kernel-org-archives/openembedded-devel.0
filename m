Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id A80F373175
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 14:07:41 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 9424C68A019; Thu, 10 Mar 2016 14:07:41 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_40,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 34FF268A019;
	Thu, 10 Mar 2016 14:07:41 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id E4F6A6740554;
	Thu, 10 Mar 2016 15:07:40 +0100 (CET)
To: openembedded-devel@lists.openembedded.org
References: <56E17EC4.3050901@mlbassoc.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <56E17FAC.6000005@mlbassoc.com>
Date: Thu, 10 Mar 2016 15:07:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <56E17EC4.3050901@mlbassoc.com>
Subject: Re: [meta-webserver] where is mysql5
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
X-List-Received-Date: Thu, 10 Mar 2016 14:07:41 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-03-10 15:03, Gary Thomas wrote:
> This is a dependency for meta-webserver/cherokee
>
> Where can I find it?  Is this recipe broken?
>

Found it - replaced by mariadb

Sorry for the noise

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

