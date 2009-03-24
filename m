Received: from [74.125.44.153] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Lm8gK-000891-DA
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Mar 2009 16:36:48 +0100
Received: by yx-out-1718.google.com with SMTP id 3so1787793yxi.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2009 08:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=IuHgwWJNFCvnmQ1r/WQAVDfdB8v8jBHiL1dRI3/qtBo=;
	b=l2Uu2ZxltuywOtRAtJGLI8R4WBPGpb69haK4Td4uRPppimC7LWXZoRC3NfR7AGUDDJ
	OoBGx0yzK1lm8Z6pBzgFBc4Yx4oFx6B0odl8Yyefr91cqtORLjEhllgt2KxCkBnPeNwU
	y1xcoG0i4dUKBQwWJBY2JnRbkRpG85E9CKvm0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=VASv9a4DpusvFtQB49oz4sZAMf3YYEGQryPzP5VMGH140NBXgTEeEHZwLp7cOwxW+/
	oaZxgKMB0C+1wYCa4o6J9boJKenTT4sndSocf8DHZzQafTtpB7ER/o1X8qQf7I905ibg
	3vUnRHF9E4T+r+Jgr8e0qhFfS9oFCS1M1ryes=
MIME-Version: 1.0
Received: by 10.151.43.19 with SMTP id v19mr14552470ybj.153.1237908915101; 
	Tue, 24 Mar 2009 08:35:15 -0700 (PDT)
In-Reply-To: <200903191917.09270.mickey@vanille-media.de>
References: <alpine.DEB.1.00.0903191053260.9107@localhost.localdomain>
	<200903191917.09270.mickey@vanille-media.de>
Date: Tue, 24 Mar 2009 11:35:15 -0400
Message-ID: <f96d234e0903240835t3e137280ub7420726d721f180@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] local.conf.sample: Replace packages/ with recipes/.
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
X-List-Received-Date: Tue, 24 Mar 2009 15:36:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Thu, Mar 19, 2009 at 2:17 PM, Michael 'Mickey' Lauer
<mickey@vanille-media.de> wrote:
> Theodore,
>
> your patches seem sane. Would you be interested in commit access?

+1

-- 
=======================
Cliff Brake
http://bec-systems.com


