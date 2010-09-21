Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Oy2mo-00053D-2U
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 15:21:32 +0200
Received: by wwi14 with SMTP id 14so6558291wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 06:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=V57wEhRcxKMGdw5fux+5d72nnDOZWm8nrLCHZx8XEyw=;
	b=Hvf6LCNp1YW3qqKdW2gQJ2E6ufJzLhHdO0quuU6ww/HwXBgHYGezHeynTO+D+Gqo+9
	PTNZz0111K+hgcispElhLDiABkX1J8T/OeBtVJyUP8QYbmnGBdZWNiis28Q5T0pZtI8S
	wyzGFvLdPV2uAbg2Xmunr9e33iuPl6gWMs2Y8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=uFKVJEdMsfk2k4U6x4yMiDt+UarCos1lqrvOzeSdu5cw92Bvdmc0MJ2gQLSgT2hthL
	j0pHfl4tgp2lY5x+5tD5XWQvYqPJFRuknC1Am8ZYCxqDJDgwE2VYJw7+OPGjiCBXIfin
	g7DLJIAVVivCgrS+uTcmxp0+Tfzy+jRSEoeM8=
MIME-Version: 1.0
Received: by 10.216.10.77 with SMTP id 55mr9233069weu.17.1285075286289; Tue,
	21 Sep 2010 06:21:26 -0700 (PDT)
Received: by 10.216.72.212 with HTTP; Tue, 21 Sep 2010 06:21:26 -0700 (PDT)
In-Reply-To: <1285064159.23605.1.camel@mattotaupa>
References: <1285064159.23605.1.camel@mattotaupa>
Date: Tue, 21 Sep 2010 09:21:26 -0400
Message-ID: <AANLkTimSuDgxO3dpaMZSyHk5TeNhXtvuUdhwLH9zCPCU@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] docs/usermanual: s/are be copied/are copied/
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
X-List-Received-Date: Tue, 21 Sep 2010 13:21:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 21, 2010 at 6:15 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Date: Tue, 21 Sep 2010 12:13:25 +0200
>
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
> I am no native speaker, so please correct me if =BBare being copied=AB sh=
ould be used.
> ---
> =A0docs/usermanual/reference/var_src_uri.xml | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/docs/usermanual/reference/var_src_uri.xml b/docs/usermanual/=
reference/var_src_uri.xml
> index 9563256..c4f30a2 100644
> --- a/docs/usermanual/reference/var_src_uri.xml
> +++ b/docs/usermanual/reference/var_src_uri.xml
> @@ -229,7 +229,7 @@ SRC_URI[sha256sum] =3D &quot;36bdb85c97b39ac604bc58cb=
7857ee08295242c78a12848ef8a31
> =A0 =A0 <para>The following example shows the specification of a patch
> =A0 =A0 file:<screen>file://ospfd-no-opaque-lsa-fix.patch</screen></para>
>
> - =A0 =A0<para>Patch files are be copied to the patches subdirectory of t=
he source
> + =A0 =A0<para>Patch files are copied to the patches subdirectory of the =
source
> =A0 =A0 directory, <command>${S}/patches</command>, and then applied from=
 the
> =A0 =A0 source directory. The patches are searched for along the path spe=
cified
> =A0 =A0 via the file path variable, <command>${FILESPATH},</command> and =
if not

Pushed, thanks.

Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


