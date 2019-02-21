Return-Path: <timothy.t.orling@linux.intel.com>
X-Greylist: delayed 571 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 21 Feb 2019 05:39:25 UTC
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B0B927CAE7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Feb 2019 05:39:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Feb 2019 21:29:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,393,1544515200"; d="scan'208";a="124060732"
Received: from mtomozan-mobl.gar.corp.intel.com ([10.254.19.106])
	by fmsmga007.fm.intel.com with ESMTP; 20 Feb 2019 21:29:55 -0800
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
From: Tim Orling <timothy.t.orling@linux.intel.com>
In-Reply-To: <a95ecc3be4a5a7e280b82f42a3b28b8d69537607.camel@intel.com>
Date: Wed, 20 Feb 2019 21:29:54 -0800
Message-Id: <ADF2277D-B18B-4F66-A561-8EE83D87F9BB@linux.intel.com>
References: <121AFB8E-F806-4725-BCE0-E6E14952B2CD@linux.intel.com>
	<a95ecc3be4a5a7e280b82f42a3b28b8d69537607.camel@intel.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
X-Mailer: Apple Mail (2.3445.102.3)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: UPSTREAM_CHECK_REGEX help needed with libterm-readkey-perl
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
X-List-Received-Date: Thu, 21 Feb 2019 05:39:25 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 7bit

Thank you. That is exactly what was needed.


> On Feb 18, 2019, at 11:05 PM, Mittal, Anuj <anuj.mittal@intel.com> wrote:
> 
> UPSTREAM_CHECK_URI = "https://metacpan.org/release/TermReadKey"


