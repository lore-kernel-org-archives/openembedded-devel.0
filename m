Received: from mail-fx0-f227.google.com ([209.85.220.227])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NdOoL-0005r4-KP
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Feb 2010 15:05:32 +0100
Received: by fxm27 with SMTP id 27so611805fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Feb 2010 06:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=RKhaGRZRMoAO8kaF5dEqGBfUmnazzWqKiMz4dIlqgfc=;
	b=dXHTESOeknPvBfggPn5Zer037mLTlXb/kazpmiINIyDEghurYfQghtKtSZz9/rHC8b
	NjWyLp87OZ45pX9NzOgwqiRoEKkYIoo+wevy++3w49MTzJNhSmBoxUay0++PGCL7OCoA
	rgSLRpFVbAGctkY3Pqbwg1+vUgnzczZtu2bLA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=gHFtOgojQyQ+2/31WDM2OtStwwgEnimNQGjTMLATUl4a9pabmNxvPMJWgXUO7BAtcB
	Igwp0bZJ93GYRwaJZUPOuBzxvk1AuPm++3jRl7ZsMN63J6cS4WA6UKpwnpWucXqxqghq
	lbE/ZUqXcSaeV9k0GIX0PidvJ9/pcZwDT+8Aw=
Received: by 10.223.77.141 with SMTP id g13mr2986170fak.95.1265378580370;
	Fri, 05 Feb 2010 06:03:00 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm608588fxm.4.2010.02.05.06.02.59
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 05 Feb 2010 06:02:59 -0800 (PST)
Date: Fri, 5 Feb 2010 15:02:10 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100205140210.GE3401@jama>
References: <hkh7p6$418$2@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hkh7p6$418$2@ger.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.227
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Please don't add git SRCPV stuff, it breaks parsing
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
X-List-Received-Date: Fri, 05 Feb 2010 14:05:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 05, 2010 at 02:51:35PM +0100, Koen Kooi wrote:
> Current offender:
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=9d0578e9cf5de355192385d64b2cdf194f729216

Fixed, sorry.

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


