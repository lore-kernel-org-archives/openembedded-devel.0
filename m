Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 2B63A6041D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jul 2013 09:08:33 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 26 Jul 2013 02:08:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,750,1367996400"; d="scan'208";a="273644663"
Received: from unknown (HELO helios.localnet) ([10.252.122.182])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Jul 2013 02:08:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Riku Voipio <riku.voipio@linaro.org>
Date: Fri, 26 Jul 2013 10:08:31 +0100
Message-ID: <30554455.7Ut5QzeDOD@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-26-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <CAAqcGH=k63ut9rtK0RFwqOLZk5CVyEE2JQXx-Yt96+=RN6etEA@mail.gmail.com>
References: <1374501894-17068-1-git-send-email-riku.voipio@linaro.org>
	<CAAqcGH=k63ut9rtK0RFwqOLZk5CVyEE2JQXx-Yt96+=RN6etEA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-webserver][PATCH] apache2: move pidfile to run
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
X-List-Received-Date: Fri, 26 Jul 2013 09:08:33 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Riku,

On Friday 26 July 2013 11:30:34 Riku Voipio wrote:
> On 22 July 2013 17:04, Riku Voipio <riku.voipio@linaro.org> wrote:
> > pidile was stored in /var/apache2/log which is saved over boots.
> > This might prevent startup of apache2 on boots. Move it to /run
> > where pidfiles in general belong.
> >...
> ping?

Merged to master, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

