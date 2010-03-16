Received: from mail-fx0-f227.google.com ([209.85.220.227])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NrTyk-00023N-CZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 11:26:31 +0100
Received: by fxm27 with SMTP id 27so322945fxm.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Mar 2010 03:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=EgGlo1YiN/NdoTkgFqroqvt+STVLrNZJAVWYfrS0IOg=;
	b=iLlm5/Hy+Ok6TEXfNtIHBCFaABRmhMo7UmjM18D1yh+2g7E0aNYFujpbvsrkXJSB/3
	izLaeHFN4cS74cUHwwp5ULVq0Y+HKjUrc9KQSAJUVlm4Z4drLES1skkYgQZc2Nu6ds05
	k4mj0FLhBXQ9VXlsbYPeZWPF9gWRYp/rFbPA4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=D/6pXho+fh19B/uPff7LTB+OklK/i3Y0Yiz22FxsyfuwtcPXfptTbTuUtfc+HJ+9mO
	f7snt5nWyvH50JtA8QXeiISH/YQal7c7JmJEH12FoeC1xygDWRNXySam+iFuOCE+8dTE
	38/16uQrVYAhrg3Ax78i5ojA7Xb7Rd4YTI3h0=
Received: by 10.87.64.38 with SMTP id r38mr902861fgk.58.1268735003982;
	Tue, 16 Mar 2010 03:23:23 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm64211fxm.5.2010.03.16.03.23.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 16 Mar 2010 03:23:23 -0700 (PDT)
Date: Tue, 16 Mar 2010 11:23:17 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100316102317.GC29306@jama>
References: <1268734080.3990.23.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1268734080.3990.23.camel@mattotaupa>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.227
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: author dates in commits: Times are converted incorrectly?
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
X-List-Received-Date: Tue, 16 Mar 2010 10:26:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 16, 2010 at 11:08:00AM +0100, Paul Menzel wrote:
> Dear OE folks (especially Philip and Martin),

Hi Paul,

> is something wrong with the time of the applied patches? I refer to the
> following commits.
> 
> 
> commit 0315e512f4b5d71dc0dbeb6fee9ada5b7b7b2bea
> Author:     Paul Menzel <paulepanter@users.sourceforge.net>
> AuthorDate: Mon Mar 15 12:35:00 2010 +0000
> Commit:     Martin Jansa <Martin.Jansa@gmail.com>
> 
> Date in my message header.
> 
> Date: Mon, 15 Mar 2010 23:35:00 +0100
> 
> Is that a problem with Git not coping correctly with 24 h and 12 h
> representation?

Probably problem with patchwork, because
http://patchwork.openembedded.org/patch/1732/mbox/
already shows for commit 0315e512f4b5d71dc0dbeb6fee9ada5b7b7b2bea

From patchwork Mon Mar 15 22:35:00 2010
Subject: [oe,2/2] ffmpeg: Stage `attributes.h`.
Date: Mon, 15 Mar 2010 12:35:00 -0000

> Did you both use `pw-am.sh`?

I did.

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


