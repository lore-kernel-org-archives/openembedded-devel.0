Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1LoKuT-00072F-DC
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Mar 2009 19:04:29 +0200
Received: from andromeda.vanille.de (e180158216.adsl.alicedsl.de
	[85.180.158.216])
	by drlauer-research.com (Postfix) with ESMTP id EBDCC584638
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Mar 2009 19:29:13 +0200 (CEST)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Mar 2009 18:02:17 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.27-11-generic; KDE/4.2.0; x86_64; ; )
References: <cover.1238025789.git.andrea.adami@gmail.com>
	<87fxgv44gn.fsf@neumann.lab.ossystems.com.br>
	<gqqcmo$63n$1@ger.gmane.org>
In-Reply-To: <gqqcmo$63n$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200903301902.18106.mickey@vanille-media.de>
Subject: Re: [PATCH 1/1] angstrom-2008.1.conf: add PREFERRED_PROVIDER_virtual/psplash -silence warning during parsing
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
X-List-Received-Date: Mon, 30 Mar 2009 17:04:29 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 30 March 2009 14:07:50 Koen Kooi wrote:
> But then again, people are still claiming angstrom is bloated and
> minimal isn't when minimal is currently angstrom.conf with sed
> s/angstrom/minimal/ applied to it...

Indeed, I think it's rather the style of presentation that makes people feel 
angstrom is bloated -- that's why I regrouped the settings and split them in 
individual .inc. Perhaps eventually we find a way of working together again so 
that we could share some of the .inc files.

:M:



