Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RHHYf-0008SN-UQ
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 18:02:58 +0200
Received: by qam2 with SMTP id 2so3187571qam.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2011 08:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=2ileuqoNmW6lLOWyLlrtY4zto7ueyA3ZAaNiDDOBrOg=;
	b=oDHefa81vjEWpmQtKwLCPtp22S6HV5fjf2g2bKAiO0fVsd3RYWqTT5P889hvW6GLos
	uf/gLDlu3Qgl1Nr0AIy8eCy9fq81+dSurxSXnDX2SFP3UW3NNLn/RdiApij1VxlDOPpI
	UH9Z2Qxln2eyipHfgQLk9LPRU1eG4ETPMOfM4=
Received: by 10.68.20.226 with SMTP id q2mr28417990pbe.115.1319212623044; Fri,
	21 Oct 2011 08:57:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Fri, 21 Oct 2011 08:56:33 -0700 (PDT)
In-Reply-To: <j7ru52$7mq$1@dough.gmane.org>
References: <cover.1319205291.git.otavio@ossystems.com.br>
	<009ed9f76dd5f8b17a89881366903f070b6e8a1b.1319205291.git.otavio@ossystems.com.br>
	<j7ru52$7mq$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Oct 2011 08:56:33 -0700
Message-ID: <CAMKF1sq6oY3n20=C3LdVWSA+1t_7KV8AMgMssdiWQNcFBQ_GhQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 5/5] task-basic: add "serial-console" machine feature
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
X-List-Received-Date: Fri, 21 Oct 2011 16:02:58 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 21, 2011 at 7:04 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> As we discussed briefly on IRC, DISTRO_FEATURE or IMAGE_FEATURE might be
> better. So, what do others think?
>

I think IMAGE_FEATURE is appropriate here.


