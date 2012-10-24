Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TR2CD-0007VL-4a
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Oct 2012 16:44:37 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Oct 2012 07:31:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,640,1344236400"; d="scan'208";a="239527683"
Received: from unknown (HELO helios.localnet) ([10.252.122.99])
	by fmsmga002.fm.intel.com with ESMTP; 24 Oct 2012 07:31:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 24 Oct 2012 15:31:06 +0100
Message-ID: <3716696.8ojUuDkOjS@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <k68sae$b49$1@ger.gmane.org>
References: <1350659734-10362-1-git-send-email-ferlandm@sonatest.com>
	<2623289.W1gREzD5R9@helios> <k68sae$b49$1@ger.gmane.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] lmsensors: Initial commit (cover letter)
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
X-List-Received-Date: Wed, 24 Oct 2012 14:44:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 24 October 2012 16:00:49 Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Op 24-10-12 14:35, Paul Eggleton schreef:
> > On Wednesday 24 October 2012 08:32:18 Marc Ferland wrote:
> >> Marc Ferland <ferlandm@sonatest.com> writes:
> >>> Third version of the patch for lmsensors based on comments from
> >>> Koen.
> >>> 
> >>> Marc Ferland (1): lmsensors: Initial commit.
> >>> 
> >>> .../recipes-support/lm_sensors/files/fancontrol    |    2 +
> >>> .../recipes-support/lm_sensors/files/fancontrol.sh |   48 +++++++
> >>> .../recipes-support/lm_sensors/files/sensord.cgi   |   10 ++
> >>> .../recipes-support/lm_sensors/files/sensord.conf  |   16 +++
> >>> .../recipes-support/lm_sensors/files/sensord.sh    |   49 +++++++
> >>> .../recipes-support/lm_sensors/files/sensors.conf  |    2 +
> >>> .../recipes-support/lm_sensors/lmsensors_3.3.2.bb  |  140
> >>> ++++++++++++++++++++ 7 files changed, 267 insertions(+), 0
> >>> deletions(-) create mode 100644
> >>> meta-oe/recipes-support/lm_sensors/files/fancontrol create mode
> >>> 100644 meta-oe/recipes-support/lm_sensors/files/fancontrol.sh create
> >>> mode 100644 meta-oe/recipes-support/lm_sensors/files/sensord.cgi
> >>> create mode 100644
> >>> meta-oe/recipes-support/lm_sensors/files/sensord.conf create mode
> >>> 100644 meta-oe/recipes-support/lm_sensors/files/sensord.sh create
> >>> mode 100644 meta-oe/recipes-support/lm_sensors/files/sensors.conf
> >>> create mode 100644
> >>> meta-oe/recipes-support/lm_sensors/lmsensors_3.3.2.bb
> > 
> > Coincidentally this just got merged this morning.
> 
> I looked at all patches at
> http://patches.openembedded.org/project/oe/list/?q=meta-oe this morning and
> only 3 categories are left:
> 
> 1) meta-networking patches
> 2) patches with unaddressed feedback
> 3) denzil backports
> 
> If you have a patch that isn't in yet *and* isn't showing in that list
> please resend it with a CC: koen@dominion.thruhere.net

Since the following two are in patchwork already can you please pick them up 
from there?

http://patchwork.openembedded.org/patch/35531/
http://patchwork.openembedded.org/patch/34997/

Yes, I know, no prefix and all, but they've been sitting for a while now.

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


