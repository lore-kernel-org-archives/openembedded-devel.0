Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NWYQO-0003fh-1H
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 17:56:31 +0100
Received: by fxm4 with SMTP id 4so180303fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2010 08:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=HuPUu1nwQ6au6lvlgDWNGHVLw6AvV8texn7wfx5HJDo=;
	b=AhtnC/fQ6Uw3t/H1j8kAPhkI7dE4srN+lQZFPfAI6XnlgOYOsnwdidNZSsK01JzOTw
	2N0jDoF1GZuPcNa19zTXl+BBP+porGee5G/HDhCugK4/gboI6yt919o/udAFqUpDI+vA
	FSSV401f/kBImJra6IX1ff3Gw0g7hjBkHQlNk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=nUWDTAC2Rw3duoRXSEMvTKN6L0mOBQ7DsBilahnvpnj5mgRRgwWRo5EXfnaEVkBsXS
	+e3AQR45ZoB9lMK/SwEX+2S6N4UFe83tD6pS96mpdNkiq5tzTSRwt0z+ekkNgit1b06W
	yHoh/T4qyrYsGBCy/vjAn0Avius7gvLzo4q9M=
Received: by 10.223.76.137 with SMTP id c9mr577496fak.76.1263747254364;
	Sun, 17 Jan 2010 08:54:14 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm1760266fxm.6.2010.01.17.08.54.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 17 Jan 2010 08:54:13 -0800 (PST)
Date: Sun, 17 Jan 2010 17:54:04 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100117165403.GP30938@jama>
References: <alpine.LFD.2.00.1001171141210.11393@localhost>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.00.1001171141210.11393@localhost>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: beagleboard-demo-image, and the evil that is "gnome-games"
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
X-List-Received-Date: Sun, 17 Jan 2010 16:56:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 17, 2010 at 11:47:06AM -0500, Robert P. J. Day wrote:
>   it seems counter-productive to allow a single games package to put
> the brakes on an entire build.

Maybe you want to build with -k?

If there is some build problem in games package, then it should be
fixed, not silenced by whole task removal.

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


