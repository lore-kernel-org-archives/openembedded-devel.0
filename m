Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TTXPw-00008q-AC
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Oct 2012 13:29:08 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so560449dak.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2012 05:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=JOLRBiuigUefBjAKBhDn12AA7VVJVeUHQhde+VuR534=;
	b=f9KS5A2bk7KdwBsq1Q9cNd8TTEaNs1Dx+dpuEOq5zyTqtEowJDO5y77e+k4HFD/oXW
	TesUXAhH5W7/DAqsNFpKnf6HQtJ5vc1c8XK5PodQ0F1Y0LDpF+gVBwGqmlJvEbl0Nh3L
	J2P+93GXySoBgBosKQkcXwzeN8hLU42V5J98yY7qBamZThmHvwXDeiX5L/AofmlkQfi5
	2hi2765SnM5Mqqf4F9HRXDomq/EJdvnaCO74kbq9ZRVAls3ASoiH0O1sP5Ds2EqnLnUL
	6CE0shAZEzw80RtrpAcEf4hTILLMLvMTpBrDhIcOBHcKCQ9sCgvQeWPyq5f4hWuw0AGH
	lFEg==
MIME-Version: 1.0
Received: by 10.68.189.8 with SMTP id ge8mr22856704pbc.24.1351685730743; Wed,
	31 Oct 2012 05:15:30 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.40.201 with HTTP; Wed, 31 Oct 2012 05:15:30 -0700 (PDT)
In-Reply-To: <1351685486.13864.97.camel@phil-desktop>
References: <1351681706-12778-1-git-send-email-otavio@ossystems.com.br>
	<50910EFB.7010804@gmail.com>
	<1351685486.13864.97.camel@phil-desktop>
Date: Wed, 31 Oct 2012 10:15:30 -0200
X-Google-Sender-Auth: PVPasdq6__AZgQ9NhwSTTeJ_2Vg
Message-ID: <CAP9ODKqnTYfBa84642qQGzVigVzrsPQuhqvizz1smKmS=Trdww@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2 1/3] meta-systemd: Move ntp recipes to 'meta-networking' sublayer
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
X-List-Received-Date: Wed, 31 Oct 2012 12:29:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 31, 2012 at 10:11 AM, Phil Blundell <philb@gnu.org> wrote:
> On Wed, 2012-10-31 at 12:43 +0100, Martin Erts=E5s wrote:
>
>> for now I guess we can just use pool.ntp.org
>
>
> I'm not sure that this is a very good idea.  The pool.ntp.org
> documentation is fairly explicit that they don't want this:
>
>
>         You must absolutely not use the default pool.ntp.org zone names
>         as the default configuration in your application or appliance.

So how we'll fix it? We need to fix it somehow. So give us an alternative t=
o us.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


