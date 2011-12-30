Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RgfBu-0005UA-5D
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Dec 2011 17:20:22 +0100
Received: by eaal1 with SMTP id l1so12565448eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2011 08:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=ncbd5lvX0Ja7eSYAPF/cXnbjfBMmQviTiQTqXzswM6M=;
	b=EZ1Xl3Y7d/1ifNTwvlU27NXo3C8dcrQKEFBrF8u2iW76jGsf3xW7CHyEJdzEpGdOfY
	ut0aI0KtOZHi/ygPIu0kycQ83FasB3JQeiusCgfChWhqH1KpOO/5NJvnkaBnPg0psXv7
	1nzXkLPVMoMVKrqGDMlb+ulLFTzc8S7oERhmE=
MIME-Version: 1.0
Received: by 10.205.42.130 with SMTP id ty2mr4410919bkb.55.1325261586256; Fri,
	30 Dec 2011 08:13:06 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.78.79 with HTTP; Fri, 30 Dec 2011 08:13:06 -0800 (PST)
In-Reply-To: <20111230155258.GJ16885@jama.jama.net>
References: <cover.1325248824.git.otavio@ossystems.com.br>
	<06b8fd4ed68ad3e735b54d661f66737048ce9597.1325248824.git.otavio@ossystems.com.br>
	<20111230130026.GH16885@jama.jama.net>
	<CAP9ODKredoCdpROP-4xjYMo5RAjj9Ctj_tGmET9ptTXgX4gaZQ@mail.gmail.com>
	<20111230155258.GJ16885@jama.jama.net>
Date: Fri, 30 Dec 2011 14:13:06 -0200
X-Google-Sender-Auth: R8FZbMpQ7PxkTuDf8TupXq_Fx9g
Message-ID: <CAP9ODKrwakHnEXZ_bSNo2QBrYszPN2pR54KC7UAwkh3KQeEJfw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH 3/3] task-x11: use xserver-nodm-init-systemd
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
X-List-Received-Date: Fri, 30 Dec 2011 16:20:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Dec 30, 2011 at 13:52, Martin Jansa <martin.jansa@gmail.com> wrote:

> Yes, but this is task-x11 not task-basic.. I wouldn't complain if you
> add it to task-basic.
>

In this case adding both is the way to go but I *hate* this solutin :-(

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

