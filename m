Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rv5ZD-00083S-7I
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 12:20:03 +0100
Received: by eaal10 with SMTP id l10so113419eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2012 03:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=+GCdblLq8sRG4sVBgRH6FsG/wVbof2oVwVw/ss/0JGY=;
	b=p6pZ8Byvg4SUhxOM4Q8unOAqc+LhqGlSz47Oq6gXvveclwy36EHysSMkGvjZTUA3vu
	f28KOVnOXCl4TkmQjqyS4at5UgsawqkCw0it8uCRWBdldhNHXet0uL2OEGY8j0KIedKc
	S+2BsPEf0e+ryLCRBYkejf+MbDeBibW5c9WFU=
MIME-Version: 1.0
Received: by 10.213.10.145 with SMTP id p17mr2678434ebp.12.1328699520113; Wed,
	08 Feb 2012 03:12:00 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Wed, 8 Feb 2012 03:12:00 -0800 (PST)
In-Reply-To: <jgtl0v$gd6$1@dough.gmane.org>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKpi+WWUuf7iP8QgJK2vgmM3KAgS0Fkhbu3eEy80L2eszA@mail.gmail.com>
	<4F31C45B.1010600@linux.intel.com> <jgtb5c$8oh$1@dough.gmane.org>
	<CAP9ODKpDe4Up_mCuRdTqNY6a-Kkxyz2ZR-GR9uQ+VFFW0HGsJQ@mail.gmail.com>
	<jgtl0v$gd6$1@dough.gmane.org>
Date: Wed, 8 Feb 2012 09:12:00 -0200
X-Google-Sender-Auth: c1M4K4NzC7Za5nv9eeLw53WcKfM
Message-ID: <CAP9ODKp7S2+HR3umrnd9RzT5JE0X_T_cjWPzi6S5WUdZ-SAzoQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][RFC 00/27] systemd / initmanager rework
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
X-List-Received-Date: Wed, 08 Feb 2012 11:20:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 8, 2012 at 09:07, Koen Kooi <koen@dominion.thruhere.net> wrote:

> If it's just polkit and udisks and image feature works well enough. Perfect
> is the enemy of good and all that.


How I'd generate an image with polkit with systemd support?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

