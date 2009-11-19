Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ricardo.salveti@openbossa.org>) id 1NB7Qj-0002mZ-TT
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 14:52:16 +0100
Received: by bwz9 with SMTP id 9so2299105bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2009 05:50:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.204.152.151 with SMTP id g23mr3619797bkw.148.1258638648574; 
	Thu, 19 Nov 2009 05:50:48 -0800 (PST)
In-Reply-To: <1258637832.23826.88.camel@mill.internal.reciva.com>
References: <B44D4D5BF344094DABB900C4E0F6E3533945A36F15@srv02.nortechonline.net>
	<1258637832.23826.88.camel@mill.internal.reciva.com>
Date: Thu, 19 Nov 2009 10:50:48 -0300
Message-ID: <ae9c9a1c0911190550s6e47efe7s23bac24ba6546849@mail.gmail.com>
From: Ricardo Salveti de Araujo <ricardo.salveti@openbossa.org>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: ricardo.salveti@openbossa.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Which distro for OE development?
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
X-List-Received-Date: Thu, 19 Nov 2009 13:52:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2009 at 10:37 AM, Phil Blundell <philb@gnu.org> wrote:
> On Thu, 2009-11-19 at 13:06 +0000, Hodgson, Simon wrote:
>> I'm looking to make it as easy as possible to get started, so ideally al=
l the packages I need will be available from that distro's standard reposit=
ry.
>>
>> I've tried SuSE in the past and given up trying to get all of the requir=
ed tools installed, and more recently been using Debian, but the Python ver=
sion in Debian is a few versions behind and there was talk of OE soon requi=
ring a more up to date version.
>
> I'm using Debian on most of my machines and I am fairly happy with it.
>
> The python that's currently in Debian is fine for bitbake 1.8.x. =A0By th=
e
> time OE starts to require bitbake 1.10.x, I suspect Debian's python
> support will have caught up: failing that, you can always install the
> package from Ubuntu.

I'm using both Ubuntu 9.04 and Gentoo and they are working quite fine.

Didn't test with latest Ubuntu version, but probably someone already
did, as it's now such a common distro.

I think people were having problems with latest Fedora release, but
they can tell more about that.

Cheers,
--=20
Ricardo Salveti de Araujo


