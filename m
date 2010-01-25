Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1Na6oV-0006Ro-MY
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jan 2010 13:16:06 +0100
Received: by fxm4 with SMTP id 4so5758119fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2010 04:13:42 -0800 (PST)
Received: by 10.223.5.23 with SMTP id 23mr9936270fat.53.1264594421475;
	Wed, 27 Jan 2010 04:13:41 -0800 (PST)
Received: from xora-build.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by mx.google.com with ESMTPS id d13sm9457072fka.47.2010.01.27.04.13.39
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 27 Jan 2010 04:13:40 -0800 (PST)
Received: by xora-build.xora.org.uk (Postfix, from userid 500)
	id 4A39F41402; Mon, 25 Jan 2010 08:52:46 +0000 (GMT)
Date: Mon, 25 Jan 2010 08:52:46 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100125085246.GA2670@xora-build.xora.org.uk>
References: <1264277173.3738.74.camel@mattotaupa.wohnung.familie-menzel.net>
	<20100124070602.GA8642@denix.org> <hjh7f3$6v0$2@ger.gmane.org>
	<20100125015636.GA9855@denix.org> <hjjk5q$rmc$1@ger.gmane.org>
	<20100125084340.GA18489@denix.org>
MIME-Version: 1.0
In-Reply-To: <20100125084340.GA18489@denix.org>
User-Agent: Mutt/1.5.20 (2009-08-17)
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: dp@xora.org.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Official policy to list checksums
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
X-List-Received-Date: Wed, 27 Jan 2010 12:16:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 25, 2010 at 03:43:40AM -0500, Denys Dmytriyenko wrote:
> This way we won't get anywhere... :) I thought (maybe I'm wrong) everybody 
> agrees at least with the fact that central checksums.ini is not the best 
> approach. Keeping checksums in the metadata inside SRC_URI seemed like a 
> viable solution. Are there any fundamental flaws with this method, besides 
> lacking some tools?

I dont think there is any fundamental flaws, but there is still quite
a lot of cleanup work. Patches like

http://www.xora.org.uk/cgi-bin/cgit.cgi/openembedded/commit/?h=xora/gnome-update&id=d2074190e711eb70a0bd26d2ac5b89b4988044b5

Will need to be applied in some places.

Graeme



