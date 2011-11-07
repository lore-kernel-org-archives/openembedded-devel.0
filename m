Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RNEgS-0005k8-K8
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Nov 2011 03:11:36 +0100
Received: by qyk9 with SMTP id 9so3395582qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Nov 2011 18:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=Cwh80bAaAvLSSi+8OWbVJHkO1BhcizgvG9mk3aZAmTI=;
	b=GMo5UCr+TE7BufLqHxMREMbnf+RL0oWai+198jwWutspW/aCrzrMqT2uf1FurPdhLp
	W2gXyYzAn+eK5WqaaArjfHoQqWD2hzt2aeoLnd+Qsgcx0ZsMQ69GGT/NJcWT9xPTwVau
	YJI3lGaZjg38z+lahrOnG7tCPHgdzSTEwn2fA=
MIME-Version: 1.0
Received: by 10.229.64.144 with SMTP id e16mr2950979qci.112.1320631522262;
	Sun, 06 Nov 2011 18:05:22 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Sun, 6 Nov 2011 18:05:22 -0800 (PST)
In-Reply-To: <20111106230200.5DEC41032D@opal>
References: <20111106230200.5DEC41032D@opal>
Date: Sun, 6 Nov 2011 19:05:22 -0700
Message-ID: <CA+M6bXk801_N5bhqU3K00SOfc5KdONWAJhJj5+h2LSiF8kuwCg@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Florian Boor : Revert "libgee.inc: Use libtool macros from installed libtool"
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
X-List-Received-Date: Mon, 07 Nov 2011 02:11:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 6, 2011 at 4:02 PM,  <git@git.openembedded.org> wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: f2839f57c55e933f5c4fe9cf1e6cf35e6917205b
> URL: =A0 =A0http://git.openembedded.org/?p=3Dopenembedded.git&a=3Dcommit;=
h=3Df2839f57c55e933f5c4fe9cf1e6cf35e6917205b
>
> Author: Florian Boor <florian.boor@kernelconcepts.de>
> Date: =A0 Fri Dec =A03 10:32:53 2010 +0100
>
> Revert "libgee.inc: Use libtool macros from installed libtool"
>
> This reverts commit a89e9c41f6ea2df686bcfb7c01b39b23685b4261.

PRs don't go backwards in time, please fix this, thanks.

--=20
Tom


