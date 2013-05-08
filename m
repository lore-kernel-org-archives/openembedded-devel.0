Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Ua7tE-0007pi-Sw
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 May 2013 19:10:54 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 May 2013 09:52:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,635,1363158000"; d="scan'208";a="334487807"
Received: from unknown (HELO helios.localnet) ([10.255.13.1])
	by fmsmga002.fm.intel.com with ESMTP; 08 May 2013 09:52:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Ilya Dmitrichenko <errordeveloper@gmail.com>
Date: Wed, 08 May 2013 17:52:47 +0100
Message-ID: <11898626.yAYW9lBy8S@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-19-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <CAPhDKbF+OpDsc5QorgeeZV9sTCjBpHCaOZUP7_N2JJOQus0Zvw@mail.gmail.com>
References: <CAPhDKbFrn7ZgfXT05so7YhBus7PP45W1YafYduCg_TZwzskW+g@mail.gmail.com>
	<CAPhDKbF+OpDsc5QorgeeZV9sTCjBpHCaOZUP7_N2JJOQus0Zvw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] python-requests: add version 1.2.0
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
X-List-Received-Date: Wed, 08 May 2013 17:10:55 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 08 May 2013 12:10:24 Ilya Dmitrichenko wrote:
> Any comments on this?
> 
> Is something wrong with the way this message was formated? Should I inline
> the actual patch??
> 
> Well, I quite confused with where and how to submit patches.

The preferred method is to use "git send-email" as described here:

http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

This includes the patch in-line and ensures it doesn't get mangled by an email 
client.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


