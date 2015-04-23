Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 79EC76AC24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 09:30:45 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 23 Apr 2015 02:30:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,629,1422950400"; d="scan'208";a="684432607"
Received: from kreynold-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.25.159])
	by orsmga001.jf.intel.com with ESMTP; 23 Apr 2015 02:30:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: rongqing.li@windriver.com
Date: Thu, 23 Apr 2015 10:30:45 +0100
Message-ID: <1686725.W7nVKc29pL@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.9-200.fc21.x86_64; KDE/4.14.6; x86_64; ; )
In-Reply-To: <1429759273-32045-1-git-send-email-rongqing.li@windriver.com>
References: <1429759273-32045-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-oe] php: uprev it to 5.5.24
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
X-List-Received-Date: Thu, 23 Apr 2015 09:30:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Roy,

On Thursday 23 April 2015 11:21:13 rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
> 
> 5.5.24 has lots of CVE fixes

I know it's a bit of a pain, but could you please list all of the CVEs in the 
commit message? Hopefully it should just be a matter of copying them from the 
release notes for the releases since 5.5.21.

Also, I see you've changed LIC_FILES_CHKSUM, please add a note to the commit 
message explaining exactly what changed in the license text to cause this 
(even if it's just a copyright year change as it often is).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

