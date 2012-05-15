Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SUHoF-0004vV-QY
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2012 15:29:03 +0200
Received: by qcso7 with SMTP id o7so4183576qcs.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2012 06:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=zR8Aiqg8/AMsBreCDr2yQm7iNGqu10kBJhioFhALW8o=;
	b=PDIHbGkNqxc5MAh8y/Knd4XYvPR0+pjQiePod3Jw4zuBZWbZX1dFftti50EMl7Mm1T
	x33LlwgaADa/UufCHenn2DJ7BtuT6/ext0xf/dyu3vLTcb6ix+EztkpBguA1IFLa3kCZ
	N2j/4LEC4OEWNz6Cnp1GSiasRtoAaCjAieaqLkChSFg9Zj34dhWoR5Lbr3LW7KF0OMox
	0VWj/EdZ7bxlHUnCW5Xfec4923aDTKktZHBRRIIIqezp5dPUSAwNZaM6sEuPcoJNd0WW
	+bWK0eZChGqXAi/bx08RCmv3wkA4xyDfcfriOsXpiHCpdo4aAmhAhH+LGSbF/3ypc46F
	8H0Q==
MIME-Version: 1.0
Received: by 10.50.207.38 with SMTP id lt6mr7041558igc.55.1337087943114; Tue,
	15 May 2012 06:19:03 -0700 (PDT)
Received: by 10.231.241.3 with HTTP; Tue, 15 May 2012 06:19:03 -0700 (PDT)
In-Reply-To: <4FB2575C.3070407@mlbassoc.com>
References: <CAOHjBZto_R5S777po-K8mXG-Z9XLYNVzE05-kq_TOCeo4YgyoQ@mail.gmail.com>
	<4FB2575C.3070407@mlbassoc.com>
Date: Tue, 15 May 2012 15:19:03 +0200
Message-ID: <CAOHjBZtfhFoZN=Hva3W_0yf7sRNS0xymrj1MHER9yHEeW=RHyw@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [oe-core] Packages broken URL
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
X-List-Received-Date: Tue, 15 May 2012 13:29:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

For example building git-1.7.7 fails fetching the source.



2012/5/15 Gary Thomas <gary@mlbassoc.com>

> On 2012-05-15 07:02, Giuseppe Condorelli wrote:
>
>> Hi All,
>>
>> there are a number of packages having a broken SRC_URI, for example git.
>> Has someone met this issue?
>> For sure we can correct those links adding a dedicated .bbappend file for
>> each failing package but
>> I think we could also update the main package fixing the errors.
>>
>
> Details?  People build using oe-core all the time, so providing
> more info on the problems _you_ are having would go a long way
> towards finding & fixing them.
>
> --
> ------------------------------**------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------**------------------------------
>
> ______________________________**_________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.**openembedded.org<Openembedded-devel@lists.openembedded.org>
> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-devel<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>
>

