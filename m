Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rfvte-0007NW-Rs
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Dec 2011 16:58:31 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Dec 2011 07:51:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="106709890"
Received: from unknown (HELO helios.localnet) ([10.252.122.71])
	by fmsmga002.fm.intel.com with ESMTP; 28 Dec 2011 07:51:12 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
Date: Wed, 28 Dec 2011 15:51:10 +0000
Message-ID: <1472473.WE2LHPWOEC@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
In-Reply-To: <CAOHjBZtRqvM+DD1_JwuDs2MzWXF=DK9Sg-AtSwNpQsTq--+itw@mail.gmail.com>
References: <CAOHjBZtWd8-_xgqbzx=jBjA4=tRD3CHJ62YiA=dzFr9QsUzaVA@mail.gmail.com>
	<10519823.CSrPkrPaVF@helios>
	<CAOHjBZtRqvM+DD1_JwuDs2MzWXF=DK9Sg-AtSwNpQsTq--+itw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Question about package prefix
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
X-List-Received-Date: Wed, 28 Dec 2011 15:58:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 28 December 2011 16:40:55 Giuseppe Condorelli wrote:
> What micro.conf does is to put all the *_prefix variables to "".
> Also to create an sdk is not my scope, I need to build a base-image distro
> and, running "bitbake base-image", this will not use nativesdk.bbclass
> AFAIK.

I'm not suggesting you should use nativesdk.bbclass, I'm suggesting it as an 
example you can look at where the *_prefix variables are being set.

> I tried to modify *_prefix variables but, everytime, build failed at a
> given point.

Where did it fail? Please provide the error output.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


