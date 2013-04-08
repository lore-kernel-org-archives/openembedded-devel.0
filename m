Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UPLVD-0002p6-SX
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Apr 2013 01:29:33 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Apr 2013 16:10:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,434,1363158000"; d="scan'208";a="292008411"
Received: from unknown (HELO helios.localnet) ([10.255.13.161])
	by orsmga001.jf.intel.com with ESMTP; 08 Apr 2013 16:12:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>,
	openembedded-devel@lists.openembedded.org
Date: Tue, 09 Apr 2013 00:12:10 +0100
Message-ID: <3085999.SluaBE5glT@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-26-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <51634B82.3070807@pseudoterminal.org>
References: <1365458017-3185-1-git-send-email-dv@pseudoterminal.org>
	<1644870.xWQQ3phVp5@helios> <51634B82.3070807@pseudoterminal.org>
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] add recipe for mpg123, a decoder for MPEG-1 layer 1, 2, and 3
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
X-List-Received-Date: Mon, 08 Apr 2013 23:29:42 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 09 April 2013 00:58:10 Carlos Rafael Giani wrote:
> On 2013-04-09 00:49, Paul Eggleton wrote:
> > Recipe looks good, however this should probably go into meta-multimedia.
> > We do still have some multimedia recipes in meta-oe but these ought to be
> > moved (when someone gets around to it).
>
> I was already wondering about this. So the long-term plan is to move
> multimedia stuff out of meta-oe, okay.
> Shall I re-send the patch in the meta-multimedia directory?

Yes please.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


