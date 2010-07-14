Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OYxxg-0003kq-Gk
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 11:09:22 +0200
Received: by bwz10 with SMTP id 10so4468211bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jul 2010 02:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=mSma1u17tTm3ubdCT1XDpquI/xkmp35oaZ2Qyh2ZokI=;
	b=jRHoxqCjmkY41zFltqVyj+Chf9puvXs2EUl9Ew4BETjqDwFPuDGCsYk243VVPF4gu/
	dhcwCi+NqIjr7UImEuZnntII0bTYrwVJt+TkkywS5iWtu8+E4RHfj9wfs59gGHt6KD45
	62EUlwsFDDBuKMNrEPFv6qPxJo9bFA7f5gIDk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=F9yPyN9+bOZbicDrcpdMoL3YEhuqs8dNUHEvMqtxG4xy20Sc1gm2rfFbaz3ILy6CO4
	IUYo04O9x7JlnRE44NH/0Faw8wpPiXj0kIZvMFdMXI5NUIVH76oszPYuRrGKIkbV4+vL
	jBmzkKGSzv536S+XmA3+4KV18Me77iFihA+EY=
MIME-Version: 1.0
Received: by 10.204.47.214 with SMTP id o22mr8580972bkf.17.1279098542883; Wed, 
	14 Jul 2010 02:09:02 -0700 (PDT)
Received: by 10.204.66.68 with HTTP; Wed, 14 Jul 2010 02:09:02 -0700 (PDT)
In-Reply-To: <1278849179-17002-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <AANLkTilGJjsqfz2zu4m3m5vQ99jCX44CrtFUSiRTpkE9@mail.gmail.com>
	<1278849179-17002-1-git-send-email-fransmeulenbroeks@gmail.com>
Date: Wed, 14 Jul 2010 11:09:02 +0200
Message-ID: <AANLkTimCeTdGIDznDv6NPf-q7dSUSYIEjQIZwrkdhkAT@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] glibc 2;5: cleaned up; patches only in local dir
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
X-List-Received-Date: Wed, 14 Jul 2010 09:09:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/11 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

> mved all patches to glibc-2.5
> removed references to other dirs.
>
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
>
> This is as discussed in the ML
>
> http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg07545.html
> If I get two acks for this I'll also create and submit patches for the
> other versions
> followed by a patch to remove the unused versions (as listed in the above
> thread).
> That is: barring  objections ofc.
>
> Have fun, Frans.
>
> Hi,

I didn't see any reply on this. Don't know how I should interpret that.
Is there just no interest in this ? That would be :-(
Do people agree and are there no comments (in that case could I have an
ack?)
Or do people disagree (then please speak up).

Frans

