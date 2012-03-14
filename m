Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S7ovE-00078N-9G
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Mar 2012 15:11:24 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 14 Mar 2012 07:02:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128897134"
Received: from unknown (HELO helios.localnet) ([10.252.123.190])
	by fmsmga001.fm.intel.com with ESMTP; 14 Mar 2012 07:02:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andreas Oberritter <obi@opendreambox.org>
Date: Wed, 14 Mar 2012 14:02:33 +0000
Message-ID: <1451828.nMSFA2UD84@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <4F60A1A6.4090204@opendreambox.org>
References: <20120313114820.9572210335@opal>
	<20120314084016.GD3919@jama.jama.net>
	<4F60A1A6.4090204@opendreambox.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Andreas Oberritter : qt4: fix deps in libQtWebkit.la and QtWebKit.pc
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
X-List-Received-Date: Wed, 14 Mar 2012 14:11:24 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 14 March 2012 14:48:22 Andreas Oberritter wrote:
> I thought that Qt 4.8 didn't use WebKit2 by default. Did you enable it
> manually?

FYI our Qt 4.8 recipes enable QtWebkit by default.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


