Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SUGxp-0003gy-8v
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2012 14:34:53 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 May 2012 05:24:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="140835655"
Received: from unknown (HELO helios.localnet) ([10.252.120.119])
	by orsmga001.jf.intel.com with ESMTP; 15 May 2012 05:24:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Tasslehoff Kjappfot <tasskjapp@gmail.com>
Date: Tue, 15 May 2012 13:24:19 +0100
Message-ID: <53487189.7itrN9qUEW@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.0.0-19-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <4FB23F7C.1060302@gmail.com>
References: <4FB0F450.7050404@gmail.com>
	<CAMKF1spY7bTJYzxHhmrvpGurZTDgciQOC0vFPT5HnvbOEFOdeQ@mail.gmail.com>
	<4FB23F7C.1060302@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: License attributions for a system built with OpenEmbedded.
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
X-List-Received-Date: Tue, 15 May 2012 12:34:53 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 15 May 2012 13:35:24 Tasslehoff Kjappfot wrote:
> I've already written that I use OpenEmbedded as a build system, and
> included the MIT license. I also used create_manifest.sh from Arago to
> get a list of everything included in the rootfs. What I really wonder is
> if I must add all that information as well.

[Disclaimer: I'm not a lawyer, this is not legal advice, etc.]

Ultimately you have to comply with the terms set out in the licenses of the 
code you're distributing. For example, if those licenses require you to 
provide the source code (or a written offer for same) regardless of whether you 
have changed the source or not, then that's what you have to do for the 
software you distribute under that license.

At the very least you should check all of the licenses to make sure you 
understand your obligations.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


