Return-Path: <joaohf@gmail.com>
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id A692F60249
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2016 01:30:41 +0000 (UTC)
Received: by mail-ob0-f178.google.com with SMTP id fz5so99418763obc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 17:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=6Bp2aIU9a30w6KWEPcdVyuS51eBQhD6Q5A2qiR1Ez88=;
	b=O+DF8g8QNwWqUrt7O7Y5Z7AuYHY1ZfdBZtk+6Ba7Cq1UPtQHhl4LxtRn4e6G+CRp4h
	5K3Q2RWynHaYnt8xUxk8nx/jlS83r1FM0RcBwOCs8QR6e015K+cBGyMd1ySm8fEyu8Jj
	8MhWqiD00P/pZm9SDq378xoFWodqZsOBEzC81S1ACMSTvTa2OAskDhyFQnQ3yvAdM36m
	u90uvk6tPMsN+Vu6IBZoeSLnsikvnWWaB+/Anzk7y7/wcz0Dh9Rk3uWIXdwn4xV2VVlK
	h0WDCw5mowx3JJlA3vLhTVdslgGlWkKU40FZKFIBecbdtftWmYpFPl6up/uNQlpzdRKA
	AjzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=6Bp2aIU9a30w6KWEPcdVyuS51eBQhD6Q5A2qiR1Ez88=;
	b=iNZh3c+ve0W8MqLaupDcsNuC7z8gk2UtLcLXIqFYAdWtli0lXM/vN/4EI/Ey9FwK2Y
	wcxdBR1J3YCxkkVRRkAPOleptdgibp914FCre2p76MleG8pwvHJUjxDlBvxGgzKIM6Lz
	WrNXp0HncTnxv8yVOQ4qONLqmnMzKlqx2JwLADXwTDgIxJ4rgK+inix9CZomqVSIEAHe
	7cCfi4GsQK6dl3pB0Bx3tz/TZdTWCfI64oHhgAA4tBgaAWeAjyRkj9LNiMsxhgxB50D3
	LDA6YoF53QM3EBWsLIl6XWe7Sdaj6XZaMGzIYd/P/g49eSdh3y4xd3dQs6HBo+ZP+mn7
	aMNQ==
X-Gm-Message-State: AD7BkJK9sgCsA3zl7utrDxjyq+aIyXvTs8yOQD4b3w4mMQrc4nQDxmLVO59f0crTlxoPTJaE+NmT1HRyqhBi/g==
MIME-Version: 1.0
X-Received: by 10.182.230.6 with SMTP id su6mr3987547obc.16.1457659842441;
	Thu, 10 Mar 2016 17:30:42 -0800 (PST)
Received: by 10.157.22.157 with HTTP; Thu, 10 Mar 2016 17:30:42 -0800 (PST)
In-Reply-To: <20160301083508.GA4897@comp-006-thk.openrnd.local>
References: <1942614094.432571.c7487dd4-fa75-4480-8552-00e8cab6887c.open-xchange@poczta.nazwa.pl>
	<20160301083508.GA4897@comp-006-thk.openrnd.local>
Date: Thu, 10 Mar 2016 22:30:42 -0300
Message-ID: <CANFVK7_px6b+G1+XfstACf+FqVbytSyC1+j+9vejA6PZn2i9HA@mail.gmail.com>
From: =?UTF-8?Q?Jo=C3=A3o_Henrique_Freitas?= <joaohf@gmail.com>
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-erlang] generate-manifest update and packaging fixes pull request
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Mar 2016 01:30:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Maciej,

Merged.

Thanks.

On Tue, Mar 1, 2016 at 5:35 AM, Maciej Borzecki <maciej.borzecki@open-rnd.p=
l
> wrote:

