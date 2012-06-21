Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Shmqk-0006mE-Q9
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jun 2012 21:15:26 +0200
Received: by ggnp4 with SMTP id p4so775622ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2012 12:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=YWshW728oUvWn5GKgYy3h08KsAsXAsFhvXLc503pkE8=;
	b=S1b5PoIfC3F8tt3XE1mALX7MDsBqAjY9gvCojNnZ7KVDMfjPbKrvnJ4D3YcLvDaFlT
	dU6JPwn3jMv8RddciEWnranNeXP+Clj8lknuwZ13IsiBuotqZW3K3kH8MVF2ev0ZTGBm
	ef/REcIwQfX//O0DpYZP/5KwsVEYAD2EjqkV0Zw4WHi31rLbDydOCUhcqA4S3zGOGFaJ
	9nBsktaFc8mz1W8ZvD+LJHvubGe5s4CpsbwPlm5x+cBZPno+38rJVtqxGmu6n5JSoptY
	fhC6fmOEM+bw6KjRsK01maGVs3hbPBw+sXfJXElfkBQROUYV/fCKIOTSEOIZoj3OjMZF
	d6fQ==
MIME-Version: 1.0
Received: by 10.50.192.170 with SMTP id hh10mr8744645igc.36.1340305479863;
	Thu, 21 Jun 2012 12:04:39 -0700 (PDT)
Received: by 10.64.9.165 with HTTP; Thu, 21 Jun 2012 12:04:39 -0700 (PDT)
In-Reply-To: <CALbNGRTMYfuL7YFCp=RG3cCzkVEuE6cbv00yFqioN4AH0UsMfQ@mail.gmail.com>
References: <1339364820-2880-23-git-send-email-schnitzeltony@googlemail.com>
	<1340264126-29651-1-git-send-email-Martin.Jansa@gmail.com>
	<jrvngo$vv$2@dough.gmane.org> <20120621181047.GF9352@jama.jama.net>
	<CALbNGRTMYfuL7YFCp=RG3cCzkVEuE6cbv00yFqioN4AH0UsMfQ@mail.gmail.com>
Date: Thu, 21 Jun 2012 21:04:39 +0200
Message-ID: <CALbNGRStmYpig0bFx3-+zejg6K3pSxv07BFcsjvxON5BzTeBDQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC, meta-oe 22/27 v2] xserver-nodm-init: move systemd support to meta-systemd
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
X-List-Received-Date: Thu, 21 Jun 2012 19:15:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 21, 2012 at 8:30 PM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> On Thu, Jun 21, 2012 at 8:10 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>> Andreas said off list
> unintended - sorry
>> that he plans to send v2 of whole patchset (there will be small change f=
rom gpsd too).
> Did I miss something here?
6ba88f7ad957bf2f6fb4527f77697429f7d98a52 got it :)
>> Andreas: do you want me to send v3
>> or will you fix SOBs yourself?
> No need for V3.
>
> By the way: before I rebase this series: Are there patches around for
> latest oe-core updates ( at least connman was updated ).
>
> Andreas


