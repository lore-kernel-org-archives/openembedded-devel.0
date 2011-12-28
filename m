Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RfvrG-0007FV-V8
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Dec 2011 16:56:04 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Dec 2011 07:48:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="92282373"
Received: from unknown (HELO helios.localnet) ([10.252.122.71])
	by orsmga002.jf.intel.com with ESMTP; 28 Dec 2011 07:48:47 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
Date: Wed, 28 Dec 2011 15:48:46 +0000
Message-ID: <1535311.D6ZbQ8u8yE@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
In-Reply-To: <CAOHjBZuETnOuVQkfC9hmoS9X8vRVQCnLUPtqF6g5+JLjT4+DQA@mail.gmail.com>
References: <CAOHjBZuETnOuVQkfC9hmoS9X8vRVQCnLUPtqF6g5+JLjT4+DQA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Python2.7.2 compatibility
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
X-List-Received-Date: Wed, 28 Dec 2011 15:56:04 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 28 December 2011 16:43:55 Giuseppe Condorelli wrote:
> I moved to two VM (Fedora16 and Ubuntu11.10). Both have python2.7.2
> I have problem using bitbake against this python version.
> Is this a known problem or I'm missing something?
> I had this problem with both best so far bitbake (git clone) and previous
> stable versions.

Could you be more specific about the problem you are having, and what version 
of BitBake you are using? I am using Python 2.7.2+ on Ubuntu 11.10 with no 
problems.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