> Hi Jo=C3=A3o,
>
> Did you get a chance to look at the patches? I can open a pull
> request on github if that's more convenient for you.
>
> On 02/25 20:56, Maciej Borzecki wrote:
> > The series contains a number of patches for the `generate-manifest` too=
l
> as
> > well as fixes for packaging of Erlang modules.
> >
> > The first patch addresses the problem of maintaining multiple versions
> > of `generate-manifest` tool, one for each Erlang version. This is not
> > effective in the long run. The tool has been updated to support multipl=
e
> > Erlang versions. We exploit the fact that Erlang modules have a
> > predictable directory layout. There is very little change between
> > consecutive Erlang versions with respect to module organization. This
> > allowed for reducing much of the duplication into a smaller, more
> > maintainable code. The script can generate manifest for Erlang 18.2.3
> > and 18.1.5 (version currently supported in the tree). Particular versio=
n
> > is selected by passing --erlang-version <version> as a command line.
> > Along with the changes described above, the script has been pylinted.
> > The generated manifest contain slightly more packages, as by default a
> > *-doc package is added for each module. The script output is largely
> > identical to what the original code produced.
> >
> > The second patch tightens package file selection. We make sure that *-d=
ev
> > packages ship `src` as well as `c_src`, `java_src` and other variants,
> > should they exist. The *-doc packages should ship manpages and other
> > documentation files.
> >
> > The third patch fixes the problem of files being shipped in incorrect
> > packages. The commit message is rather long, so for brevity, I will not
> > repeat it here. TL;DR is that the way the packages are populated and ho=
w
> > the manifest gets generated results in for instance dialyzer script
> > being shipped in erlang-erts package. The fix addresses this problem by
> > preserving the order in which modules are defined. Since we're using
> > Erlang in an embedded system, we're rather picky about the modules and
> > install only the ones that are needed for particular application. By
> > shipping incorrect files in packages, we either need to install
> > unnecessary packages, or install too many files, thus wasting space.
> >
> > The last patch is a regenerated manifest files for Erlang 18.1.5 and
> > 18.2.3. The diff is large (~200kB), that's why I've put everything into
> > a pull request.
> >
> >
> > The following changes since commit
> 8878361e26aee0624385a4ef1ede44cdacd8108a:
> >
> >   erlang: add 18.2.3 (2016-02-07 16:08:55 -0200)
> >
> > are available in the git repository at:
> >
> >   https://github.com/open-rnd/meta-erlang.git
> >
> > for you to fetch changes up to c9ee91fed2e5241fc3d506cb0fde971b153f8909=
:
> >
> >   erlang-xxx-manifest: regenerate manifest files (2016-02-25 20:27:55
> +0100)
> >
> > ----------------------------------------------------------------
> > Maciej Borzecki (4):
> >       generate-manifest: replace multiple scripts with one
> >       generate-manifest: tighten file selection rules
> >       generate-manifest: preserve the package order
> >       erlang-xxx-manifest: regenerate manifest files
> >
> >  recipes-devtools/erlang/erlang-18.1.5-manifest.inc | 2058
> +++++++++++---------
> >  recipes-devtools/erlang/erlang-18.2.3-manifest.inc | 2058
> +++++++++++---------
> >  scripts/contrib/erlang/generate-manifest           |  394 ++++
> >  scripts/contrib/erlang/generate-manifest-18.1.py   |  460 -----
> >  scripts/contrib/erlang/generate-manifest-18.2.1.py |  460 -----
> >  5 files changed, 2712 insertions(+), 2718 deletions(-)
> >  create mode 100755 scripts/contrib/erlang/generate-manifest
> >  delete mode 100755 scripts/contrib/erlang/generate-manifest-18.1.py
> >  delete mode 100755 scripts/contrib/erlang/generate-manifest-18.2.1.py
> >
> > --
> > Maciej Borz=C4=99cki
> > Senior Software Engineer at Open-RnD Sp. z o.o.
> > www.open-rnd.pl
>
> --
> Maciej Borz=C4=99cki
> Senior Software Developer at Open-RnD Sp. z o.o., Poland
> www.open-rnd.pl
> mobile: +48 889 117 365, fax: +48 42 657 9079
>
>
> Niniejsza wiadomo=C5=9B=C4=87 wraz z za=C5=82=C4=85cznikami mo=C5=BCe
> zawiera=C4=87 chronione prawem lub poufne informacje i zosta=C5=82a
> wys=C5=82ana wy=C5=82=C4=85cznie do wiadomo=C5=9Bci i u=C5=BCytku os=C3=
=B3b, do kt=C3=B3rych
> zosta=C5=82a zaadresowana. Je=C5=9Bli wiadomo=C5=9B=C4=87 zosta=C5=82a ot=
rzymana
> przypadkowo zabrania si=C4=99 jej kopiowania lub rozsy=C5=82ania do os=C3=
=B3b
> trzecich. W takim przypadku uprasza si=C4=99 o natychmiastowe
> zniszczenie wiadomo=C5=9Bci oraz poinformowanie nadawcy o
> zaistnia=C5=82ej sytuacji za pomoc=C4=85 wiadomo=C5=9Bci zwrotnej.
> Dzi=C4=99kujemy.
>
> This message, including any attachments hereto,
> may contain privileged or confidential information and is sent
> solely for the attention and use of the intended addressee(s).
> If you are not an intended addressee, you may neither use this
> message nor copy or deliver it to anyone. In such case, you
> should immediately destroy this message and kindly notify the
> sender by reply email. Thank you.
>



--=20
Jo=C3=A3o Henrique Ferreira de Freitas - joaohf_at_gmail.com
Campinas-SP-Brasil

