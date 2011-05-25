Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1QPDxQ-0003c8-FJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 May 2011 15:17:04 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 622EF110022F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 May 2011 15:13:59 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id B22351100226
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 May 2011 15:13:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g225145225.adsl.alicedsl.de
	[92.225.145.225]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 May 2011 15:13:58 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 1C55B3C0DE; Wed, 25 May 2011 15:13:05 +0200 (CEST)
Date: Wed, 25 May 2011 15:13:04 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110525131304.GA11519@mail.familie-heinold.de>
References: <y>
 <1306328337-19285-1-git-send-email-eyalr@ti.com>
MIME-Version: 1.0
In-Reply-To: <1306328337-19285-1-git-send-email-eyalr@ti.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [PATCH] wpa-gui-e: build the latest version from git sources
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
X-List-Received-Date: Wed, 25 May 2011 13:17:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 25, 2011 at 03:58:57PM +0300, Eyal Reizer wrote:
> +       install -d ${D}${datadir}/wpa_gui
> +       install -d ${D}${datadir}/applications

Hi,

why are these dir's needed, when you don't install something
into it?

Bye Henning


