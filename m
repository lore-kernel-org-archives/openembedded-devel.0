Return-Path: <mhm.dawod@gmail.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id F3B787926B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 14:37:39 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id c15-v6so4924975qtp.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 07:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PZJVXIh9e8hgCg0juCnYcwAzJVPSlM1qXAQslNR76eg=;
	b=mrZpGAlZoErMgR3rUuJA3ELLNC+1sfliP38KXWXewjO7sPO4CKhZ44p+1th9rb71Mc
	hyKtGvoVZlC3rZCTRB6u/BWfLvcs2FS90wcZZCqOkbXjaGfcH2sRSIGT8InXpaPaUYs6
	QramB+n13KjWj0YKfzTDF5tTarz3O/cAIRJ8Ct6eUCe0XDIYcvDMN47XtxdpwNcjrLUn
	yt4S/FDwYIVLv1uPijBS5LEuQLCkL6i84+8q+mR+yJzktVoBqL7oPGLtevymMZgZT3Z+
	uQUxIeNuKK8vXOYV6MtFVxO6BO+DMtRgF2+A54n951DyET/SPOPvGC8EGswFV6R+wp/b
	8uqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PZJVXIh9e8hgCg0juCnYcwAzJVPSlM1qXAQslNR76eg=;
	b=pXGVevN5BY55FpD9U+rrXbZabH+uIIzX7rITlVRqUd7ky8ruzga2dhBfhpbcfZklGS
	vwQzOtLMUM3f/svWx/BKVti59zJhHHy1upSA54BGsNX3FA4B5Mv1p1+Gk8Y7B6DvWLx7
	taqxxDJIRFLLLaF65ZnMcxbEHn1BL33zh0NlYWuj7E6pWXvV3KAwumNLMnUCchOoDHpQ
	fm0hQNTmWh3hdIYPs0Rq3dEaox2H+7d3AixIbDQZbdOeZ23Z8dza9DS6c/Bwm0KotDsW
	Y5t6T0yvBB6iEhO8FVIbeGlS2cYe+ek6v+wGhp4oUfIcuHDVsuYfsUWqAeUe2CpqKYms
	ORBA==
X-Gm-Message-State: AOUpUlHYBca+stga9FKXE6xoTSsBY5ojGmz00vGEV7v833YA3BHhflPP
	Xe7BVNWw6umz7L1g4JmpfSSwiODBD618l+OlG3E=
X-Google-Smtp-Source: AA+uWPwcJC+94WI9/LWjdgF7lT82OypDLh4/eQlPHCDktQUoWtL2kgaelMTm0bZCQIllFFh2juHiICfmHA9bfkqcRjc=
X-Received: by 2002:a0c:c30f:: with SMTP id
	f15-v6mr26631329qvi.104.1534430260909; 
	Thu, 16 Aug 2018 07:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAGCTLNRr7118-2whFfsWw-KbaT23bCKmp4J-HmyBZMFWw750Bw@mail.gmail.com>
	<CAMKF1sr2se=QBu8UjieWGXUPT=Jyj3PesogniqK-F6BnzsrWZA@mail.gmail.com>
In-Reply-To: <CAMKF1sr2se=QBu8UjieWGXUPT=Jyj3PesogniqK-F6BnzsrWZA@mail.gmail.com>
From: Mohamed Dawod <mhm.dawod@gmail.com>
Date: Thu, 16 Aug 2018 16:37:28 +0200
Message-ID: <CAGCTLNTSwV=ozB7gCX+G4QqTyiR8aVC=kPHvLL0J2VZGPDwJuQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [qt5]: qt5 support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Aug 2018 14:37:40 -0000
Content-Type: text/plain; charset="UTF-8"

where i should use -platform wayland ?
did you mean when i run the application, i need to add this suffix to the
app name ?

On Thu, Aug 16, 2018 at 4:24 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Aug 16, 2018 at 6:26 AM Mohamed Dawod <mhm.dawod@gmail.com> wrote:
> >
> > can i run qt5 apps on image that support wayland weston without x11 ?
> > and how ?
> >
>
> add qtwayland to IMAGE_INSTALL and use '-platform wayland'
>
> >
> > --
> >
> > Mohamed Dawod
> > Computer Engineering Department
> > Faculty of Engineering
> > Cairo University
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


-- 

Mohamed Dawod
Computer Engineering Department
Faculty of Engineering
Cairo University

