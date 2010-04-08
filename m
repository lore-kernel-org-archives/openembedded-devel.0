Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1NznDT-0008Aj-Fp
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 10:36:00 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 621A4EA671
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Apr 2010 04:32:38 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Thu, 08 Apr 2010 04:32:38 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=/pTa+eA7o8PE0h4EGXipPAOJQWo=;
	b=LLl4IZcEUq82jllMV9iNNF754GP3YgUVM6ceNbPuSf1KsUio84sf6GBQfO8Jo00fqxOvUOx516JdpcX3nzYEtXMevvfH2Mfryh7Bc5M0zS5bSNpgDRmEBUF9UAmuNdVr3GwDEBspF8zraQCa5RtlsmsuVItRFdZtDeqDGpQGogs=
X-Sasl-enc: vhaUQDLfnTASUqICFYPz+UKej6GzZEMao+PTMlQVDEgB 1270715557
Received: from vitus.devnet.local (unknown [212.144.247.210])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 1C4E735E54
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Apr 2010 04:32:36 -0400 (EDT)
Date: Thu, 8 Apr 2010 10:32:34 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.DEB.1.10.1004081018050.3264@vitus.devnet.local>
Message-ID: <alpine.DEB.1.10.1004081030010.3264@vitus.devnet.local>
References: <alpine.DEB.1.10.1004081018050.3264@vitus.devnet.local>
User-Agent: Alpine 1.10 (DEB 962 2008-03-14)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.26
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] dfu-programmer: USB Device Firmware Upgrade utility (special atmel-version)
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
X-List-Received-Date: Thu, 08 Apr 2010 08:36:00 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

On Thu, 8 Apr 2010, Vitus Jensen wrote:
>
> Add recipes for version 0.5.2 and for the head of the SVN repository.
>
> Signed-off-by: Vitus Jensen <vjensen@gmx.de>
> ---
> conf/checksums.ini                             |    4 ++++
> recipes/dfu-programmer/dfu-programmer_0.5.2.bb |   17 +++++++++++++++++
> recipes/dfu-programmer/dfu-programmer_svn.bb   |   20 ++++++++++++++++++++
> 3 files changed, 41 insertions(+), 0 deletions(-)
> create mode 100644 recipes/dfu-programmer/dfu-programmer_0.5.2.bb
> create mode 100644 recipes/dfu-programmer/dfu-programmer_svn.bb

I know that nowerdays the checksums are inside the recipe.  But we are 
working on the stable/2009 branch were it isn't done this way 
(or not supported?).  Please accept as is.

Vitus

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


