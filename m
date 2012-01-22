Received: from mail-qw0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1Rp0Sl-0007r5-KH
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Jan 2012 17:40:15 +0100
Received: by qaea17 with SMTP id a17so1297832qae.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Jan 2012 08:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=GXjFpW9EOhEe9om2n9QBJMyUhc6f4vQw2Q2qUgfw2eY=;
	b=P7QdTu4rtg7I/N0TbKuN59fKbG5pOLPFSr4Dt8RLUmLPwSo7q6sKyZv8kkyxR1JBF+
	0uuGeL9rwF+VJ8pvOF0IGVMBLvJ4DzVPnx2hA8NsQeQcIzAyP5RWFp2EW0L2ZTmUq4FP
	OrXtoNDLmeU7tFWQxtRceO0ghh3Ia/2HFwV8g=
MIME-Version: 1.0
Received: by 10.224.205.199 with SMTP id fr7mr1817087qab.65.1327249951611;
	Sun, 22 Jan 2012 08:32:31 -0800 (PST)
Received: by 10.229.98.149 with HTTP; Sun, 22 Jan 2012 08:32:31 -0800 (PST)
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C402355AD@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C402355AD@post.tritech.se>
Date: Sun, 22 Jan 2012 09:32:31 -0700
Message-ID: <CA+M6bX=3mJc3WsdaqpyT+9wxLiQSazXT2nzOpPM+1CSaDmD50A@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance] Pull request for packaged-staging.bbclass
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
X-List-Received-Date: Sun, 22 Jan 2012 16:40:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 19, 2012 at 4:03 AM, Mats K=E4rrman <Mats.Karrman@tritech.se> w=
rote:
> Hello Tom,
>
> Please pull this commit from the openembedded classic master branch:
>
> Fabrice Aeschbacher (1):
> =A0 =A0 =A01aeea48674 =A0packaged-staging: Fix fetching from PSTAGE_MIRRO=
R with file:// URI

Please see the 'Dealing with changes' section of
http://www.openembedded.org/wiki/2011.03-maintenance as I ask for a
git URI to pull from (github, gitorisos, self-hosted, whatever) not
just a cherry-pick request, to be sure that the issue is solved for
the person (and there's not some other local change they forgot
about).  Sorry and thanks.

--=20
Tom


