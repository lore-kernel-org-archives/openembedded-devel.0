Return-Path: <raphael.kubo.da.costa@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EE86278478
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Nov 2017 12:04:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Nov 2017 04:04:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,399,1505804400"; 
   d="scan'208";a="2906506"
Received: from rkubodac-desk.ger.corp.intel.com ([10.252.1.231])
	by fmsmga001.fm.intel.com with ESMTP; 15 Nov 2017 04:04:03 -0800
From: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
To: <openembedded-devel@lists.openembedded.org>
In-Reply-To: <877euzbem2.fsf@rkubodac-desk.ger.corp.intel.com> (Raphael Kubo
	da Costa's message of "Thu, 9 Nov 2017 17:28:53 +0100")
Organization: Intel International BV - KvK 34098535 - Capronilaan 37 1119NG
	Amsterdam
References: <877euzbem2.fsf@rkubodac-desk.ger.corp.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
Date: Wed, 15 Nov 2017 13:04:03 +0100
Message-ID: <87h8tv21fw.fsf@rkubodac-desk.ger.corp.intel.com>
MIME-Version: 1.0
Subject: Re: [meta-browser] CFT: Chromium 62 in meta-browser
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
X-List-Received-Date: Wed, 15 Nov 2017 12:04:03 -0000
Content-Type: text/plain

Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com> writes:
> I believe this has finally reached a stage where it's ready for public
> consumption, hence the CFT:
>
>     https://github.com/rakuco/meta-browser/tree/chromium62
>
> I'd like people to look at my commits and let me know if there's any big
> issue that would prevent those changes from landing into meta-browser.
> If everything's OK, I'd then start sending the patches to the list (or
> pull requests on GitHub, whichever is preferred).

Thanks to everyone who chimed in on GitHub and Otavio for merging my
pull requests.

We now have Chromium 62 in meta-browser, and I intend to keep the recipe
up-to-date from now on.

