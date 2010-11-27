Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PMLI1-0001lf-3j
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Nov 2010 14:58:10 +0100
Received: by iwn8 with SMTP id 8so1002411iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Nov 2010 05:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=HlKhyhOkbu3kaehLQyhPoUeDjPEZ4ConQ4NP9e8ibQ8=;
	b=IQO7uPjjszf+hPA+FYOHGl7kJ7hiBLJKOdl7vrGQVcQW6uT3g3PR237Po0F2f/LfxD
	0FlHNN8ItxL9vtz1TBdZ2Sl3F1S6TQd0gTr/kqZmbMFvT49qQSq9kRbPgP+xpfERmBHa
	dlC32+jKHBpBUuqRRG11j5EsXwjOpXe3vVj14=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=fi1qJ+z8BTbbw65ikHYccSQ1NB9ZrT7Bm0YaxrcKUHS1353eltEPpAwFTK4MGijA3F
	Bsb1kHyP4vOMECXwkykmZGYYMcxcv4w5WghUkk+780SKTP2ZXTWp2QqGuKY72oTLsg2q
	+mxibcsPxxeXHNIpHkyl+QsPYq0f7TR+lyACI=
MIME-Version: 1.0
Received: by 10.231.17.203 with SMTP id t11mr2950283iba.1.1290866209346; Sat,
	27 Nov 2010 05:56:49 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Sat, 27 Nov 2010 05:56:49 -0800 (PST)
In-Reply-To: <1290856038-5691-1-git-send-email-schwarzkopf@sensortherm.de>
References: <1290856038-5691-1-git-send-email-schwarzkopf@sensortherm.de>
Date: Sat, 27 Nov 2010 14:56:49 +0100
Message-ID: <AANLkTim2QyKSW4RpGFZb9Hu5PqYJXqDN632wqav_5R-p@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] cpusage_0.1: fixed download link
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
X-List-Received-Date: Sat, 27 Nov 2010 13:58:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/11/27 Klaus Schwarzkopf <schwarzkopf@sensortherm.de>:
> cpusage have a new homepage: http://www.net.t-labs.tu-berlin.de/~fabian/p=
roj_de.html
> ---
> =A0recipes/cpusage/cpusage_0.1.bb | =A0 =A04 +++-
> =A01 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/cpusage/cpusage_0.1.bb b/recipes/cpusage/cpusage_0.1=
.bb
> index 3f4ddfc..9a3811f 100644
> --- a/recipes/cpusage/cpusage_0.1.bb
> +++ b/recipes/cpusage/cpusage_0.1.bb
> @@ -1,10 +1,12 @@
> =A0DESCRIPTION =3D "This tool read out the tics counter of the operating =
system and \
> =A0calculates the Percentages spend in each CPU_STATE."
> +HOMEPAGE =3D "http://www.net.t-labs.tu-berlin.de/~fabian/proj_de.html"
> =A0SECTION =3D "base"
> =A0PRIORITY =3D "optional"
> =A0LICENSE =3D "GPL"
> +PR =3D "r0"
>
> -SRC_URI =3D "http://www8.in.tum.de/~schneifa/group/sources/cpusage-${PV}=
.tar.gz \
> +SRC_URI =3D "http://www.net.t-labs.tu-berlin.de/~fabian/sources/cpusage-=
${PV}.tar.gz \
> =A0 =A0 =A0 =A0 =A0 =A0file://cpusage.patch"
>
> =A0S =3D "${WORKDIR}/cpusage-${PV}"
> --

Looks good to me, but since patchwork is down I cannot easily pull,
test and push patches ...

Frans


