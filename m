Received: from leibniz.math.fu-berlin.de ([160.45.40.10]
	helo=mail.math.fu-berlin.de) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1Otpqu-00072n-NT
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Sep 2010 00:44:21 +0200
Received: (qmail 6132 invoked from network); 10 Sep 2010 00:43:39 +0200
Received: from hydra.imp.fu-berlin.de (HELO hydra) (160.45.117.149)
	by leibniz.math.fu-berlin.de with SMTP; 10 Sep 2010 00:43:39 +0200
X-Virus-Scanned: Debian amavisd-new on 'hydra':10024 at mi.fu-berlin.de
Received: from math.fu-berlin.de ([160.45.40.10])
	by hydra (hydra.imp.fu-berlin.de [160.45.117.149]) (amavisd-new,
	port 10024) with SMTP id H+uZIU0H5dic
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Sep 2010 00:43:26 +0200 (CEST)
Received: (Qmail 6099 invoked from network); 10 Sep 2010 00:43:26 +0200
Received: From andorra.imp.fu-berlin.de (160.45.42.84)
	by leibniz.math.fu-berlin.de with SMTP; 9 Sep 2010 22:43:26 -0000
Received: from heinold by andorra.imp.fu-berlin.de with local (Exim 4.69 #1
	(Debian)) id 1Otpq2-0001CX-C0; Fri, 10 Sep 2010 00:43:26 +0200
Date: Fri, 10 Sep 2010 00:43:26 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100909224326.GA3693@mi.fu-berlin.de>
References: <E1OtmZA-0002LR-H4@melo.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <E1OtmZA-0002LR-H4@melo.openembedded.org>
User-Agent: Mutt/1.5.18 (2008-05-17)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-SA-Exim-Connect-IP: 160.45.40.10
X-SA-Exim-Mail-From: heinold@mi.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,UNPARSEABLE_RELAY
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] Frans Meulenbroeks : pulseaudio: made 0.9. 21	compile for armv4 and armv5 too
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
X-List-Received-Date: Thu, 09 Sep 2010 22:44:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 09, 2010 at 07:13:48PM +0000, git version control wrote:
> index a733038..138c0b6 100644
> --- a/recipes/pulseaudio/pulseaudio.inc
> +++ b/recipes/pulseaudio/pulseaudio.inc
> @@ -6,7 +6,7 @@ LICENSE = "LGPL"
>  DEPENDS = "bluez4 libatomics-ops liboil avahi libsamplerate0 libsndfile1 libtool hal virtual/libx11"
>  # optional
>  DEPENDS += "alsa-lib glib-2.0 dbus consolekit hal openssl"
> -INC_PR = "r10"
> +INC_PR = "r0"
Hm is that good changing the INC_PR down?

Bye Henning


