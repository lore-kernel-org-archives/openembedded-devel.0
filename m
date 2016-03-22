Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 28C3E60796
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2016 15:37:41 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 22 Mar 2016 08:37:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,377,1455004800"; d="scan'208";a="929475390"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 22 Mar 2016 08:37:42 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id A0ED46A4007; Tue, 22 Mar 2016 09:25:25 -0700 (PDT)
Received: from 10.252.26.251
	(SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Tue, 22 Mar 2016 18:25:25 +0200 (EET)
Message-ID: <64951.10.252.26.251.1458663925.squirrel@linux.intel.com>
In-Reply-To: <1817823.GWXx3ahntL@peggleto-mobl.ger.corp.intel.com>
References: <1458568492-29611-1-git-send-email-alexander.kanavin@linux.intel.com>
	<20160321145053.GD2562@jama> <56F008EE.4060600@linux.intel.com>
	<1817823.GWXx3ahntL@peggleto-mobl.ger.corp.intel.com>
Date: Tue, 22 Mar 2016 18:25:25 +0200 (EET)
From: alexander.kanavin@linux.intel.com
To: "Paul Eggleton" <paul.eggleton@linux.intel.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
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
X-List-Received-Date: Tue, 22 Mar 2016 15:37:45 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

>> > So you can remove distro_features_check inherit as well, right?
>>
>> Yeah, I guess. Feel free to amend.
>
> The reviewer is asking you to do that, although perhaps not in so many
> words.
> Can you, please?

I don't believe I should, if the review consists of a single trivial
nitpick from the person who also does the actual commits to master. It's
less friction and noise for both of us this way.

Alex

