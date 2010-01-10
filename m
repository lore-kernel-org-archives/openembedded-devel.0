Received: from mail-fx0-f216.google.com ([209.85.220.216])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NU5Vy-0002es-5r
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jan 2010 22:40:05 +0100
Received: by fxm8 with SMTP id 8so18830292fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2010 13:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=CDM9s2Rf3qOzc762rVS9q4ZRyk530gGhy/ks/zhHDWg=;
	b=cxk/zvjAErbzrIKhSwivHhGuw1dGv/qgph81L5Jd8TL/X48DgzqFnXXKaSGYi0nJIO
	/mT4pR6usETJgrpFX/VcMLQh6NSGhLCEiZiGIyMvxC9BFOxtS/bavRIn7KXfeyZAcdbI
	JqKKjXPAmZ/VEHfUoNqY+UDVWPJTLi1vSvIFI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=crAxz4bI8bKX+Xl9OxJlroXKTD9dsLKY1Tw5k0Uc0JYV5b0C4cSIFymk1i2XTQfCnE
	4ydScphnIWLTY+7Cp5N094m5MGMdwOnmYPLyGK+frcMeimiEPH3cGy/U0d5lDJBlhy2h
	Sv12SZQXCay9+BwhjqFmupo+RZqFoJS1ZWakI=
Received: by 10.223.4.84 with SMTP id 20mr284264faq.97.1263159474128;
	Sun, 10 Jan 2010 13:37:54 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm9274804fxm.4.2010.01.10.13.37.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 10 Jan 2010 13:37:53 -0800 (PST)
Date: Sun, 10 Jan 2010 22:37:48 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100110213748.GN17224@jama>
References: <E1NU5O5-0000rE-L2@melo.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <E1NU5O5-0000rE-L2@melo.openembedded.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.216
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] Michael : pyrtm: Added Python library for Remember the Time
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
X-List-Received-Date: Sun, 10 Jan 2010 21:40:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 10, 2010 at 09:31:53PM +0000, git version control wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: b87ef25ed7367b4c6f85eddb706470a288ffe593
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=b87ef25ed7367b4c6f85eddb706470a288ffe593
> 
> Author: Michael <kichkasch@gmx.de>
> Date:   Sat Jan  9 07:35:34 2010 +0000

Sorry for that.. 
Author: Michael Pilgermann <kichkasch@gmx.de>

Patchwork should higlight Author field from patch instead of "From: "

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


