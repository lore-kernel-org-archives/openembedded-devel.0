Received: from [209.85.198.247] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1KHCiO-0001EJ-4a
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jul 2008 09:06:48 +0200
Received: by rv-out-0708.google.com with SMTP id f25so4344594rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2008 00:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:reply-to:to:cc
	:in-reply-to:references:content-type:date:message-id:mime-version
	:x-mailer:content-transfer-encoding;
	bh=giJIwWcTd73fXNzYmhpxVKfs8gWnl6UhkvJJlAO16EA=;
	b=W1kVpA9VKFXUFBsrnAcnvXY6hJ9ZpecuG5YCcXKDZ++KP0O8+Oq/LNQm/96XfShCSv
	B5N+2rPD2reHFZJzDjT9dYey7l3zYbm4Lns6orThgqlK/8sxgSBpxC1ABrSbdgp37NdX
	bSNWuNG9NH998XJDZPsoldXvxFCRvMcmvaHCU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:reply-to:to:cc:in-reply-to:references:content-type
	:date:message-id:mime-version:x-mailer:content-transfer-encoding;
	b=mMGUP7uJs/lgOs9AfwpS4DqkOfDEdVYZltN7OYvQ0aU1Jw6yslhQD7SGSG5KnE0+Bn
	8p8Fy3HPcqi4SSCcZIjlwvCk1pG7WhgPIU8PHvMxTAmAV8dCJwJO775C9Ls9X1bDI8bw
	eQK64Mc05v8QHU8CmJTtiF31tLrzUJVF+EDJ4=
Received: by 10.114.153.18 with SMTP id a18mr13250529wae.161.1215759990692;
	Fri, 11 Jul 2008 00:06:30 -0700 (PDT)
Received: from ?192.168.1.71? ( [71.146.10.255])
	by mx.google.com with ESMTPS id z20sm543925pod.11.2008.07.11.00.06.30
	(version=SSLv3 cipher=RC4-MD5); Fri, 11 Jul 2008 00:06:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4876A7DD.8090608@palm.com>
References: <48761569.4080304@gmx.net> <1215703284.32070.6.camel@isis>
	<4876A7DD.8090608@palm.com>
Date: Fri, 11 Jul 2008 00:06:29 -0700
Message-Id: <1215759989.6248.1.camel@isis>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.2 
Cc: "openembedded-devel@openembedded.org" <openembedded-devel@openembedded.org>
Subject: Re: bitbake man page typo
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Fri, 11 Jul 2008 07:06:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On Thu, 2008-07-10 at 17:22 -0700, Rich Pixley wrote:
> Index: bitbake.1
> ===================================================================
> --- bitbake.1    (revision 48512)
> +++ bitbake.1    (working copy)
> @@ -64,7 +64,7 @@
>  Specify task to execute. Note that this only executes the specified 
> task for
>  the providee and the packages it depends on, i.e. 'compile' does not 
> implicitly
>  call stage for the dependencies (IOW: use only if you know what you are 
> doing).
> -Depending on the base.bbclass a listtaks tasks is defined and will show
> +Depending on the base.bbclass a listtasks tasks is defined and will show
>  available tasks.
>  .TP
>  .B \-rFILE, \-\-read=FILE
> 

Still there is one more left. It should be ﻿'listtasks task'  I think.

Khem




