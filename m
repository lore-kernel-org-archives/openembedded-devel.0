Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PyCFo-0003TG-Ko
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 01:00:20 +0100
Received: by pzk35 with SMTP id 35so311125pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2011 15:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=jRqSH3Eja7GqekfYqgrx2IKNME7Tw3nDqOp6kIbwH0Y=;
	b=rK5QNXj7DEVWIuneBbAa/lyt086T1hUiv6gObnEsIMh83/C8D2S056dEtTneD4/6Q0
	mZKu1su23SNTXpqxuPgKfOoH6DOEFW7GlPt7KHk4DZP1UADKlZKy0snViLH+74xGi2wS
	GGo7fXO7nvLjybEUt6gJJI1TtxfxPi6GP8cd8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=EUEZUGbdXPv+Es0RNhA8g1sL5V++6J4F6tqjvaaUUoEesC/CdXDw4LCzzs4Xd9S7lt
	lNrCBnPsbD354wyzTF9BRImppxj3xDk7LtKPa5Hb85ZzWeiK9Nz4geI/Owp7pE85QEhe
	G6Fo1rPzvVL+c3oOt1TnWPty15Gy2P75ZUur8=
Received: by 10.142.224.13 with SMTP id w13mr980898wfg.284.1299887919372;
	Fri, 11 Mar 2011 15:58:39 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id o11sm6020963wfa.0.2011.03.11.15.58.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Mar 2011 15:58:38 -0800 (PST)
Date: Fri, 11 Mar 2011 15:59:03 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110311235903.GD5603@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1299838487.2321.9.camel@computer>
MIME-Version: 1.0
In-Reply-To: <1299838487.2321.9.camel@computer>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] htcleo: update xorg.conf
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
X-List-Received-Date: Sat, 12 Mar 2011 00:00:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (11/03/11 11:14), Lukas-David Gorris wrote:
> Attached patch updates xorg.conf for htcleo machine. It's needed to
> disable tslib. Tested on the device.
> 

needs a PR bump. 

> Best,
> Lukas


> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
-Khem


