Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QYH53-0006oY-Ik
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Jun 2011 14:26:21 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jun 2011 05:21:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,388,1304319600"; d="scan'208";a="16822961"
Received: from unknown (HELO helios.localnet) ([10.255.16.219])
	by orsmga001.jf.intel.com with ESMTP; 19 Jun 2011 05:21:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Jun 2011 13:21:41 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1308417391.git.paul.eggleton@linux.intel.com>
	<6b59e5c689dd1963371df90cc749d2f7c5b969da.1308417391.git.paul.eggleton@linux.intel.com>
	<itkdlh$801$1@dough.gmane.org>
In-Reply-To: <itkdlh$801$1@dough.gmane.org>
MIME-Version: 1.0
Message-Id: <201106191321.41883.paul.eggleton@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe] [PATCH 2/3] qmake2: remove qmake2 recipe
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
X-List-Received-Date: Sun, 19 Jun 2011 12:26:21 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Sunday 19 June 2011 09:57:21 Koen Kooi wrote:
> On 18-06-11 20:57, Paul Eggleton wrote:
> > This is a leftover from oe-dev and is not needed by anything in meta-oe -
> > qmake is being build as part of qt4-tools-native.
> 
> I'm going to drop this patch, since we still need it for the target
> qmake binary.

Hmm, I'd kind of missed that as a possibility, and qmake's not being provided 
by qt4-{embedded|x11-free}-tools either. There's got to be a better solution 
to this, but for now as you say qmake2 is it.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


