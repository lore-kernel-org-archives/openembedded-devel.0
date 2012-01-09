Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RkIzU-0007BX-RS
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jan 2012 18:26:36 +0100
Received: by lami14 with SMTP id i14so1426946lam.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jan 2012 09:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=jyZYzKk1P5bD0VGgaSIro1eL03KcLGZwqGcoVRsQZVo=;
	b=btLsAlZXVymvt+AN0f6i01P0nXY1EGDIzSNFjRAbuKvsOi1reBkcaYx9lg8EZYoUGQ
	gfGawCWYCXyRIfWhqYv5fWRYYEHXZBPy1QEaIrOHPVQCprZaoEIsIdqAp5zkzu5oW+9K
	QzWRbPzASDk8t/K9GwJglQulPCYYa6olem1Z8=
MIME-Version: 1.0
Received: by 10.112.85.129 with SMTP id h1mr3551018lbz.84.1326129547651; Mon,
	09 Jan 2012 09:19:07 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.112.54.104 with HTTP; Mon, 9 Jan 2012 09:19:07 -0800 (PST)
In-Reply-To: <4F0B0F7A.9020907@windriver.com>
References: <cover.1325876341.git.otavio@ossystems.com.br>
	<b61f46cb503582b669cbc56b0ea04d7fdaafd256.1325876341.git.otavio@ossystems.com.br>
	<1325879877.3234.2.camel@lenovo.internal.reciva.com>
	<CAP9ODKqpDS=sJQ-uuP5+E6QOMU7eQheWXqk+TSA4fkpwha6LVw@mail.gmail.com>
	<4F0763FD.9000801@windriver.com>
	<CAP9ODKrhfnL_+VJNWFQ0J7uyw3yayZ-e+gnyzsp4gjivxdtL2Q@mail.gmail.com>
	<CAP9ODKo+uNuXx+jmN6uiFgG9nuwEuTjwc2JDpXnrygyp88j=rQ@mail.gmail.com>
	<4F0B0F7A.9020907@windriver.com>
Date: Mon, 9 Jan 2012 15:19:07 -0200
X-Google-Sender-Auth: diKz7LGW9NxyuMBkHAmgG2gSx74
Message-ID: <CAP9ODKpHL0y6wi6eYtYE979p0kw6P4P9=TjdJroAND53MCEYtA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH 5/5] udisks: disable manpage building
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
X-List-Received-Date: Mon, 09 Jan 2012 17:26:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 9, 2012 at 14:02, Mark Hatle <mark.hatle@windriver.com> wrote:

> Hmm, I think the best solution is to fix the docbook problems, but baring
> that a static version of the man pages is the next best alternative.
>
> Advantage to fixing docbook is it will work for the next package.  :)


I fully agree but I am short in time for our deadline so this wasn't an
option thus we choose the shortest route for now.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

