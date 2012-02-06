Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>)
	id 1RuYZQ-0000xu-O4; Tue, 07 Feb 2012 01:06:05 +0100
Received: by eekd41 with SMTP id d41so2004647eek.6
	for <multiple recipients>; Mon, 06 Feb 2012 15:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=VgOgQvx2Yrp8rJcv94p/rYfk3DIAufL6eFn8+7oLF1U=;
	b=LXJ9n28+FbdlDTIfpeIeguX+8LI51rcrEpGgkYlAL8e/vh7yJUTB0p3cyfhosNdIYU
	YTa2tHKYJYimMVBbPKCwlljSeFLbFG0LWvaQ8wOjtTQaJqiRzc0l+14j5n10eRIY4rUh
	JAzTg7W6o7NKVDrV81AG9wcJz8Mvv6nuxajgk=
MIME-Version: 1.0
Received: by 10.14.52.17 with SMTP id d17mr6120637eec.56.1328572681900; Mon,
	06 Feb 2012 15:58:01 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Mon, 6 Feb 2012 15:58:01 -0800 (PST)
In-Reply-To: <CA+YB3rZD5QS=aVtAiA_Jiqqfu4Pg3G6ojF=o2iYN4b1r3ZOXvw@mail.gmail.com>
References: <CA+YB3rZD5QS=aVtAiA_Jiqqfu4Pg3G6ojF=o2iYN4b1r3ZOXvw@mail.gmail.com>
Date: Mon, 6 Feb 2012 21:58:01 -0200
X-Google-Sender-Auth: moLH6DLWk33Xx4vZSvjkfn0IojM
Message-ID: <CAP9ODKrHEwrq_29ZGDXjykwF8MSf4M_2XP=x+k3Q5nz-SfwAfQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: tsc <tsc@lists.openembedded.org>, openembedded-devel@lists.openembedded.org
Subject: Re: [OE-core] OE TSC Minutes: 30 January 2012
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
X-List-Received-Date: Tue, 07 Feb 2012 00:06:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 6, 2012 at 21:47, Jeff Osier-Mixon <jefro@jefro.net> wrote:

> ...
>
  d. gitpkgv.bbclass merge
>       good functionality, needs some work to be accepted
>

As this has been cited I'd like to reiterate that I intend to work on
refactoring later but would like to git it as is for now into OE-core as
other layers wants to use it (meta-ti is one). I don't have the need time
to learn bitbake fetcher2 code to work on the refactoring right now,
besides adding it on fetcher2 means needing to wait to a newer bitbake
release to use it in OE-core thus more delay for it to be usable by layers.

Cheers,

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

