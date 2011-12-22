Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RdirL-0004Hs-9C
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Dec 2011 14:38:59 +0100
Received: by eaal1 with SMTP id l1so7557227eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2011 05:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=v8rCz4l/0PDFuI5p78oobAfXBr09wFIT/7MBTo7wxjY=;
	b=MWg45JMHmRpfYhl7/czd0ER9D9xWjWmeprszZsWYSrlppdyVJA/jOGqxfyq+hk/LbA
	o88qmhDTMJdqpflNXg895fRKBoteWrPCrACDVCj0LJLijZn3X5Dl7YmcAxlgjNunnITe
	484tG10esHA47bZvqvzNGV8bJhSIbAH75xt7A=
MIME-Version: 1.0
Received: by 10.205.120.148 with SMTP id fy20mr2777999bkc.125.1324560711257;
	Thu, 22 Dec 2011 05:31:51 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.78.79 with HTTP; Thu, 22 Dec 2011 05:31:51 -0800 (PST)
In-Reply-To: <20111222131940.GA1471@jama.jama.net>
References: <cover.1324559278.git.otavio@ossystems.com.br>
	<06703197a0e4b89243cacc36ac59cdb88992b9ca.1324559278.git.otavio@ossystems.com.br>
	<20111222131940.GA1471@jama.jama.net>
Date: Thu, 22 Dec 2011 11:31:51 -0200
X-Google-Sender-Auth: jVPk68P46VHITwfNfpZGmtfW_Js
Message-ID: <CAP9ODKqFnR+CwboHkQsrCa9dkV5aTS0mXcjirchjtRS0DbCfoQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH 2/3] rsyslog: move systemd support to rsyslog-systemd
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
X-List-Received-Date: Thu, 22 Dec 2011 13:38:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Dec 22, 2011 at 11:19, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Thu, Dec 22, 2011 at 01:08:23PM +0000, Otavio Salvador wrote:
> > This makes the package consistent with others supporting systemd and
> > also cleans up the recipe using the systemd.bbclass.
>
> Do you have similar change for xserver-nodm-init? to make it even more
> consistent? :)
>

Not now but can cook one for later :-) if you can help doing that, it would
be nice.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

