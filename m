Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5999176F33
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Sep 2015 11:21:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 01 Sep 2015 04:21:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,448,1437462000"; d="scan'208";a="780236907"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 01 Sep 2015 04:21:19 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id 781956A4087; Tue,  1 Sep 2015 04:20:28 -0700 (PDT)
Received: from 10.252.32.34 (SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Tue, 1 Sep 2015 14:20:28 +0300 (EEST)
Message-ID: <50735.10.252.32.34.1441106428.squirrel@linux.intel.com>
In-Reply-To: <1441043247-5310-1-git-send-email-alejandro.delcastillo@ni.com>
References: <1441043247-5310-1-git-send-email-alejandro.delcastillo@ni.com>
Date: Tue, 1 Sep 2015 14:20:28 +0300 (EEST)
From: alexander.kanavin@linux.intel.com
To: openembedded-devel@lists.openembedded.org
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Subject: Re: [PATCH] opkg: upgrade to v0.3.0
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
X-List-Received-Date: Tue, 01 Sep 2015 11:21:19 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> Changes required:
> - Rename opkg-cl to opkg
> - Add libarchive dependency
> - Drop backport patches
> - Drop obsolete directory options
> - Add patch to handle empty index files
>
> Based on initial work by Paul Barker.
>
> Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> CC: Paul Barker <paul@paulbarker.me.uk>


Before you submit to the correct ML, also the opkg version (and PR) in
adt-installer_1.0.bb should be updated.

Alex

