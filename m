Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rcvengr2@gmail.com>) id 1QbIqR-00046W-UB
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Jun 2011 22:55:47 +0200
Received: by bwf20 with SMTP id 20so1847725bwf.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jun 2011 13:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=xeW6fBPDNzW86ichyU8deD4wgmR8D7Z59OhzS8960xs=;
	b=n8EmRJqnqJ6vE2SjbE6ZXjDMcCfM4/AFwwgzkRy0ga5UqPAMmNtTp+oUlCsvxhKSfC
	WduYYsL2EUIFNRARoLF50cLruf3APlItTDHesmTzpTZNawmoOTzqvSyLfVXim1DLuLxd
	3SbDaUQYWwSkae2gQtZzAWsHdpK/+jmfm43Yw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=iKz7wE/K7+9A6NFervY34GM6yoKiQbtVseFAPjuAuyqPAguG6jLzGK1T8ne+xgq74X
	Crz5yTBQj0lbTcMQXilN+/5Chnr5/TAxxRp2GeSZr30yYzNLkZjXf2GIaSVuzcMoibvG
	lQjXL5ocyh86W4J7pC/n2+AbmZjl5SHioif84=
Received: by 10.204.137.68 with SMTP id v4mr4862552bkt.115.1309207927114; Mon,
	27 Jun 2011 13:52:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.204.153.212 with HTTP; Mon, 27 Jun 2011 13:51:47 -0700 (PDT)
In-Reply-To: <1309207526.21379.150.camel@mattotaupa>
References: <BANLkTik1SX0BQ=rdoJorZN0UWcK1Mnn9Qg@mail.gmail.com>
	<1309207526.21379.150.camel@mattotaupa>
From: Bob Cvengros <rcvengr2@gmail.com>
Date: Mon, 27 Jun 2011 15:51:47 -0500
Message-ID: <BANLkTimV7HUXOKdL7MXy7=nUGu9YVjtc7g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: python-numpy cannot find libraries
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
X-List-Received-Date: Mon, 27 Jun 2011 20:55:48 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

I appreciate the help!

On Mon, Jun 27, 2011 at 3:45 PM, Paul Menzel <
paulepanter@users.sourceforge.net> wrote:

> Dear Bob,
>
>
> Am Montag, den 27.06.2011, 15:23 -0500 schrieb Bob Cvengros:
>
> > I am having a problem compiling python-numpy similar to that posted
> > here<
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-April/031840=
.html
> >,
> > however this issue does not appear to have been resolved.
>
> you are correct. Thank you for investigating and finding that message in
> the archive. I replied to Patrik and let us hope that he implemented a
> solution.
>
> [=85]
>
> > I wish I could fix it, but my technical skills are not up to the task. =
I
> > could use some help resolving the issue.
>
> As Patrik wrote, could you try to remove your host libraries?
>
>
> Thanks,
>
> Paul
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


--=20
University of Illinois at Urbana-Champaign
Electrical Engineering

rcvengr2@illinois.edu
(630) 306-4018

