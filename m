Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Oy4iY-00031b-Dg
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 17:25:18 +0200
Received: by bwz2 with SMTP id 2so5564137bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 08:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=XYYZEbnW/YU2rhO8xN/3PPiTMN2paWkfghcRq60/Xaw=;
	b=rT5ztjNMAknf0cttpDf+gDFgqIPG8XFSy7cszePgzirFKstvWsqFViX2p/ctD86vM8
	/Svt3yF29ApPIsJLtvhdUc6A7QKWxL7QmiwqILw6RFhVHhIxIcR1QZbefB2OLiuBsNqu
	dNTGxWpzvdHh707Nh/yzdp6S5vS46unu5X9pw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=XzecUTqLQ6lbdOPFnfGx+VdWzkmOtpJt5qerURdlsruxwnnLCcsr4btnYuhGuPxgrs
	I+k0E9zbSWAQfDfN6Fycvi0vLBOtYr38oSh8CvxEykjvx3NvE6f/jq5nuaHRJl5Ouij6
	T3f6yiAk1fU/Pa1au0hGEIi1CbSzo2gk+LQBs=
Received: by 10.204.123.132 with SMTP id p4mr7909754bkr.67.1285082711918;
	Tue, 21 Sep 2010 08:25:11 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 11sm7657329bkj.11.2010.09.21.08.25.09
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 21 Sep 2010 08:25:10 -0700 (PDT)
Date: Tue, 21 Sep 2010 17:25:05 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100921152505.GB3403@jama>
References: <AANLkTikDibG-qAf2b9U_OuOLbVXNP8QWouTEN7z_v25_@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTikDibG-qAf2b9U_OuOLbVXNP8QWouTEN7z_v25_@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: anyone working on recipes for qt 4.7.0 released?
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
X-List-Received-Date: Tue, 21 Sep 2010 15:25:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 21, 2010 at 11:21:32AM -0400, Cliff Brake wrote:
> Qt 4.7.0 is now released:
> 
> http://labs.qt.nokia.com/2010/09/21/qt-4-7-0-now-available/
> 
> Is anyone working on recipes for this yet?  I've been trying to get
> 4.7.0-beta2 to build, so wondering if anyone has tried 4.7.0 released
> yet.

4.7.0-beta2 is building and working for me (SHR) fine, but no time to
work on 4.7.0 now, so would be great if someone else does that.

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


