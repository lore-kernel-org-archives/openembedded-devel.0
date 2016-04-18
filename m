Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id BD3C6607A4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2016 10:00:00 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 5584468A01A; Mon, 18 Apr 2016 11:00:01 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_40,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id EC17468A019;
	Mon, 18 Apr 2016 11:00:00 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id A7CBB6740103;
	Mon, 18 Apr 2016 12:00:00 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <5714AF66.9050000@mlbassoc.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <5714B020.4050508@mlbassoc.com>
Date: Mon, 18 Apr 2016 12:00:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <5714AF66.9050000@mlbassoc.com>
Subject: Re: x11nvc: useless rpath?
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
X-List-Received-Date: Mon, 18 Apr 2016 10:00:01 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-04-18 11:56, Gary Thomas wrote:
> I'm getting this error (used to be a warning only):
>    ERROR: x11vnc-0.9.13-r0 do_package_qa: QA Issue: x11vnc:
> work/cortexa8hf-neon-poky-linux-gnueabi/x11vnc/0.9.13-r0/packages-split/x11vnc/usr/bin/x11vnc contains
> probably-redundant RPATH /usr/lib [useless-rpaths]
>
> How does one go about fixing it?
>

Note: this is an error in the latest Poky master (meta-poky)
but a warning only in OE-core

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

