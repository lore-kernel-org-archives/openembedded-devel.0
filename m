Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SY170-00088D-Lh
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 May 2012 22:27:50 +0200
Received: by vbbfr13 with SMTP id fr13so1060945vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 May 2012 13:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=oJa3odt81BuGAdq/EIPWvDbd+BKd3wHHHfb0q+hVA+s=;
	b=wCYPsLknhua0aF/JyrBzSn3iDrEJ42PDxGTYULhzhSAynnos46NRLZbIPDZrB2T9b/
	O5Ac5oVpohtl9fDteG8GcM/pHOSursSee+hsO6Am9tuCD2ja4vIqrqAmWNIDppBAT6Rn
	peiDmsSuZ1werSxAqTOZCjvX7cwwDgx3DVECIbwLIqOrl/iIFq7idxVv5toVuAWMseVr
	nmVUPpbUUVJYvq7cGaX+j9SZoy/D/cDuS3dFWNOmfdE10EmMI7KkYfvs250cg9RnFcwL
	0N9Ic/aLuZ/3aUJabDtv7AUdK444r4n3YeT6gm4C6JmALDeb/ulcTgDHC2yUy2+ketx/
	zRvA==
MIME-Version: 1.0
Received: by 10.52.97.230 with SMTP id ed6mr196951vdb.65.1337977057400; Fri,
	25 May 2012 13:17:37 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.152.82 with HTTP; Fri, 25 May 2012 13:17:37 -0700 (PDT)
In-Reply-To: <1337975688-31659-1-git-send-email-daniel.mcdougall@liftoffsoftware.com>
References: <1337975688-31659-1-git-send-email-daniel.mcdougall@liftoffsoftware.com>
Date: Fri, 25 May 2012 17:17:37 -0300
X-Google-Sender-Auth: TRvEcaKCTzdH7ZxRymS99wmoTEs
Message-ID: <CAP9ODKq9BBVhJyiYLww2adrW4qXiQAudVma4k7ijFXPcHe3oEg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] netbase updated to 5.0
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
X-List-Received-Date: Fri, 25 May 2012 20:27:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, May 25, 2012 at 4:54 PM, Dan McDougall
<daniel.mcdougall@liftoffsoftware.com> wrote:
> Updated from 4.47 to 5.0 (4.47 isn't available anymore on the Debian FTP
> servers so this was blocking builds from completing).

I like this patch but:

 * did you evaluated the fixes that could be dropped?
 * please move to netbase as we seem to be stick to one version of it

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


