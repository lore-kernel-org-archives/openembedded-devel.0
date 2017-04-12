Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id C86D377A2D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 17:21:57 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 12 Apr 2017 10:21:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,191,1488873600"; d="scan'208";a="87965006"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 12 Apr 2017 10:21:58 -0700
To: openembedded-devel@lists.openembedded.org
References: <CAPq_R_ewQocz6eqxt+iEwd=G8g38W89JzQcnHCWRVqsURwv1jQ@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <264f288c-7173-c1ff-c1d7-3007b03fb2c7@linux.intel.com>
Date: Wed, 12 Apr 2017 20:21:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAPq_R_ewQocz6eqxt+iEwd=G8g38W89JzQcnHCWRVqsURwv1jQ@mail.gmail.com>
Subject: Re: Full Python3 Installation
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
X-List-Received-Date: Wed, 12 Apr 2017 17:21:57 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 04/12/2017 08:19 PM, Fabjan Sukalia wrote:
> How do I get a "full" python installation that is comparable with desktop
> systems? Thanks in advance.

I think you need python3-modules (however try to avoid writing recipes 
that rdepend on that, and list things that are specifically needed).

Alex


