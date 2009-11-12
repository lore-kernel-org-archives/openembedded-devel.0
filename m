Received: from [72.14.220.157] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1N8aVd-0004lB-AE
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 15:18:52 +0100
Received: by fg-out-1718.google.com with SMTP id e12so1910520fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 06:17:32 -0800 (PST)
Received: by 10.86.104.7 with SMTP id b7mr247551fgc.34.1258031132437;
	Thu, 12 Nov 2009 05:05:32 -0800 (PST)
Received: from xora-eee (www.xora.org.uk [80.68.91.202])
	by mx.google.com with ESMTPS id e3sm6866751fga.3.2009.11.12.05.05.31
	(version=SSLv3 cipher=RC4-MD5); Thu, 12 Nov 2009 05:05:31 -0800 (PST)
Date: Thu, 12 Nov 2009 13:05:28 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091112130528.GB2239@xora-eee>
References: <alpine.LFD.2.00.0911120045170.1265@localhost>
	<200911120656.41249.holger+oe@freyther.de>
	<200911120722.09166.holger+oe@freyther.de>
	<alpine.LFD.2.00.0911120125380.1977@localhost>
	<ac9c93b10911120015j5b8cbc07j30f57f2dc68987ca@mail.gmail.com>
	<alpine.LFD.2.00.0911120727540.7268@localhost>
	<ac9c93b10911120447k496f094bg478dc05ae612b4a9@mail.gmail.com>
	<alpine.LFD.2.00.0911120748300.3045@localhost>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.00.0911120748300.3045@localhost>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 72.14.220.157
X-SA-Exim-Mail-From: dp@xora.org.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: xterm: either fix it, or remove it. please.
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
X-List-Received-Date: Thu, 12 Nov 2009 14:18:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 12, 2009 at 07:58:23AM -0500, Robert P. J. Day wrote:
> > PS: Personally I think it is a bad idea to change the output format of
> > a utility that is more than 30 years old and that is so widespread.
> 
>   i have to agree but, frankly, i'm astonished that that fundamental a
> change caused breakage in only one package out of about 10,000 (i
> tripped across that building beagleboard-demo-image -- it was the only
> package that failed because of that; i actually think that shows an
> amazing level of robustness).
> 
And it doesnt make it fail here, selinux enabled, can see the extra .
in my normal ls commands. xterm still builds fine.

G



