Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SU2v8-0005So-VX
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 23:35:11 +0200
Received: by eaal1 with SMTP id l1so1655031eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 14:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=5Uri/9lWehJ0DArZMoqApDsKe+QsVBvOI0q64A+fQNM=;
	b=IqeXvUgEjXawusxnMibADIFK0mg2lKN8KY0/ScrnT6JmN5zZUXhGJWb4wR5g5cqyEx
	lGkCFNwjm+nBmxywfFuA1FegSbcq9GRUuuEIljrbkB85r2UxODgTLZ9mnOZN0RtYdAPs
	x6ENbXU2DF+Q4TROWAJ06WtL2M0vvaM7SgB/0X2ZUCmxdagaDFMzNppeSunl4dLImnvU
	kOK17b5RdAjU6Ue5DWynFd4t8jlfFzagLr/Qrj93JqjQ1Ah5KkSD4bmDEbr15d/zCEmS
	z17OK0htXw+WmMUU24aGUo+RKpw4LzFnmA2yS8MNo6WiocXQmIJ89pjG2FpChcLzSiW1
	uUCg==
Received: by 10.213.20.200 with SMTP id g8mr1810910ebb.103.1337030711616; Mon,
	14 May 2012 14:25:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Mon, 14 May 2012 14:24:41 -0700 (PDT)
In-Reply-To: <4FB0F450.7050404@gmail.com>
References: <4FB0F450.7050404@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 May 2012 14:24:41 -0700
Message-ID: <CAMKF1spY7bTJYzxHhmrvpGurZTDgciQOC0vFPT5HnvbOEFOdeQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: License attributions for a system built with OpenEmbedded.
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
X-List-Received-Date: Mon, 14 May 2012 21:35:11 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 14, 2012 at 5:02 AM, Tasslehoff Kjappfot
<tasskjapp@gmail.com> wrote:
> Hi.
>
> I have made a rootfs and an SDK with OE-classic. We use the SDK to
> compile our own application, which links dynamically with some open
> source libraries.
>
> I have listed the LGPL libraries our application uses and linked to
> http://www.gnu.org/licenses/lgpl.txt, but I don't know how/if to
> attribute OpenEmbedded. Should I include attributions for every single
> open source software in the rootfs+SDK, or is it sufficient to say that
> I have compiled them using OpenEmbedded?

most part of OE metadata are MIT licensed some parts may be GPL

well while booting you could use OE splash screen instead of your company one :)


>
> - Tasslehoff
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


