Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1Po0Gm-0002ui-6j
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 22:11:12 +0100
Received: by qyk8 with SMTP id 8so3356592qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 13:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=+W2ckBKABPhM4tUdbIJdggcF7pYpbWctq8Hq2QBRWsA=;
	b=k27GQeRSCIq+RSD9JdR8pFllhaCJ08IoskLPfEw+sLQjxzGRL5EJOqjeTrAE4fOJQU
	vEl71jjDLV38F8v+Z92v/kovNygQQQOFPeS/8TT3yCOJxAGBqKetE8A168oA2LabNp2H
	MYKiALJs1f9C8tU6ULfJmVUiKKANVB1KwriRg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=dv/EeRAExc2QpvMjtdy903b3TgGNA05nvElRauZ68pi7kbMNaSQop+ZB9InoDfGZYW
	zKU/T/Tl2U0HNyoh3zvNA6CTMyzHKKcHzb931UiLKtvXdugd91TBDmx5c+EQAc8tqTnd
	V4r8FClP0wz/e1yjA90z75F21UBnBb9FYddEI=
MIME-Version: 1.0
Received: by 10.229.6.207 with SMTP id a15mr1011365qca.298.1297458602562; Fri,
	11 Feb 2011 13:10:02 -0800 (PST)
Received: by 10.229.193.10 with HTTP; Fri, 11 Feb 2011 13:10:02 -0800 (PST)
In-Reply-To: <4D557DED.5070606@mentor.com>
References: <AANLkTik+8d-hWG+ndtvSP7cKbbHhfyXq3tLxw1Fyi-=6@mail.gmail.com>
	<1297447579-5311-1-git-send-email-filip.zyzniewski@gmail.com>
	<4D557DED.5070606@mentor.com>
Date: Fri, 11 Feb 2011 22:10:02 +0100
Message-ID: <AANLkTinpBmx9F9ftYrkC2t6GUEKN8_MVXM2aa=Mn=3eo@mail.gmail.com>
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] initscripts: handle busybox version of makedevs properly.
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
X-List-Received-Date: Fri, 11 Feb 2011 21:11:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 2/11/11, Tom Rini <tom_rini@mentor.com> wrote:

> Is there a syntax that works for both?

I've looked at the source code of both versions and there is no
compatible syntax.

bye,
Filip Zyzniewski


