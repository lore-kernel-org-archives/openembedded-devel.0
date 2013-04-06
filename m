Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UOZ3a-0000Ss-6N
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Apr 2013 21:45:48 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 Apr 2013 12:28:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,421,1363158000"; d="scan'208";a="314769528"
Received: from unknown (HELO helios.localnet) ([10.255.14.16])
	by fmsmga001.fm.intel.com with ESMTP; 06 Apr 2013 12:28:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Sat, 06 Apr 2013 20:28:26 +0100
Message-ID: <7895477.XWUCIH5euc@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.1 (Linux/3.5.0-26-generic; KDE/4.10.1; i686; ; )
In-Reply-To: <CAP9ODKpt1GX0pbHx-=HKsJ9-BkZfhxQiAcJVdBkc4iGhu-bg+g@mail.gmail.com>
References: <cover.1365204818.git.paul.eggleton@linux.intel.com>
	<9e4a915b5a1e871ee28c3b723475d143162a8286.1365204818.git.paul.eggleton@linux.intel.com>
	<CAP9ODKpt1GX0pbHx-=HKsJ9-BkZfhxQiAcJVdBkc4iGhu-bg+g@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 4/4] qt4: remove bbappends
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
X-List-Received-Date: Sat, 06 Apr 2013 19:45:58 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 06 April 2013 10:36:41 Otavio Salvador wrote:
> On Fri, Apr 5, 2013 at 8:35 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > These changes to Qt's configuration need to be applied in distro layers,
> > not in meta-oe.
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> 
> NACK!
> 
> Keep PRINC as otherwise revision will go backwards.

Sigh... Oh well I guess Qt 4.8.5 is just around the corner and then we can 
drop this bbappend. When can we drop the packagegroup one though?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


