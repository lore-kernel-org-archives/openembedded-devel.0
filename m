Received: from [209.85.198.249] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1KOJMC-0004b3-My
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jul 2008 23:37:16 +0200
Received: by rv-out-0708.google.com with SMTP id f25so240435rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2008 14:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=HhVm5AT43+tRHcMsN022CEBaHG+Z3CN6yIIek5LgUlw=;
	b=N48n5x9gewqQ6OoLRpbSkO2dysMflbcV032PAKgiFKM5A0NMNYdgTdkQn+4k8tU/Ho
	J1SKuUWZ5Lfl7d3BoLk++tROutVjPph9VSV4wzSJuBZ0PPXZStgOd6ubi5uz1+fx5pNW
	YKPejVDQ+GNb9b94q4piYqSzZQwzTFHjl3arw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=xeEHWQgep3gqSlg14S3pqIjjVO6lZcSBUn6BrPu/lhLyfShOplMJK/QrSEeBU4dagy
	ZVn7NPBzv6LRA4L53kiMwWkQdYnGbATC3SJU1G1WPuXh4NqBrZnQZLKsJfNEc9px6EGQ
	sb/2iaAjJSZFkyEr6hoTX3BWGpD9VZIryp+Bk=
Received: by 10.141.193.1 with SMTP id v1mr4870106rvp.245.1217453732431;
	Wed, 30 Jul 2008 14:35:32 -0700 (PDT)
Received: by 10.141.116.18 with HTTP; Wed, 30 Jul 2008 14:35:32 -0700 (PDT)
Message-ID: <d2b9ea600807301435l61cc91e3sadba66912bd45e3a@mail.gmail.com>
Date: Wed, 30 Jul 2008 23:35:32 +0200
From: "Esben Haabendal" <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1217428116.5510.26.camel@dax.rpnet.com>
MIME-Version: 1.0
References: <1217340989.5482.10.camel@dax.rpnet.com>
	<488FAE77.7050107@whitby.id.au>
	<200807300920.37221.openembedded@haerwu.biz>
	<f96d234e0807300429j2fff8df0oc494e4a5beb9f8ff@mail.gmail.com>
	<87myjz34uv.fsf@neumann.lab.ossystems.com.br>
	<4890678A.5040005@balister.org>
	<1217428116.5510.26.camel@dax.rpnet.com>
Subject: Re: Git Migration Status
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
X-List-Received-Date: Wed, 30 Jul 2008 21:37:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Jul 30, 2008 at 4:28 PM, Richard Purdie <rpurdie@rpsys.net> wrote:

> Also, "the kernel does this, why can't we" is a totally bogus argument:
>
> 1. If the kernel jumped off a cliff, would you too?
> 2. The kernel uses a pull model for development and people check IDs for
> some sanity before pulling. With the push model we're going for we don't
> have that luxury.

This raises another question I have been wondering. Does this push model
fit OE better than pull?
The pull model seems to work nicely for the Linux kernel, and as I see it, has
the advantage that the "infrastructure" adapts automagically to the needs of
the developers/community.

I am just wondering...

/Esben


