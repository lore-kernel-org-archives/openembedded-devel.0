Received: from [209.85.160.53] (helo=mail-pw0-f53.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rk.raggit@gmail.com>) id 1N2MmG-0007jz-3v
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Oct 2009 11:26:19 +0100
Received: by pwi18 with SMTP id 18so3245780pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2009 03:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=JyShBTmQvwnLsKajk7A8gCSjgni8CV8eeaHTerZF7wA=;
	b=NROu4EMmV3ztGJKdMXvW/Teqj3UhvUqVvwZsbz0J3SH3nIAKt2GBhP15f2u31m+q8T
	q3qGMS9P5d3CJUgyR+bvbzpT0qa5lkaAGjuVgfyR/g6F0tEs56upuq2SPLZl7JNwIBwb
	muy26DpDxdT+/Ng0+u72unMy2pwROsq760MEY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=JFUXcBIyf0BANeR49iyq4OXmlFYC+yVMdIlq7Tphmms1ts9cotaH3YuLOk/dWg3O9E
	ENkhEPT+CcfBT+ZlnntAU+P3g5ytkQhulxzTwdkz0OVv+IvFKfk2UYx4cNSLZlpcDbVB
	HkpybQdEuVQde2ZCEQMEJOJnIKVQTYFDxfZ7I=
MIME-Version: 1.0
Received: by 10.141.42.17 with SMTP id u17mr2001806rvj.85.1256552709718; Mon, 
	26 Oct 2009 03:25:09 -0700 (PDT)
In-Reply-To: <ec1f3d400910230421r4509e19amc899870bdd640ce5@mail.gmail.com>
References: <ec1f3d400910230421r4509e19amc899870bdd640ce5@mail.gmail.com>
Date: Mon, 26 Oct 2009 15:55:09 +0530
Message-ID: <ec1f3d400910260325i54971290u914ff2c0a6ca301d@mail.gmail.com>
From: RK Raggit <rk.raggit@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: rk.raggit@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [help] openembedded tarball sources on HTTP
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
X-List-Received-Date: Mon, 26 Oct 2009 10:26:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

anyone with some idea on this .. ? sorry for pushing , but i am kind of
evaluating OE and would like to know whether this is possible at all ?

...unblocking cvs,svn ports is defnitely not an option for me.

--RK

On Fri, Oct 23, 2009 at 4:51 PM, RK Raggit <rk.raggit@gmail.com> wrote:

> Hi there,
>
> I am building openembedded recipes but i am behind a proxy that only allows
> http accesses and blocks cvs,svn ports.
>
> I would like to know where i can obtain pristine OE package (tarball)
> sources from a HTTP link. I tried
>
> http://oesources.org/source/current
>
> ...but that link does not work. Could someone please guide me the correct
> link ? I will update my CVS_TARBALL_STASH
> variable with this link.
>
> Thanks
> RK
>
>
>

