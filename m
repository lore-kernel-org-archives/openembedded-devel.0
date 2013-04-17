Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1USOMh-0007JP-Qt
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Apr 2013 11:09:20 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 17 Apr 2013 01:51:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,492,1363158000"; d="scan'208";a="228181026"
Received: from unknown (HELO helios.localnet) ([10.255.14.28])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Apr 2013 01:51:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Wed, 17 Apr 2013 09:51:45 +0100
Message-ID: <10677100.l6Guga4Du7@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-27-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <1366139500-880-1-git-send-email-Martin.Jansa@gmail.com>
References: <1366139500-880-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH 1/2] xserver-nodm-init: install .service and conf only with systemd in DISTRO_FEATURES
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Apr 2013 09:09:30 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 16 April 2013 21:11:39 Martin Jansa wrote:
> * Otavio reported unpackaged files without systemd enabled

We have this problem in a lot of recipes. I've filed this bug to fix it in 
systemd.bbclass itself:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=4309

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


