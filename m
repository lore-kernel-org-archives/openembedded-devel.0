Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8AD716AC12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 12:28:08 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 26 May 2015 05:28:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,498,1427785200"; d="scan'208";a="715670903"
Received: from linux-8hqz.fi.intel.com (HELO linux-8hqz.site) ([10.237.68.48])
	by fmsmga001.fm.intel.com with ESMTP; 26 May 2015 05:28:10 -0700
Message-ID: <55646686.6030206@linux.intel.com>
Date: Tue, 26 May 2015 15:26:46 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1431958369-14668-1-git-send-email-alexander.kanavin@linux.intel.com>	<20150521110638.GB2377@jama>	<555F5517.5000100@gmail.com>	<CAJTo0LahDus8tjxEvwZUtyjBjtLO6tsYokx=iMH=WegL9ix46g@mail.gmail.com>
	<55635034.9010702@gmail.com>
In-Reply-To: <55635034.9010702@gmail.com>
Subject: Re: [PATCH 0/4] Add GStreamer 0.10 and things that depend on it from oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 May 2015 12:28:12 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/25/2015 07:39 PM, akuster808 wrote:

> This is less of an xfce issue as meta-oe world wont build do to the
> above mentioned depends. Maybe we may want to move the failing packages
> to a more appropriate location, upgrade or fix the depends.
>
> failing packages:
> farsight2, pidgin, licnice, libcanberra  and qt-mobility

Can I see why qt-mobility fails? It has built fine on my local machine 
after the move from oe-core.

Alex


