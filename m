Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RFYU9-0005S4-03
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Oct 2011 23:43:09 +0200
Received: by ywm39 with SMTP id 39so242443ywm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Oct 2011 14:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=jfGsQtJrE+1Fhxbsm9NZP83y8yHkAlWrBhDdRd8rDao=;
	b=wpkHzqW2V5ctZ/PXIhlDVfsJ03NziNxqHcLuNKN9ic+co2TSfBEW2ufnV9adqwy/6E
	oHKlExhm3YZ8iQqFX+AfUophNYwLOPZhdzRXW9J2Xkw5xIEvCl2dQw22c2017KmfQMHf
	nBZF0QZHA2wRldh9jJgY34X+ugBUBIEZ5+Bbk=
MIME-Version: 1.0
Received: by 10.236.165.102 with SMTP id d66mr23524256yhl.2.1318801040783;
	Sun, 16 Oct 2011 14:37:20 -0700 (PDT)
Received: by 10.147.124.18 with HTTP; Sun, 16 Oct 2011 14:37:20 -0700 (PDT)
In-Reply-To: <20111015185155.DA982101FE@opal>
References: <20111015185155.DA982101FE@opal>
Date: Sun, 16 Oct 2011 23:37:20 +0200
Message-ID: <CAAQYJAvm1mGo6sswMBPx+tgQfZapTqX4E1SXSsZKU25D-u1eDA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [oe-commits] Khem Raj : binutils-cross: Sync with oe-core
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
X-List-Received-Date: Sun, 16 Oct 2011 21:43:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Oct 15, 2011 at 8:51 PM, <git@git.openembedded.org> wrote:

> Module: meta-openembedded.git
> Branch: master
> Commit: 92b02b7209e426a70cc5626e7bdbc82052e01ac5
> URL:
> http://git.openembedded.org/?p=meta-openembedded.git&a=commit;h=92b02b7209e426a70cc5626e7bdbc82052e01ac5
>
> Author: Khem Raj <raj.khem@gmail.com>
> Date:   Sun Oct 16 01:28:32 2011 +0000
>
> binutils-cross: Sync with oe-core
>
> Now we have own copy of binutils-cross in meta-oe
>

I can't unfortunately find the discussion which supposedly provided a valid
reason for binutils-2.20 in meta-oe while binutils-2.21 is in oe-core.
I'm against that kind of policy for meta-oe, particularly when it's about
toolchain.

we need to sync with oe-core periodically
>
That's just one of the bad effects :/


>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>
>
my 2c

Andrea

