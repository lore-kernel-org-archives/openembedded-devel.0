Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1NSo03-0005Pc-17
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jan 2010 09:45:50 +0100
Received: by fxm4 with SMTP id 4so15008283fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jan 2010 00:43:42 -0800 (PST)
Received: by 10.223.164.96 with SMTP id d32mr2622306fay.106.1262853822204;
	Thu, 07 Jan 2010 00:43:42 -0800 (PST)
Received: from xora-vm2.xora.org.uk ([72.14.240.164])
	by mx.google.com with ESMTPS id 28sm2166073fkx.58.2010.01.07.00.43.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 07 Jan 2010 00:43:41 -0800 (PST)
Received: by xora-vm2.xora.org.uk (Postfix, from userid 500)
	id 22CB1241C6; Thu,  7 Jan 2010 08:43:42 +0000 (GMT)
Date: Thu, 7 Jan 2010 08:43:42 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100107084341.GB1950@xora-vm2.xora.org.uk>
References: <201001060507.31754.holger+oe@freyther.de>
	<hi31m7$hc3$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hi31m7$hc3$1@ger.gmane.org>
User-Agent: Mutt/1.5.20 (2009-08-17)
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: dp@xora.org.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: QA Goals for OpenEmbedded
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
X-List-Received-Date: Thu, 07 Jan 2010 08:45:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 06, 2010 at 11:09:10PM +0100, Rolf Leggewie wrote:
> allergic to COMPATIBLE_MACHINE for no particular reason).  Bitbake can't
> do versioned depends and so we can't say that $bb2-$version does not
> compile with gcc less than 3.4.x, for example.  Those are just two
> examples.  XorA "solved" this in a hackish way with angsstrom.bbclass.
> 
No he didnt and no its not a hack. Its a blacklist of packages that for
various reasons Angstrom NEVER wants built.

Graeme



