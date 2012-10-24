Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TR0O3-0005ha-EW
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Oct 2012 14:48:43 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Oct 2012 05:35:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,639,1344236400"; d="scan'208";a="159797972"
Received: from unknown (HELO helios.localnet) ([10.252.122.99])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Oct 2012 05:35:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Marc Ferland <ferlandm@sonatest.com>
Date: Wed, 24 Oct 2012 13:35:10 +0100
Message-ID: <2623289.W1gREzD5R9@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <878vawvynh.fsf@sonatest.com>
References: <1350659734-10362-1-git-send-email-ferlandm@sonatest.com>
	<878vawvynh.fsf@sonatest.com>
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
X-List-Received-Date: Wed, 24 Oct 2012 12:48:43 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 24 October 2012 08:32:18 Marc Ferland wrote:
> Marc Ferland <ferlandm@sonatest.com> writes:
> > Third version of the patch for lmsensors based on comments from Koen.
> > 
> > Marc Ferland (1):
> >   lmsensors: Initial commit.
> >  
> >  .../recipes-support/lm_sensors/files/fancontrol    |    2 +
> >  .../recipes-support/lm_sensors/files/fancontrol.sh |   48 +++++++
> >  .../recipes-support/lm_sensors/files/sensord.cgi   |   10 ++
> >  .../recipes-support/lm_sensors/files/sensord.conf  |   16 +++
> >  .../recipes-support/lm_sensors/files/sensord.sh    |   49 +++++++
> >  .../recipes-support/lm_sensors/files/sensors.conf  |    2 +
> >  .../recipes-support/lm_sensors/lmsensors_3.3.2.bb  |  140
> >  ++++++++++++++++++++ 7 files changed, 267 insertions(+), 0 deletions(-)
> >  create mode 100644 meta-oe/recipes-support/lm_sensors/files/fancontrol
> >  create mode 100644 meta-oe/recipes-support/lm_sensors/files/fancontrol.sh
> >  create mode 100644 meta-oe/recipes-support/lm_sensors/files/sensord.cgi
> >  create mode 100644 meta-oe/recipes-support/lm_sensors/files/sensord.conf
> >  create mode 100644 meta-oe/recipes-support/lm_sensors/files/sensord.sh
> >  create mode 100644 meta-oe/recipes-support/lm_sensors/files/sensors.conf
> >  create mode 100644 meta-oe/recipes-support/lm_sensors/lmsensors_3.3.2.bb

Coincidentally this just got merged this morning.

Thanks for submitting this!

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


