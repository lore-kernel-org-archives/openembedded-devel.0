Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <leon.woestenberg@gmail.com>) id 1PxF29-0008Dd-GV
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Mar 2011 09:46:17 +0100
Received: by fxm8 with SMTP id 8so250934fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Mar 2011 00:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=1RbCJGQoJyQL5zZH2+Qx4VwAFYgQChcMjL2WfIQun0A=;
	b=BbqYyXT+z1COsMyIqjkRkD4+4R6XvUJM1XUMk1jXFPxZB86JiI+FizXgQbo4u1L79d
	5NZUvHoj1f/tEGHrgrnG3KqGZfKGXyD8ztTeoR/I4Zoa4FOFAOzHDU/wf+tqrNEnzZSQ
	kT3T3NOYcCBoDHt7TslaAJwmFzkCiIBDePbjg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=l+CYVH0jdLAjDvNZo9wb7AUVpyr3Ttp5xKY5F9dtea9ojcOwIJonoUjzT7xY6Jljs+
	2DErI0eWkCi1ZsKWGMwnB8/ug/6GQ+jj+z5C9u41LyLIxNTCuYzX47I8xgupdBws2yP8
	W/g91z8dQGWx70apLpex+yoDAaOXOJ8Kw3zK0=
MIME-Version: 1.0
Received: by 10.223.54.213 with SMTP id r21mr5351518fag.54.1299660282567; Wed,
	09 Mar 2011 00:44:42 -0800 (PST)
Received: by 10.223.156.193 with HTTP; Wed, 9 Mar 2011 00:44:42 -0800 (PST)
In-Reply-To: <4D773276.1040907@nedap.com>
References: <4D773276.1040907@nedap.com>
Date: Wed, 9 Mar 2011 09:44:42 +0100
Message-ID: <AANLkTinccRRrmRgcLkf0=cP_eA4Grm2HyyWrDPbT-CFw@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: release-2011.3
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
X-List-Received-Date: Wed, 09 Mar 2011 08:46:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Jaap,

On Wed, Mar 9, 2011 at 8:55 AM, Jaap de Jong <jaap.dejong@nedap.com> wrote:
> If I use DISTRO=angstrom-2010.x and start a complete new fresh build, I get
>
Seems like a different bitbake must be used. You better start from the
Angstrom web site Getting Started notes as that's the only place where
this is up-to-date.

There are different requirements to all the different releases. Also
note the heads up for the newest Angstrom to use the oe-core approach.

Regards,
-- 
Leon


