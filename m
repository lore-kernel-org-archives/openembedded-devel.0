Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RzwJ4-0005ky-4K
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Feb 2012 21:27:26 +0100
Received: by lahc1 with SMTP id c1so8210668lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2012 12:19:06 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.112.47.225 as permitted sender) client-ip=10.112.47.225; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.112.47.225 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.112.47.225])
	by 10.112.47.225 with SMTP id g1mr10127291lbn.52.1329855546560
	(num_hops = 1); Tue, 21 Feb 2012 12:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=UuVhVsord34CsCx5BWO4DUALODU+YaWlLNcMSp2PWes=;
	b=AHQMbNKEYjc9Zaq8jtovgZDa4d+d1uJzMrG21vjHfSyXy2LUx823u8zJE+xZX75PZN
	FDtXOkoHe7udk48jwosxecUhBqxzKlktVO6lhJcVylvZe457Hph+gRfasVPE3CMaDVfm
	/3favCdOUcZnF61piDdOdicTifHH6v1Mc61/E=
Received: by 10.112.47.225 with SMTP id g1mr8481612lbn.52.1329855546471; Tue,
	21 Feb 2012 12:19:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.27.109 with HTTP; Tue, 21 Feb 2012 12:18:36 -0800 (PST)
In-Reply-To: <CAC1BbcT8wRZE_-FNAP-YAQvpU_j9ygGLWYcMnb+M8szKOFeMWQ@mail.gmail.com>
References: <CAC1BbcT8wRZE_-FNAP-YAQvpU_j9ygGLWYcMnb+M8szKOFeMWQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Feb 2012 12:18:36 -0800
Message-ID: <CAMKF1sohbi+_-_yERWzMRgyAc9M5-jNbQi75DLFqmc7eX+XOdA@mail.gmail.com>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: DISTRO_FEATURE pthread(s) ?
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
X-List-Received-Date: Tue, 21 Feb 2012 20:27:27 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 21, 2012 at 11:01 AM, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> Hi,
>
> http://sourceware.org/bugzilla/show_bug.cgi?id=9657
>
> Prompts me to question if I can command this with OE ATM?

OE defaults are to use threads. I dont know anyone who would have
tried threadless builds


