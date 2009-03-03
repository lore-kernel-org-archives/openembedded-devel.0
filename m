Received: from [209.85.198.249] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1LeYsz-00044P-Ns
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Mar 2009 18:58:33 +0100
Received: by rv-out-0708.google.com with SMTP id b17so3208129rvf.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2009 09:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=RMN4mMlGsgEZHnAFfoldWjJ8pHo166pNO8Tyfm5HhyQ=;
	b=qoOx30/1Cnmb476cWdh0jgtDko32DScUjRaG+Ul9RBwzCvvfmLpuknO3cj2vm0OV0l
	FyA8iufDW4YlZYdHUM/SElZhzv3CMVJDjA+0xs6bnW090RGwPWsKByhTmyavwWAk2gAv
	uHLtNsL7aj+hsZ2+Rs15IZzZTadD1tchQ8IjE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=KlUu/CxlJx9SSACq12jFmUQlee5dJi80KwJ9p8txVrt6xivFDSZbLy9xpsCVe7xaZ8
	0L8lvXkNzkod2vg9+RgJ11UNijotKRKqEgxx5DI+xRc+yGj+GDpyGctFxM+lo2XrlOMn
	GvOwsag0Kna05GxDoPJrO6Hf7a3MPsEYbOriM=
MIME-Version: 1.0
Received: by 10.140.136.5 with SMTP id j5mr3638730rvd.281.1236102869183; Tue, 
	03 Mar 2009 09:54:29 -0800 (PST)
In-Reply-To: <alpine.DEB.1.00.0903011142130.4985@localhost.localdomain>
References: <alpine.DEB.1.00.0903011142130.4985@localhost.localdomain>
Date: Tue, 3 Mar 2009 12:54:29 -0500
Message-ID: <f96d234e0903030954v60eacb1p2b3cc44ecca848b0@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] metadata.xml: Update 'File Layout' section.
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
X-List-Received-Date: Tue, 03 Mar 2009 17:58:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 1, 2009 at 2:43 PM, Theodore A. Roth <taroth@gmail.com> wrote:
>
> ---
> =A0docs/usermanual/chapters/metadata.xml | =A0107 +++++++++++++++++++++++=
+++-------
> =A01 files changed, 84 insertions(+), 23 deletions(-)

Applied, thanks.

Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


