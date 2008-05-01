Received: from [66.249.82.239] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <papercrane@gmail.com>) id 1JrhEf-0006vY-8U
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 May 2008 00:26:41 +0200
Received: by wx-out-0506.google.com with SMTP id h27so1261864wxd.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 May 2008 15:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:reply-to:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=l2Fc3r4Y3s9EQomk5f3Rz1BUTkOxyyp2hjTI9B2SAPs=;
	b=t4QpzRqBaBZnjXLD3TS4zlVjRxVzhWR+ddyaXPldZf7ahGr3l+KI1VUXhvcLCHXZ+cajVwUZD4waL4lEAZUh089n8IzroleUhxvO4LwiDVTv02YMHFvCJH3sL+qFxDW3DjI2VRE0vnbBsQLpysAfEQK2xQrWiOd8wTe9li8nX2Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:reply-to:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=BBgIR8SyB/uKoFQMhXzBDjj1Y/xUzCO+FrTaitfdF8BOMJQQyhM6gdqL6Y7fNEkzmCEv/D3dNCavfl1Ztygb8Ncr5mdHnB5cr4QV0Xh5sqnMIYZJc3zeOCemRnm9Q1eDRLVUaN74LzVFvefA3TbpFjq3KUh2Cy+EzRZeCcRO1RY=
Received: by 10.90.84.17 with SMTP id h17mr3580292agb.96.1209680764491;
	Thu, 01 May 2008 15:26:04 -0700 (PDT)
Received: by 10.90.95.14 with HTTP; Thu, 1 May 2008 15:26:04 -0700 (PDT)
Message-ID: <432beae0805011526t12b05cbav9df7bc0be86c3a1b@mail.gmail.com>
Date: Thu, 1 May 2008 15:26:04 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200804291554.02863.mickey@vanille-media.de>
MIME-Version: 1.0
References: <200804281344.32507.zecke@selfish.org>
	<48170F3C.7040409@balister.org>
	<c384c5ea0804290643p709b6b18qdf9581ffd744e5f7@mail.gmail.com>
	<200804291554.02863.mickey@vanille-media.de>
Subject: Re: Summary of an unwanted merge and what I did
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Thu, 01 May 2008 22:26:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Apr 29, 2008 at 6:54 AM, Michael 'Mickey' Lauer
<mickey@vanille-media.de> wrote:
> On Tuesday 29 April 2008 15:43:32 Leon Woestenberg wrote:
>  > On Tue, Apr 29, 2008 at 2:06 PM, Philip Balister <philip@balister.org>
>  wrote:
>  > >  Then there is the school of thought that we should just make everyone
>  > > unhappy and use Visual Source Safe or ClearCase.
>  >
>  > And then, the vice versa approach:
>  >
>  > Did we reach agreement that the move to GIT or Hg will make us happy,
>  > regardless of which one?
>
>  At the risk of being flamed, I will step forward and say:
>
>  Yes. I'm seeing an overwhelming majority supporting a move to git or hg, with
>  a strong tend towards git. At the moment, we are working on test
>  installations to see how that would fit into our workflow.
>
>  The days of us solely using monotone are counted. As opposed to last time
>  though, this time we do and will not rush it.
>

At the risk of being flamed myself I'll ask what many aeem to assume
to be obvious: What does git or hg give OE over monotone? Admittedly
the annoyance of the OP is genuine but that a new feature doesn't
quite work as expected doesn't seem like a reason to switch to me.

-- 
Justin Patrin


