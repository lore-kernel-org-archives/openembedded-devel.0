Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mickey@vanille-media.de>) id 1PrbLk-0006ga-WB
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Feb 2011 20:23:13 +0100
Received: from [192.168.2.2] (e180149189.adsl.alicedsl.de [85.180.149.189])
	by phalanx.drlauer-research.com (Postfix) with ESMTPSA id 08996584083
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Feb 2011 20:41:13 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTi=rTuT81+QVpNo4oL_J53nKbs5tnEh+=asqgE6a@mail.gmail.com>
References: <AANLkTi=rTuT81+QVpNo4oL_J53nKbs5tnEh+=asqgE6a@mail.gmail.com>
Organization: Vanille-Media
Date: Mon, 21 Feb 2011 20:25:39 +0100
Message-ID: <1298316339.16999.32.camel@saphir>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: minimal-image starts dragging in GTK
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
X-List-Received-Date: Mon, 21 Feb 2011 19:23:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Montag, den 21.02.2011, 18:53 +0100 schrieb Leon Woestenberg:
> Hello all,
> 
> 
> since recently, minimal-image starts dragging in GTK. I have tracked
> it down to this commit:
> 
> avahi: integrate python into main recipe
> * this doesn't introduce spurious rdepends like enabling gtk did in the past
> 
> Signed-off-by: Koen Kooi <koen@openembedded.org>
> 
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=70e46e545095a2b2dac634d484eb1c331a1bff34
> 
> 
> This seems a hard-dependency, indepent of "+AVAHI_GTK ?= "-disable-gtk""

This looks like a typo (missing -), in any case.

-- 
:M:



