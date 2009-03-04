Received: from [209.85.218.165] (helo=mail-bw0-f165.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1LeuVP-0000mH-Vg
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Mar 2009 18:03:40 +0100
Received: by bwz9 with SMTP id 9so2903780bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Mar 2009 08:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=lmLa8CeQyVVuDObN0YWvcB5h3ryYwA/r986yY2XvOAw=;
	b=YJ3HPH87SmyDcD+MCQc+uMPnujCpz1G1so1B/aZRCZ+D0FDyCfZl97KAUbBBukv7ce
	37rkzNb3IX3TnESSzj8lPgKKhi2XMwkzel0wgFOM1I1MoMw2PCzmOP86O93vu9tMr0TI
	/J0q9atrilo2fNdU5fzXRPszHgJiVIWoLq1MA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=VRNlpG/r6gl+olAld+W3irzm9uBAd7SAgf4trOokwq1JHYkzAl4q24b7aDTEH0rX8w
	XVhMW3C/VffC1QGpSTO4UC7uVMCxLk66Qb+ihmNSU6ceXoBzcsdT8nPrKbGbKV2AgReG
	y3KpMmF7FLOt0K8citmxaMtYihPIn4UlSmLgM=
MIME-Version: 1.0
Received: by 10.181.208.11 with SMTP id k11mr18291bkq.180.1236185965159; Wed, 
	04 Mar 2009 08:59:25 -0800 (PST)
In-Reply-To: <EC5EE493B6046F45A2DDEC4A828DE52E039C6343@EXCHSRVR.syntech.org>
References: <EC5EE493B6046F45A2DDEC4A828DE52E039C6343@EXCHSRVR.syntech.org>
Date: Wed, 4 Mar 2009 18:59:25 +0200
Message-ID: <fce2a370903040859r1235924dg47344d9a02efff31@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Overlays and kernel question
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
X-List-Received-Date: Wed, 04 Mar 2009 17:03:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

You need full recipe copy, with all the patches, files, includes etc.

On Wed, Mar 4, 2009 at 6:55 PM, Mark Butsch
<mbutsch@syntech-fuelmaster.com> wrote:
> Hello,
>
>
>
> I am trying to place my .defconfig in my OE overlay and am not sure of
> the proper/best way to do that.
>
>
>
> Can I just have the .defconfig in the overlay or do I need a copy of the
> recipe in my overlay also?
>
>
>
> Thanks for the help,
>
>
>
> Mark Butsch
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


