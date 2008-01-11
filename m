Received: from [209.85.132.247] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JDRmS-0001u6-Uf
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jan 2008 22:51:13 +0100
Received: by an-out-0708.google.com with SMTP id b33so271602ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jan 2008 13:50:58 -0800 (PST)
Received: by 10.100.228.17 with SMTP id a17mr7629331anh.7.1200081916144;
	Fri, 11 Jan 2008 12:05:16 -0800 (PST)
Received: by 10.100.190.7 with HTTP; Fri, 11 Jan 2008 12:05:16 -0800 (PST)
Message-ID: <c384c5ea0801111205k78452cebl8a8c65fea89df706@mail.gmail.com>
Date: Fri, 11 Jan 2008 21:05:16 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1012499733.20080111205302@vanille-media.de>
MIME-Version: 1.0
References: <4785F736.5050707@student.utwente.nl>
	<200801101221.53018.zecke@selfish.org>
	<478605A1.5030209@student.utwente.nl> <478606DB.7060501@balister.org>
	<c384c5ea0801111024x6ff82825g1273e20694d95794@mail.gmail.com>
	<1012499733.20080111205302@vanille-media.de>
Subject: Re: a5c7b007eaa675cc904f5285291d2f8a597efc84
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Jan 2008 21:51:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On Jan 11, 2008 8:53 PM, Michael 'Mickey' Lauer <mickey@vanille-media.de> wrote:
> Leon Woestenberg wrote:
> > Hello,
>
> > On Jan 10, 2008 12:51 PM, Philip Balister <philip@balister.org> wrote:
> >> I have gfortran installed already (must be the engineer in me) and I
> >> also had to add the ugly hack in bug 3363.
> >>
> >> Koen is right, there is something funny going on.
> >>
> > Yup.
>
> > Why don't we revert the changes then?
>
> I have reverted the change to sanity.bbclass.
>
> > Temporarely raising the host requirements is not a nice work around.
>
> Agreed. Folks, please try to fix it differently.
>
Mickey just reverted the hard requirement. Thanks.

It's not that I do not value the effort for Fortran stuff being added,
but we know that if we don't do stuff properly from the beginning, it
will bite us in the end.

Especially so with the toolchains. They are hard enough to do properly already.

Regards,
-- 
Leon


