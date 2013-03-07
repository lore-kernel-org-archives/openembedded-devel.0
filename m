Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UDarV-000459-S1
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Mar 2013 14:27:58 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 07 Mar 2013 05:11:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,802,1355126400"; d="scan'208";a="300892632"
Received: from unknown (HELO helios.localnet) ([10.255.12.181])
	by fmsmga002.fm.intel.com with ESMTP; 07 Mar 2013 05:10:55 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Samuel Stirtzel <s.stirtzel@googlemail.com>
Date: Thu, 07 Mar 2013 13:10:54 +0000
Message-ID: <1623937.LnU3QZzoXA@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10 (Linux/3.5.0-24-generic; KDE/4.10.0; i686; ; )
In-Reply-To: <CAGiJk9fvW_5jNScu23YvC81i-R481ykNMRaj8aHM92etym8m1g@mail.gmail.com>
References: <1362649839-9160-1-git-send-email-koen@dominion.thruhere.net>
	<1362649839-9160-3-git-send-email-koen@dominion.thruhere.net>
	<CAGiJk9fvW_5jNScu23YvC81i-R481ykNMRaj8aHM92etym8m1g@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-kde][PATCH 3/3] README: update contributor list
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
X-List-Received-Date: Thu, 07 Mar 2013 13:27:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 07 March 2013 13:09:38 Samuel Stirtzel wrote:
> Unrelated to your patches:
> There are some upcoming changes, but they don't fit into yocto 1.4
> (assumed that yocto is the orientation point for third-party OE-layer
> releases).
> So there will be a yocto-1.4 branch in advance and the development
> will continue on master.

FYI, the layer index web interface I'm putting together [1] will understand 
certain branch names across all layers, and the convention so far has been to 
use the release names i.e. denzil, danny, etc. If you are able to follow this 
as well once the 1.4 codename has been announced then your branch will show up 
correctly in the new interface.

Cheers,
Paul

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3272

-- 

Paul Eggleton
Intel Open Source Technology Centre


