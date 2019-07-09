Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 75F627D279
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jul 2019 05:05:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jul 2019 22:06:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,469,1557212400"; d="scan'208";a="364024518"
Received: from mmohdha1-mobl.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.150.37])
	by fmsmga005.fm.intel.com with ESMTP; 08 Jul 2019 22:05:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Date: Tue, 09 Jul 2019 17:05:55 +1200
Message-ID: <1876612.PddKUuPPg8@localhost.localdomain>
Organization: Intel Corporation
In-Reply-To: <d3a2b3cd-906f-d652-e5d8-f721fc3848f3@gmail.com>
References: <20190708003555.8064-1-open.source@oleksandr-kravchuk.com>
	<d3a2b3cd-906f-d652-e5d8-f721fc3848f3@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH][meta-networking] mosquitto: update to 1.6.3
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
X-List-Received-Date: Tue, 09 Jul 2019 05:06:00 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, 8 July 2019 2:39:38 PM NZST akuster808 wrote:
> There is more here than just a version updates. Please explain what the
> other changes are.

Presumably it would be enough to just note them in the commit message.

BTW the new version supports MQTT 5.0 so we probably would want SUMMARY and 
DESCRIPTION to reflect that with this update (or drop the version numbers).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



