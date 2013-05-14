Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jukka.rissanen@linux.intel.com>) id 1UcEvk-0003X7-Ce
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 May 2013 15:06:13 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 14 May 2013 05:46:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,670,1363158000"; d="scan'208";a="337365267"
Received: from sorvi.fi.intel.com (HELO [10.237.72.154]) ([10.237.72.154])
	by fmsmga002.fm.intel.com with ESMTP; 14 May 2013 05:46:46 -0700
Message-ID: <51923235.2080809@linux.intel.com>
Date: Tue, 14 May 2013 15:46:45 +0300
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120801 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1368518279-8029-1-git-send-email-jukka.rissanen@linux.intel.com>
	<20130514122505.GC3918@windriver.com>
In-Reply-To: <20130514122505.GC3918@windriver.com>
Cc: Joe MacDonald <Joe.MacDonald@windriver.com>
Subject: Re: [meta-networking][PATCH v2] vpnc: Runtime dependency to perl was missing
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 May 2013 13:06:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Joe,

On 14.05.2013 15:25, Joe MacDonald wrote:
> [[oe] [meta-networking][PATCH v2] vpnc: Runtime dependency to perl was missing] On 13.05.14 (Tue 10:57) Jukka Rissanen wrote:
>
>>
> Given that I'd already merged your previous change (and Koen is
> absolutely right, I should've pushed back on it too since I completely
> agree with him) can you send out another version of this patch that
> addresses his suggestion about reordering the R* variables and is
> against the latest tree?  This one won't apply as the tree stands now.
>
> Thanks.

Sure, a new patch is in its way.


Cheers,
Jukka




