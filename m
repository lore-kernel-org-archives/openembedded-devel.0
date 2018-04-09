Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2575C74691
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Apr 2018 14:05:34 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Apr 2018 07:05:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,427,1517904000"; d="scan'208";a="218939489"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by fmsmga005.fm.intel.com with ESMTP; 09 Apr 2018 07:05:34 -0700
Date: Mon, 9 Apr 2018 17:06:05 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: "Szczypta, Marek" <Marek.Szczypta@assaabloy.com>
Message-ID: <20180409140605.GA20337@mbabyjoh-desk.ger.corp.intel.com>
References: <a6679828db8c4b3c8e43e4d4ad842bea@assaabloy.com>
MIME-Version: 1.0
In-Reply-To: <a6679828db8c4b3c8e43e4d4ad842bea@assaabloy.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: opnejdk from meta-java for aarm64 ?
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
X-List-Received-Date: Mon, 09 Apr 2018 14:05:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

On Mon, Apr 09, 2018 at 08:22:50AM +0000, Szczypta, Marek wrote:
> Hi ,
> 
> I tried to compile the openjdk from meta-java layer for ﻿aarm64  . The master branch claims that is should work for u161b15 . But after I set up the build it tries to build u162b12 for which it fail as there is no support for aarm64 . Do you know if this is working ? or how to set up it up correctly so I can use the u161b15 ? I found there is 162b12.bb file but no 161b15 only openjdk-8_16xbyy.bb ?

openjdk-8 was build/run tested on the latest meta-java master branch for qemuarm64. 
Can you please share the changes made to the local.conf?

Best Regards,
Maxin

