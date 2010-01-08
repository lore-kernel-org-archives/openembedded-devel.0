Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NTFnq-0007z3-QP
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jan 2010 15:27:05 +0100
Received: by fxm4 with SMTP id 4so16147859fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jan 2010 06:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=lA9/JoqAcqbBv5gE72Ap3jP4Ug23FB82YG78nBzKx1Y=;
	b=sYqpfPbQOt/3+uax6Gfdx7uVoSHvLL8ESsv947/sqKHl9hUtH0M/4LwlFB6Fac2eBu
	ETR1pGUFtHt+WF63HqgkvCMR72Prh3J7EuF383iUTJswWBaCbiIb7jw3gSTjpKFYoGlD
	/gYDtjwLOm/psH9QaWbqqPiQd/zaTQAt9vAmQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=a+XWC7U9QRUyQKHyzgoG++kNQQcxaGteSwkhg7CGnLGmkl6Yk7kvH6EMqRdlfF+GQr
	xcxpRr5KS/EdBInlzYEcFWkHYCbck2FLE0iSFXETpRhV2pxF0zE0xvrc2lvScuO7pGhM
	0fY9G+cyFYSjaCvvCsujg8sBn8WX6EMfXjnSk=
Received: by 10.223.13.209 with SMTP id d17mr4811870faa.100.1262960696537;
	Fri, 08 Jan 2010 06:24:56 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm8269512fxm.2.2010.01.08.06.24.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 08 Jan 2010 06:24:55 -0800 (PST)
Date: Fri, 8 Jan 2010 15:24:53 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100108142453.GC2156@jama>
References: <20100108132344.GB2156@jama>
	<201001081502.46952.holger+oe@freyther.de>
MIME-Version: 1.0
In-Reply-To: <201001081502.46952.holger+oe@freyther.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: update-alternatives broken badly (by me :()
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
X-List-Received-Date: Fri, 08 Jan 2010 14:27:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 08, 2010 at 03:02:46PM +0100, Holger Hans Peter Freyther wrote:
> On Friday 08 January 2010 14:23:44 Martin Jansa wrote:
> > After this change
> > http://cgit.openembedded.net/cgit.cgi/openembedded/commit/?id=9b641bbfed07c
> > 075ae5cbe84082a85f1ba703447
> 
> thanks for highlighting this. Let me say something regarding the commit 
> message. Your commit message is not saying anything regarding "Why", it is not 
> indicating a post to the mailinglist, it is not saying what problem is fixed.
> 
> Could we all try to have answers to:
> 	- What
> 	- How
> 	- Why
> 
> in our commit messages? And maybe ask someone for review before touching basic 
> files(*)?

It was sent here about month before commit
http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg01444.html

Also discussed here
http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg01180.html

Then again as part of compatibility-providers
http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg01891.html

And one other thread I cannot find now..

But sorry I haven't provide better overwiev and/or links to those
threads in commit msg.

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


