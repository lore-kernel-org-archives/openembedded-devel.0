Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A01A96B678
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2014 14:56:43 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Jan 2014 06:52:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,691,1384329600"; d="scan'208";a="441696648"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.122.239])
	by orsmga001.jf.intel.com with ESMTP; 20 Jan 2014 06:56:36 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: jackie.huang@windriver.com
Date: Mon, 20 Jan 2014 14:56:34 +0000
Message-ID: <1500081.lxhvWhSdf3@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.11.5 (Linux/3.12.7-300.fc20.x86_64; KDE/4.11.5; x86_64; ; )
In-Reply-To: <1389940848-376-1-git-send-email-jackie.huang@windriver.com>
References: <1389940848-376-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] strongswan: update verion to 5.1.1
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
X-List-Received-Date: Mon, 20 Jan 2014 14:56:43 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 17 January 2014 14:40:48 jackie.huang@windriver.com wrote:
> * Add rdepends on strongswan-plugins.

Is this really correct? Does strongswan not work without the plugins?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

