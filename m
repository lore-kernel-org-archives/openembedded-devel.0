Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 88FF472799
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 13:06:49 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 18 Dec 2014 05:06:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,600,1413270000"; d="scan'208";a="639685507"
Received: from obeyaert-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.31.63])
	by fmsmga001.fm.intel.com with ESMTP; 18 Dec 2014 05:06:37 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chen Qi <Qi.Chen@windriver.com>
Date: Thu, 18 Dec 2014 13:06:36 +0000
Message-ID: <2646521.ARjvrQxUQ9@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.6-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <20141218122445.GC2462@jama>
References: <1418894414-27376-1-git-send-email-Qi.Chen@windriver.com>
	<20141218122445.GC2462@jama>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] xserver-nodm-init: remove recipe
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
X-List-Received-Date: Thu, 18 Dec 2014 13:06:56 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 18 December 2014 13:24:45 Martin Jansa wrote:
> On Thu, Dec 18, 2014 at 05:20:14PM +0800, Qi.Chen@windriver.com wrote:
> > From: Chen Qi <Qi.Chen@windriver.com>
> > 
> > Remove recipe as this recipe is in OE-core.
> 
> No, there is important diff which isn't in oe-core.

It's something that has been sitting on my todo list for some time 
unfortunately:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=5546

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

