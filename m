Received: from [74.125.46.155] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1MH0XM-0007DV-KJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Jun 2009 21:11:08 +0200
Received: by yw-out-1718.google.com with SMTP id 5so225112ywr.42
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2009 12:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=LmKvpDI3c7c94bJxFbYyL1wKmnLNkkPdpZmm6B3Q8Aw=;
	b=tc1wptJKJ4ZF27znpjTSo2uXaHRIgAusZKGERhIp/ibrRF/JME7cb/JGr+qMLEm1kf
	iQyECqV450V4DqWY5VSc67t/uqRkA414uh2Ij42m0pGuws8/wWX2Ro2opXV1nIk6rb+m
	bP5V3ePPOwTkdeuSCg31XVwdZxCIyCjbLPyTg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Vucpb3ExlDmoRFSjvLKNOD7Zo/UELjvDKbKRPd0BFSCK6pGXt9jDpZwsmuq1uujnzG
	p0QsQYMicQpJizrSA4Mb1qvXe7m1VOksHSIh5TU1SOUzePP2b44r+DALVN8zyPtm72R4
	CS2Oy2CAKv6nGtZg84JYFwRgHxyiv0NMB625Y=
MIME-Version: 1.0
Received: by 10.231.18.5 with SMTP id u5mr184049iba.5.1245265241114; Wed, 17 
	Jun 2009 12:00:41 -0700 (PDT)
In-Reply-To: <1245259060-23210-1-git-send-email-k.kooi@student.utwente.nl>
References: <1245259060-23210-1-git-send-email-k.kooi@student.utwente.nl>
Date: Wed, 17 Jun 2009 21:00:41 +0200
Message-ID: <c384c5ea0906171200v4fd9a1ddw682b2401a42669bd@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [STABLE][PATCH] Angstrom: fix OESTATS_SERVER host
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
X-List-Received-Date: Wed, 17 Jun 2009 19:11:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Wed, Jun 17, 2009 at 7:17 PM, Koen Kooi <koen.kooi@gmail.com> wrote:

> From: Koen Kooi <koen@openembedded.org>
>
> Signed-off-by: Koen Kooi <koen@openembedded.org>
>

Acked-by: Leon Woestenberg <leon@sidebranch.com>

-- 
Leon

