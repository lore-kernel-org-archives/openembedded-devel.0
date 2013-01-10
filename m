Received: from mail-vb0-f45.google.com ([209.85.212.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fahad.usman@gmail.com>) id 1TtPVu-0002T6-TK
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 22:18:15 +0100
Received: by mail-vb0-f45.google.com with SMTP id p1so792391vbi.32
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2013 13:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=6sJymTI4hxJfpA8mBmzTy8kmy5yfKB49oKI4u+yph5c=;
	b=OnUvye645lMs1T01v7J/s8tlxr7QV/2Yw2t8Lu+/SK55K651uYNmDUzope2rbSTER/
	B4TzN4fHqoCPvRv7Z8c/5ihDfihnfpQXlZ5VnXZz6WsnqB8sUxC1OuaMV13mOMHBfIsl
	9YYJEQbW2isBRahNb+iGnM+6fTePexWZ8gUAWubb9rnCruvFWBmhJy9DGIGcEWrf2cOI
	62FRFkp+XNBa3ziLZmLFxp7BtL3aDt42nzZUo8EEbnewgzqeRNtmf30mc3WdyiBh99LF
	UkDKY5nAJneAUxz3Js2pkPgtX+f1iL3j1qoZl/Vw7q9Ogd54J4dTJclPfmT3I4eXPD6u
	knwQ==
MIME-Version: 1.0
Received: by 10.220.155.143 with SMTP id s15mr3430031vcw.35.1357851780260;
	Thu, 10 Jan 2013 13:03:00 -0800 (PST)
Sender: fahad.usman@gmail.com
Received: by 10.52.155.176 with HTTP; Thu, 10 Jan 2013 13:03:00 -0800 (PST)
Received: by 10.52.155.176 with HTTP; Thu, 10 Jan 2013 13:03:00 -0800 (PST)
In-Reply-To: <20130110173023.7cafe23b@e6520eb>
References: <1357834959-9937-1-git-send-email-fahad_usman@mentor.com>
	<1357834959-9937-2-git-send-email-fahad_usman@mentor.com>
	<20130110173023.7cafe23b@e6520eb>
Date: Fri, 11 Jan 2013 02:03:00 +0500
X-Google-Sender-Auth: 2aUsNI2a0w5erFYNG1_92D4qaHk
Message-ID: <CAHVMiV9PbAUbY7=Xeh=RZD0oWVOq6MR8=NwJAtjNoLpUh+QMRg@mail.gmail.com>
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-browser][PATCH 2/2] chromium: fix dependencies
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
X-List-Received-Date: Thu, 10 Jan 2013 21:18:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Eric
I have tested these patches with freescale imx6 sabrelite target.

Fahad

On Jan 10, 2013 9:31 PM, "Eric B=E9nard" <eric@eukrea.com> wrote:
>
> Hi Fahad,
>
> Le Thu, 10 Jan 2013 21:22:39 +0500,
> Fahad Usman <fahad_usman@mentor.com> a =E9crit :
>
> > * fix dependencies to build chromium package successfully with current
state
> >   of OE
> >
> OK so we need to create a danny branch and apply this one only on
> master.
>
> May you please tell for which targets you tested chromium with these
> patches ?
>
> Thanks
> Eric
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

