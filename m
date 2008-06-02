Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>)
	id 1K3BQC-0006M0-ND; Mon, 02 Jun 2008 16:54:04 +0200
Received: from andromeda (e180179024.adsl.alicedsl.de [85.180.179.24])
	by drlauer-research.com (Postfix) with ESMTP id 85258584C15;
	Mon,  2 Jun 2008 16:51:20 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-commits@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Date: Mon, 2 Jun 2008 16:49:48 +0200
User-Agent: KMail/1.9.9
References: <20080602143920.A10231892EC@amethyst.openembedded.net>
In-Reply-To: <20080602143920.A10231892EC@amethyst.openembedded.net>
MIME-Version: 1.0
Message-Id: <200806021649.49116.mickey@vanille-media.de>
Subject: Re: [oe-commits] org.oe.dev hal: sync with poky
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Mon, 02 Jun 2008 14:54:05 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 02 June 2008 16:39:20 koen commit wrote:
> hal: sync with poky

This commit breaks dbus/hal restartability which I fixed a couple of weeks 
ago.

Can you double check whether it still works for you?

:M:


