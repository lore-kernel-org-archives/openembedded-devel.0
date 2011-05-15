Received: from mail.kernelconcepts.de ([212.60.202.196])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1QLhaZ-0002cN-5G
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 22:06:55 +0200
Received: from [77.182.168.2] (helo=[192.168.1.184])
	by mail.kernelconcepts.de with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.72)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1QLhpQ-0002qc-Ha
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 22:22:16 +0200
Message-ID: <4DD031B1.1050601@kernelconcepts.de>
Date: Sun, 15 May 2011 22:04:01 +0200
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1305290080.2448.3.camel@gnutoo-laptop>
	<1305290588-7057-8-git-send-email-GNUtoo@no-log.org>
In-Reply-To: <1305290588-7057-8-git-send-email-GNUtoo@no-log.org>
X-Enigmail-Version: 1.1.2
Subject: Re: [PATCH 08/12] matchbox-panel: depend on xterm(matchbox panel contain an xterm launcher)
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
X-List-Received-Date: Sun, 15 May 2011 20:06:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Am 13.05.2011 14:43, schrieb Denis 'GNUtoo' Carikli:
> +RDEPENDS += "xterm"

I do not like this one. I have been using matchbox-panel for many years without
having xterm installed.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de
                                        http://www.kernelconcepts.de/en


