Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T68Kj-0003Pb-Jn
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Aug 2012 01:03:01 +0200
Received: by eaad12 with SMTP id d12so1102579eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2012 15:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=/Qxf34DCsZQBvEZSGOH5CvifMUDLj6bBpb0mb6vYBfY=;
	b=diKmkvSaV7NXoiy3M8ATx8IFd1fY2WGSqI6QetNhVzknTkXLkgR+kNa+NdjJZArQ16
	jPnl9Pj39jk48/Fn/IsE3KgwLkRpcVClk5m/PuRF8hHvAiAbTafs/g1gQITuz2uUfZ+C
	ARKeH8KSwV6nvh9yi5x+Vu79hNrCUYehPm+73Sodz+1oDcofGqh0Jpv/LQCIuQPXIFSr
	c3NtEBNYn5JRTEtQ5K6DZbVCs8o6Ctvf+M6wTjt4fj6Cf1MqrFMqABURjZCv7LNNPTU/
	2LyU3cmfvnNGxnxXt3rExMYgPgzt8WWH0FWMX4EsOuJ7+TDEDh9gVP8jYPDGk3YFTlRF
	cSpw==
Received: by 10.14.204.72 with SMTP id g48mr19607117eeo.45.1346107849627; Mon,
	27 Aug 2012 15:50:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Mon, 27 Aug 2012 15:50:19 -0700 (PDT)
In-Reply-To: <20120827223935.GK24666@bill-the-cat>
References: <1345787825-9950-1-git-send-email-raj.khem@gmail.com>
	<20120827223935.GK24666@bill-the-cat>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Aug 2012 15:50:19 -0700
Message-ID: <CAMKF1sorD=Hm-YmE-OuWkUxRGmzUqrd6-D-RT4UVjqXKhHQtSA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance][PATCH 1/5] libwnck: Fix build without needing introspection-native
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
X-List-Received-Date: Mon, 27 Aug 2012 23:03:01 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 27, 2012 at 3:39 PM, Tom Rini <tom.rini@gmail.com> wrote:
> On Thu, Aug 23, 2012 at 10:57:01PM -0700, Khem Raj wrote:
>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> Along with the rest of the series, applied, thanks.

Thanks, I realised that I havent sent one last patch which I have sent
as a separate patch now. Please consider that one too.
>
> --
> Tom
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


