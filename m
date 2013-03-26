Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UKUph-0001JE-0G
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Mar 2013 15:26:40 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 26 Mar 2013 07:07:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,911,1355126400"; d="scan'208";a="284744649"
Received: from unknown (HELO helios.localnet) ([10.255.13.191])
	by orsmga001.jf.intel.com with ESMTP; 26 Mar 2013 07:09:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: d r <1337ch1770r@googlemail.com>
Date: Tue, 26 Mar 2013 14:09:01 +0000
Message-ID: <227388184.xnyZDIDxok@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.1 (Linux/3.5.0-26-generic; KDE/4.10.1; i686; ; )
In-Reply-To: <CACCbTUkq760C8oN1o5NycCJ6T+JLs5eobd28JAW6m388w___tQ@mail.gmail.com>
References: <CACCbTUkq760C8oN1o5NycCJ6T+JLs5eobd28JAW6m388w___tQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: "No recipes available"
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
X-List-Received-Date: Tue, 26 Mar 2013 14:26:42 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 26 March 2013 14:52:39 d r wrote:
> "No recipes available for:
> /media/sda1/meta-fsl-arm-master/meta-fsl-arm-master/recipes-qt/qt4/qt4-embed
> ded_4.8.4.bbappend
> /media/sda1/meta-fsl-arm-master/meta-fsl-arm-master/recipes-multimedia/gstr
> eamer/gst-plugins-gl_0.10.3.bbappend
> 
> /media/sda1/meta-fsl-arm-master/meta-fsl-arm-master/recipes-qt/qt4/qt4-x11-f
> ree_4.8.4.bbappend
> /media/sda1/meta-fsl-arm-master/meta-fsl-arm-master/recipes-graphics/mesa/m
> esa_9.0.2.bbappend "
> Does anyone know what to do now?

Are you perhaps trying to use the master branch of meta-fsl-arm with an older 
branch/version of meta (OE-Core)?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


