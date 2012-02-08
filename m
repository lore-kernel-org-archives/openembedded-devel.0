Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RvAly-00034P-7N
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 17:53:34 +0100
Received: by eaal10 with SMTP id l10so199965eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2012 08:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=CfDne5EHipkZPsSKR6yczyapxCVcF4h36uYd8oPw4i4=;
	b=M9ivhLeo8PWbnJJr4AQ9+rkYdhjP0dZ21BHzKRwYsikjvD0evE979OMlcnkq4zuYkJ
	Mr/+08DGwk9TWYB6QZjmMDpSPy+Nt2cYWwWPNmdpKhXGJGkd37U91KuhF2PoJBR9BG+e
	rRaZuC6L6ROZsynQoPId3/NsZouU3wWd1iZPE=
MIME-Version: 1.0
Received: by 10.213.10.145 with SMTP id p17mr2870300ebp.12.1328719530700; Wed,
	08 Feb 2012 08:45:30 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Wed, 8 Feb 2012 08:45:30 -0800 (PST)
In-Reply-To: <03CA1E51-4269-4411-B81C-2A50368C2B1F@dominion.thruhere.net>
References: <1328705404-24406-1-git-send-email-koen@dominion.thruhere.net>
	<CAP9ODKrAap_fWH_YRTn26ujwt-DwfO7enzprODPJk7iH=Z+AfA@mail.gmail.com>
	<E9FE936C-E077-4187-ACE4-5BCA6806A89C@dominion.thruhere.net>
	<CAP9ODKqKXWKNWASct1gc-ehswVeczt-LswTKC_gaBikSSjyZ_A@mail.gmail.com>
	<03CA1E51-4269-4411-B81C-2A50368C2B1F@dominion.thruhere.net>
Date: Wed, 8 Feb 2012 14:45:30 -0200
X-Google-Sender-Auth: QZ94wUEk3GxZBXtpdWxH1Ahx3IQ
Message-ID: <CAP9ODKoejf1WZF_59Wk-Da57N0PaxckwK2FZ6q5wp4KFdXy7pA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] systemd: split out libraries from ${PN}
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
X-List-Received-Date: Wed, 08 Feb 2012 16:53:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 8, 2012 at 14:44, Koen Kooi <koen@dominion.thruhere.net> wrote:

> Those 3 are indeed not in ${PN}, but does that really need a seperate
> patch?


This fixes another thing that is not cited on the commit log :-( I'd prefer
it to be explicited on the commit log or another commit for it.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

