Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id ADF8160721
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2016 19:58:47 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 22 Mar 2016 12:58:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,378,1455004800"; d="scan'208";a="916675633"
Received: from szexingn-mobl4.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.129.75])
	by orsmga001.jf.intel.com with ESMTP; 22 Mar 2016 12:58:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: alexander.kanavin@linux.intel.com
Date: Wed, 23 Mar 2016 08:58:41 +1300
Message-ID: <9925097.fQpz7FIRvQ@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.5-300.fc23.x86_64; KDE/4.14.18; x86_64; ;
	)
In-Reply-To: <64951.10.252.26.251.1458663925.squirrel@linux.intel.com>
References: <1458568492-29611-1-git-send-email-alexander.kanavin@linux.intel.com>
	<1817823.GWXx3ahntL@peggleto-mobl.ger.corp.intel.com>
	<64951.10.252.26.251.1458663925.squirrel@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] gnome-bluetooth: replace systemd dependency with udev
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Mar 2016 19:58:48 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tue, 22 Mar 2016 18:25:25 alexander.kanavin@linux.intel.com wrote:
> >> > So you can remove distro_features_check inherit as well, right?
> >> 
> >> Yeah, I guess. Feel free to amend.
> > 
> > The reviewer is asking you to do that, although perhaps not in so many
> > words.
> > Can you, please?
> 
> I don't believe I should, if the review consists of a single trivial
> nitpick from the person who also does the actual commits to master. It's
> less friction and noise for both of us this way.

On the other hand, giving more work to our maintainers is not a good strategy 
if you want them to stay around.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

