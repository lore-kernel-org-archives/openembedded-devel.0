Received: from [64.233.184.233] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lvcargnini@gmail.com>) id 1HvHvs-0005jC-1B
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jun 2007 21:09:36 +0200
Received: by wr-out-0506.google.com with SMTP id i20so852930wra
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jun 2007 12:07:25 -0700 (PDT)
Received: by 10.100.134.2 with SMTP id h2mr2769736and.1180984044813;
	Mon, 04 Jun 2007 12:07:24 -0700 (PDT)
Received: by 10.100.38.6 with HTTP; Mon, 4 Jun 2007 12:07:24 -0700 (PDT)
Message-ID: <ae36f8040706041207r747f928fsdd563a4d6f44f3e3@mail.gmail.com>
Date: Mon, 4 Jun 2007 16:07:24 -0300
From: "=?ISO-8859-1?Q?Lu=EDs_Cargnini?=" <lvcargnini@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <466413E9.10707@balister.org>
MIME-Version: 1.0
References: <ae36f8040706040616y6de8ab01hb8699de1fbd239b2@mail.gmail.com>
	<466413E9.10707@balister.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: target os of angstrom
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
X-List-Received-Date: Mon, 04 Jun 2007 19:09:36 -0000
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

my ARM core (OMAP ) is little endian

On 6/4/07, Philip Balister <philip@balister.org> wrote:
>
> Is there a particular reason you need little-endian? Does this make it
> easier to communicate with the DSP?
>
> Philip
>
> Lu=EDs Cargnini wrote:
> > please how to set the angstrom distro not to
> > TARGET_OS      =3D "linux-gnueabi"
> >
> > but to
> > TARGET_OS      =3D "linux-gnu"
> >
> > according to distro this is set to eabi (big-endian) and i need
> > little-endian
> >
> >
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
>


--=20
---------------------------------------------------------------------------=
---
Thanks && Regards
Msc. Bsc. Lu=EDs Vit=F3rio Cargnini
IEEE Member
Electrical Engineer Faculty @ PUCRS
Ipiranga Avenue, 6681 =96 Building 30
P.O. Box: 90619-900 =96 Porto Alegre/RS
Phone: +55 51 3320 3500  extension: 7696
---------------------------------------------------------------------------=
------

