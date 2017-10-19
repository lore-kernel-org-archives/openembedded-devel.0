Return-Path: <raphael.kubo.da.costa@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1B19A71A50
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Oct 2017 16:24:12 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Oct 2017 09:24:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,402,1503385200"; d="scan'208";a="1207677652"
Received: from rkubodac-desk.ger.corp.intel.com ([10.252.26.62])
	by fmsmga001.fm.intel.com with ESMTP; 19 Oct 2017 09:24:12 -0700
From: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
To: Jacobo Aragunde =?utf-8?Q?P=C3=A9rez?= <jaragunde@igalia.com>
In-Reply-To: <87efq0wnt0.fsf@rkubodac-desk.ger.corp.intel.com> (Raphael Kubo
	da Costa's message of "Wed, 18 Oct 2017 16:08:59 +0200")
Organization: Intel International BV - KvK 34098535 - Capronilaan 37 1119NG
	Amsterdam
References: <cc8aeb58-0a29-de25-29b2-d6f1620409f9@igalia.com>
	<CAP9ODKq_x-xT_ux1tmcgDBuaUc2ekw36YAjQ66=iR3OBRgebJA@mail.gmail.com>
	<CAHUNapS+dr5Uc4upvd00vve+WubDT0Fgsc16vQmWXh3O1ErcLw@mail.gmail.com>
	<4e71f40e-63cb-0857-f292-ec3a120776c1@igalia.com>
	<5612aa4c-d986-89f7-7667-14898b5f7bfc@igalia.com>
	<878tgbxio5.fsf@rkubodac-desk.ger.corp.intel.com>
	<874lqzxhoc.fsf@rkubodac-desk.ger.corp.intel.com>
	<87efq0wnt0.fsf@rkubodac-desk.ger.corp.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
Date: Thu, 19 Oct 2017 18:24:11 +0200
Message-ID: <87shefnm1g.fsf@rkubodac-desk.ger.corp.intel.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: Re: [meta-browser] Modern Chromium with GN
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
X-List-Received-Date: Thu, 19 Oct 2017 16:24:13 -0000
Content-Type: text/plain

Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com> writes:
> Work on Chromium 62 has started, but updating is a bit slower now that
> I'm trying to test GCC 5, 7, pyro and rocko.

I've pushed a new branch called "chromium62". It's been test-built
against Yocto's pyro (with GCC 5) and rocko (with GCC 7) for x86 and
x86-64.

Additional testing is appreciated!

