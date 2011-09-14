Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R3zIz-0006AY-5V
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Sep 2011 01:55:50 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Sep 2011 16:50:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="48533067"
Received: from unknown (HELO helios.localnet) ([10.252.120.105])
	by orsmga002.jf.intel.com with ESMTP; 14 Sep 2011 16:50:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 15 Sep 2011 00:50:33 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <1315307566-15579-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1315307566-15579-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Message-Id: <201109150050.33494.paul.eggleton@linux.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH] linux-kexecboot: move defconfigs to linux-kexecboot-2.6.39
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
X-List-Received-Date: Wed, 14 Sep 2011 23:55:50 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 06 September 2011 12:12:46 Martin Jansa wrote:
> * to make room in linux-kexecboot directory for 3.1.0-rc5 defconfigs I've
> prepared 3.1.0-rc5 recipes are here:
>   https://gitorious.org/shr/meta-handheld/commits/jansa/spitz
>   will send them to after testing and when git.kernel.org is back online

I'm not taking this, for several reasons:

1)  I'm willing to be reasonably relaxed about commit messages for meta-
handheld, but they should at least explain why the change is being made and 
not contain extraneous information (e.g. the last part of your message above - 
this ought to be in a cover letter or a reply if it's easier for you.)

2) Please use the -M option to detect moves, so that renames with no changes 
are obvious.

3) This patch alone doesn't appear to do anything valuable; however, in a 
series with your forthcoming patch it will, so I'll be more than happy to 
apply it then assuming the previous items are tidied up.

(Sorry it took so long to get back to you with this.)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


