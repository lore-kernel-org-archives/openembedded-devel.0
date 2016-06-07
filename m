Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 7AE42765DB
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jun 2016 14:28:33 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 5911568A01C; Tue,  7 Jun 2016 15:28:34 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_40,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id B549C68A019;
	Tue,  7 Jun 2016 15:28:33 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 3B2AA674043F;
	Tue,  7 Jun 2016 16:28:33 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <09856974BCEE6F48AB378E52E4CAA73C230E93B3@chn-hclt-mbs08.HCLT.CORP.HCL.IN>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <5756DA11.6040509@mlbassoc.com>
Date: Tue, 7 Jun 2016 16:28:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <09856974BCEE6F48AB378E52E4CAA73C230E93B3@chn-hclt-mbs08.HCLT.CORP.HCL.IN>
Subject: Re: Reg: Yocto build error( gcc_4.8)
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
X-List-Received-Date: Tue, 07 Jun 2016 14:28:34 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-06-07 16:03, Praveenreddy Padamati wrote:
> Hi all,
>
> We are compiling the yocto build system with "bitbake core-image-sato" command. We are facing one problem. It is not compiling, it is showing "gcc_4.8.bb, > do_compile failed with exit code".
> Please do the needful.

You'll need to provide a LOT more info to be able to get help.
What version of Yocto (OE-core, Poky, etc), along with any
extra layers you are using.  Also GCC/4.8 has been gone for
quite some time so you must be using a very old branch/release.
We'll also need to know your build host, $DISTRO, $MACHINE, etc.
These are all printed when you run bitbake.

A detailed log (send it to postbin if it's very big) will also
help you get the aid you need.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

