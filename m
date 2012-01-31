Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rs22b-0005bA-If
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jan 2012 01:57:45 +0100
Received: by lahc1 with SMTP id c1so2497490lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2012 16:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=Yy/jMUZ51FECIUklhghlIYgvEQ4qv4wj5xrzxix0Tzk=;
	b=aodzRAHtupIJqb4G8M3YSdaiGhbx87uQi0/uaoU8Z8/Gwp/TcuOsgNVWci9Zoh1NeZ
	SXculoXXF/xo0yhEL60EOSdPCOIh8tRrm3kUi+vsht0YcgvaP9oRv7hBI6C/tXOen/5V
	nNgmXdLR+FxnOzH1+9XHwyv9JbDs4xtMpVPm8=
MIME-Version: 1.0
Received: by 10.152.132.104 with SMTP id ot8mr10236693lab.17.1327970992485;
	Mon, 30 Jan 2012 16:49:52 -0800 (PST)
Received: by 10.112.102.165 with HTTP; Mon, 30 Jan 2012 16:49:52 -0800 (PST)
In-Reply-To: <CALbNGRRL0MXsU52uBFknfeWa9=oEF2NXvZnfyggBY-1Qbes2aA@mail.gmail.com>
References: <1327954536-29427-1-git-send-email-tworaz666@gmail.com>
	<CALbNGRRL0MXsU52uBFknfeWa9=oEF2NXvZnfyggBY-1Qbes2aA@mail.gmail.com>
Date: Tue, 31 Jan 2012 01:49:52 +0100
Message-ID: <CALbNGRSNrso4sJrgBeXEcpBOA6MAdOFWWZ_4SszGMq96iUCEcQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xfce][PATCH] Add recipe for xarchiver 0.5.2.
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
X-List-Received-Date: Tue, 31 Jan 2012 00:57:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2012 at 1:42 AM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> On Mon, Jan 30, 2012 at 9:15 PM, Peter Tworek <tworaz666@gmail.com> wrote=
:
>
>> +RRECOMMENDS =3D "lzop zip"
> This should be RRECOMMENDS_${PN}
>
> Just had a run test. If I open a tar.bz2 file, the contents remain
> empty. For test I installed tar on my machine and it works fine then.
> Can you add 'tar' ( or is there somebody with a better recommendation?
> ) to RRECOMMENDS_{PN}?
better =3D faster

>
> Andreas


