Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TAjkH-0007i3-1p
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Sep 2012 17:48:26 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 09 Sep 2012 08:35:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,394,1344236400"; d="scan'208";a="200210365"
Received: from unknown (HELO helios.localnet) ([10.252.121.165])
	by orsmga002.jf.intel.com with ESMTP; 09 Sep 2012 08:35:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Sun, 09 Sep 2012 16:35:53 +0100
Message-ID: <1468786.iJbNk0O7Nh@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-30-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <1347204678-22970-1-git-send-email-raj.khem@gmail.com>
References: <1347204678-22970-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-opie][PATCH] recipes: inherit packagegroup instead of obsoleted task bbclass
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
X-List-Received-Date: Sun, 09 Sep 2012 15:48:26 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 09 September 2012 08:31:18 Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-opie/tasks/task-opie-16mb.bb   |    2 +-
>  recipes-opie/tasks/task-opie-all.bb    |    2 +-
>  recipes-opie/tasks/task-opie-apps.bb   |    2 +-
>  recipes-opie/tasks/task-opie-games.bb  |    2 +-
>  recipes-opie/tasks/task-opie.bb        |    2 +-
>  recipes-opie/tasks/task-xqtlauncher.bb |    2 +-
>  recipes-qtopia/tasks/task-qpe.bb       |    2 +-
>  7 files changed, 7 insertions(+), 7 deletions(-)

Coincidentally I just pushed my patch series which obsoletes this one. Thanks 
for prompting me to do this earlier though.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


