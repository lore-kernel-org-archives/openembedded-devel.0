Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id AB30A705A2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jul 2014 11:15:31 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 28 Jul 2014 04:15:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,748,1400050800"; d="scan'208";a="462234110"
Received: from cfitzsim-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.251])
	by azsmga001.ch.intel.com with ESMTP; 28 Jul 2014 04:15:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Jul 2014 12:15:28 +0100
Message-ID: <6864976.v82FsQLqkm@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.6-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <1406237257-13724-1-git-send-email-andrea.adami@gmail.com>
References: <1406237257-13724-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-initramfs][PATCH] linux-yocto-tiny-kexecboot: do not exec do_package_qa task
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
X-List-Received-Date: Mon, 28 Jul 2014 11:15:33 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 24 July 2014 23:27:36 Andrea Adami wrote:
> The task was added with commit d31f75a72cb2322f753d945da86d5f3287eef06b
> "insane: Split do_package_qa into a separate task (from do_package)"
> and we avoid it because the recipe does not create packages.
> 
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>

Merged these two, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

