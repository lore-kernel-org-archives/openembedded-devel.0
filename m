Received: from [209.85.198.245] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1KOcBt-0002dt-VI
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Jul 2008 19:43:54 +0200
Received: by rv-out-0708.google.com with SMTP id f25so797351rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jul 2008 10:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=+F2Ode0PSaOnriQKbyoEZWrcdCuiwlaN4kGjf/v/wwY=;
	b=i+XY2pX0h+flqQ+Ncvt1jUMMSK7s09U3eN9zYdMRbxZgKpNpZQPFViL4bNf77F9WZJ
	C/io+5Jk8VT9Ol5FGNEKBVFy71WHsP2JzTJJvA1qGO11ua3gfHKb5A68+1135Tv85o/b
	QX2p0UGYFDsgtkrTPT9XQM3XlV+AHwOA0gOdw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=u3WqX7horlLnK4A3/4D7iHUf72ALYzCvyONtglwSxXzTGAG8EV2jKF/heDvpRj1Jna
	SM8KROpNqzUqtDoLFSAEc88na2iB5qKCQJHOgFTG52EJcGhY/4goMxlW7OTM4GaqD3W4
	FQd8MJkcYMXGwQb3PZobdfrybQkr9qd1uav1c=
Received: by 10.114.158.1 with SMTP id g1mr10484523wae.111.1217526125983;
	Thu, 31 Jul 2008 10:42:05 -0700 (PDT)
Received: by 10.114.184.13 with HTTP; Thu, 31 Jul 2008 10:42:05 -0700 (PDT)
Message-ID: <f96d234e0807311042n9e3d1c1ifef0ac63461ea335@mail.gmail.com>
Date: Thu, 31 Jul 2008 13:42:05 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4891F352.60508@palm.com>
MIME-Version: 1.0
References: <1217340989.5482.10.camel@dax.rpnet.com>
	<87myjz34uv.fsf@neumann.lab.ossystems.com.br>
	<4890678A.5040005@balister.org>
	<1217428116.5510.26.camel@dax.rpnet.com>
	<489084EE.9070407@whitby.id.au>
	<1217434487.5510.64.camel@dax.rpnet.com>
	<f96d234e0807301006x5fc528b8kf9a762021a0024f5@mail.gmail.com>
	<4890A67A.9080209@palm.com> <48911FA9.5070809@dls.net>
	<4891F352.60508@palm.com>
Cc: "openembedded-devel@openembedded.org" <openembedded-devel@openembedded.org>
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
X-List-Received-Date: Thu, 31 Jul 2008 17:43:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jul 31, 2008 at 1:16 PM, K. Richard Pixley <rich.pixley@palm.com> wrote:

> I'm sure.  I was hoping for a bullet point executive summary.
>
> I like mtn, but I'm not about to even attempt to reopen the issue.  I'm just
> curious about what the deciding factors were.  And I suspect that the
> question will recur for some time.

From what I can gather from email threads, it comes down to:

- better support for branching and merging (this is where git shines)
- much faster
- much larger user base -- most people doing OE work are already using
git for kernel work (more people familiar)

I'm sure there are other reasons to switch and not to.  I'll add the
above list and links to maillist threads on:

http://wiki.openembedded.net/index.php/Git

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


