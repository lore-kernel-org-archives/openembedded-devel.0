Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D4A7B6FF76
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2016 20:43:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 21 Mar 2016 13:43:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,373,1455004800"; d="scan'208";a="938638205"
Received: from ngocthuy-mobl.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.169.222])
	by orsmga002.jf.intel.com with ESMTP; 21 Mar 2016 13:43:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Tue, 22 Mar 2016 09:43 +1300
Message-ID: <1817823.GWXx3ahntL@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.5-300.fc23.x86_64; KDE/4.14.18; x86_64; ;
	)
In-Reply-To: <56F008EE.4060600@linux.intel.com>
References: <1458568492-29611-1-git-send-email-alexander.kanavin@linux.intel.com>
	<20160321145053.GD2562@jama> <56F008EE.4060600@linux.intel.com>
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
X-List-Received-Date: Mon, 21 Mar 2016 20:43:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Mon, 21 Mar 2016 16:45:02 Alexander Kanavin wrote:
> On 03/21/2016 04:50 PM, Martin Jansa wrote:
> >>   inherit gnomebase gtk-icon-cache distro_features_check
> >>   gobject-introspection> 
> >
> > So you can remove distro_features_check inherit as well, right?
> 
> Yeah, I guess. Feel free to amend.

The reviewer is asking you to do that, although perhaps not in so many words. 
Can you, please?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

