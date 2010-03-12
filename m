Received: from mail-iw0-f184.google.com ([209.85.223.184])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NpsdT-0003UB-Jt
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Mar 2010 01:22:00 +0100
Received: by iwn14 with SMTP id 14so687544iwn.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Mar 2010 16:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=McOKBWm+AbiXKgvlnEQL/fNbbP8bV44jLWQM0w8p20w=;
	b=gTcBD1fZgnwgZW6bQH0He1cCbEJMI+9ZLQ4QRULRx1a31vozCwjk0EkqQDqLSI55Zn
	oMYAZtUy8x3p3RDbmGa5ywSNkB27DGUyi6cttO1zVhPr/IIhugKbGGxgSyI4QD9Hitzt
	cfPBGVblhwSZCYMIKv6wnvMkQhwz+J8h9sws0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=IMs3q5d7oycIFkr3hd9UdSFIDkJ2vV8luqnYUr7IHXQKrJHjhJkBiZ9iWcwuVzxKGu
	al9yOdJcKEMUBhHHjkuh0vQ8dbqvIMEwQJUxy+h5vzbuJqBnzTvRZ0ETLI5znMt6EnvV
	qfMCDj7edDm97/OnbWOocH/baAWas/egkjVO0=
MIME-Version: 1.0
Received: by 10.231.167.4 with SMTP id o4mr174709iby.66.1268353132357; Thu, 11 
	Mar 2010 16:18:52 -0800 (PST)
In-Reply-To: <4B99791E.1020102@zenlinux.com>
References: <4B99791E.1020102@zenlinux.com>
Date: Thu, 11 Mar 2010 16:18:52 -0800
Message-ID: <19c1b8a91003111618u5db39b2ft1b614484f5814442@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.184
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH/RFC] zlib: convert to BBCLASSEXTEND
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
X-List-Received-Date: Fri, 12 Mar 2010 00:22:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Mar 11, 2010 at 3:13 PM, Scott Garman <sgarman@zenlinux.com> wrote:
> Hi all,
>
> Attached is my first OE patch submission, to convert the zlib recipe to use
> BBCLASSEXTEND and cleanup the do_stage() task.
>
> I would like to start making regular contributions to OE, and am starting
> with the basics. Any guidance from the more experienced folks is gratefully
> accepted.

Thanks for the patch. While this change looks ok. You should submit a full patch
where you also delete the unneeded recipes and with proper sign-off

http://wiki.openembedded.net/index.php/Commit_Policy
http://wiki.openembedded.net/index.php/Commit_log_example

might help

and also formatting patch with git format-patch would be nice.

Thanks

-Khem

>
> Scott
>
> --
> Scott Garman
> sgarman at zenlinux dot com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


